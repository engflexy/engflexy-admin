import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, filter, firstValueFrom, map, Observable, of, Subscription, switchMap, take, tap, throwError } from 'rxjs';
import { Chat, Contact, Profile } from "./chat.types";
import { UserDto } from 'app/zynerator/security/shared/model/User.model';
import { MessageResponse } from './interfaces/message-response';
import { ConversationResponse } from './interfaces/conversation-response';
import { MessageRequest } from './interfaces/message-request';
import { WebSocketResponse } from './interfaces/web-socket-response';
import { TokenService } from 'app/zynerator/security/shared/service/Token.service';
import { StompService } from './stomp.service';

@Injectable({ providedIn: 'root' })
export class ChatService {
    private _chats: BehaviorSubject<Chat[]> = new BehaviorSubject(null);
    private _contact: BehaviorSubject<Contact> = new BehaviorSubject(null);
    private _contacts: BehaviorSubject<Contact[]> = new BehaviorSubject(null);
    private _profile: BehaviorSubject<Profile> = new BehaviorSubject(null);

    private _chat: BehaviorSubject<Chat> = new BehaviorSubject(null);
    private _users: BehaviorSubject<UserDto[]> = new BehaviorSubject<UserDto[]>([]);
    private _selectedConversationSubject: BehaviorSubject<MessageResponse[]> = new BehaviorSubject<MessageResponse[]>([]);
    public _selectedConversationReceiverId: number = -1;
    public _selectedConversationReceiverName: string = '';
    public _selectedConversationId: number = -1;
    public stompConvSub: Subscription | undefined;
    public _userConversations: ConversationResponse[] = [];
    currentUserId: number;

    public currentUserAvatar = "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png";

    /**
     * Constructor
     */
    constructor(private _httpClient: HttpClient, private stomp: StompService, private _tokenService: TokenService,
    ) {
        const tokenDecoded = this._tokenService.decode();
        this.currentUserId = tokenDecoded?.id;
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Accessors
    // -----------------------------------------------------------------------------------------------------

    /**
     * Getter for chat
     */

    async fetchUsersexceptThisUser(userId: number): Promise<void> {
        console.log("fetchUsersexceptThisUser")
        const users = await firstValueFrom(this._httpClient.get<UserDto[]>('http://localhost:8036/api/user/except/' + this.currentUserId));
        this._users.next(users);
    }

    async subscribeToCurrentUserConversation(userId: number): Promise<void> {
        console.log("subscribeToCurrentUserConversation");

        try {
            const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));
            await delay(1000);

            await this.stomp.subscribe(
                'user/' + userId,
                async (payload: any) => {
                    const res: WebSocketResponse = payload;

                    if (res.type == 'ALL') {
                        this._userConversations = res.data;
                        console.log(this._userConversations)

                        /*
                        const currentConversation = this._selectedConversationSubject.value;

                        const updatedConversation = [...currentConversation, messageResponse];

                        // Update the BehaviorSubject with the new conversation array
                        this.setSelectedConversation(updatedConversation);
*/


                        const found = this._userConversations.find(
                            (item) => item.conversationId === this._selectedConversationId
                        );
                        if (found === undefined) {
                            this.onCloseChat();
                        }
                    }
                }
            );

            await this.stomp.send('user', { userId });
            console.log("_userConversations" + this._userConversations)
        } catch (error) {
            console.error('Error subscribing to user conversation:', error);
        }

    }


    onConversationSelected(index: number) {
        console.log("onConversationSelected");
        this._selectedConversationId = this._userConversations[index].conversationId;
        this._selectedConversationReceiverId = this._userConversations[index].otherUserId;
        this._selectedConversationReceiverName = this._userConversations[index].otherUserName;

        this.setConversation();
    }

    onUserSelected(receiverId: number, receiverName: string, currentUserId: number): Promise<void> {
        console.log("onUserSelected");
        this._selectedConversationReceiverId = receiverId;
        this._selectedConversationReceiverName = receiverName;

        return new Promise((resolve) => {
            this.getConversationIdByUser1IdAndUser2Id(receiverId, currentUserId)
                .subscribe(async (res: number) => {
                    this._selectedConversationId = res;
                    await this.setConversation();
                    resolve();
                });
        });

    }

    async setConversation() {
        console.log("setConversation");

        this.stompConvSub?.unsubscribe();

        this.stomp.subscribe(
            'conv/' + this._selectedConversationId,
            (payload: any) => {
                let res: WebSocketResponse = payload;
                if (res.type == 'ALL') {
                    this.setSelectedConversation(res.data);
                } else if (res.type == 'ADDED') {
                    //console.log(res.data)
                    /*
                    let msg: MessageResponse;

                    msg.message = res.data.message;
                    msg.messageId = res.data.messageId;
                    msg.receiverId = res.data.receiverId;
                    */

                    this.addMessageToSelectedConversation(res.data);
                }
            }
        ).then(subscription => {
            this.stompConvSub = subscription;
        }).catch(error => {
            console.error('Subscription failed', error);
        });

        this.stomp.send('conv', this._selectedConversationId);
    }

    async sendMessage(message: string, currentUserId: number, selectedConversationId: number, selectedConversationReceiverId: number): Promise<void> {
        console.log("sendMessage");

        const timestamp = new Date();
        let body: MessageRequest = {
            conversationId: selectedConversationId,
            senderId: currentUserId,
            receiverId: selectedConversationReceiverId,
            message: message.trim(),
            timestamp: timestamp,
        };

        try {
            await this.stomp.send('sendMessage', body);
            await this.setConversation();
        } catch (error) {
            console.error('Error sending message:', error);
        }
    }

    onCloseChat() {
        this.stompConvSub?.unsubscribe();
        this._selectedConversationId = -1;
    }

    get users$(): Observable<UserDto[]> {
        return this._users.asObservable();
    }

    get selectedConversation$(): Observable<MessageResponse[]> {
        return this._selectedConversationSubject.asObservable();
    }

    private setSelectedConversation(conversation: MessageResponse[]): void {
        this._selectedConversationSubject.next(conversation);
    }

    private addMessageToSelectedConversation(message: MessageResponse): void {
        //message.senderId = this.currentUserId;
        console.log(message)
        const updatedConversation = [...this._selectedConversationSubject.value, message];
        this.setSelectedConversation(updatedConversation);
    }

    getConversationIdByUser1IdAndUser2Id(user1Id: number, user2Id: number): Observable<number> {
        return this._httpClient.get<number>('http://localhost:8036/api/user/conversation/user1Id/' + user1Id + '/user2Id/' + user2Id);
    }

    resetChat(): void {
        this._chat.next(null);
    }








    get chat$(): Observable<Chat> {
        return this._chat.asObservable();
    }

    /**
     * Getter for chats
     */
    get chats$(): Observable<Chat[]> {
        return this._chats.asObservable();
    }

    /**
     * Getter for contact
     */
    get contact$(): Observable<Contact> {
        return this._contact.asObservable();
    }

    /**
     * Getter for contacts
     */
    get contacts$(): Observable<Contact[]> {
        return this._contacts.asObservable();
    }

    /**
     * Getter for profile
     */
    get profile$(): Observable<Profile> {
        return this._profile.asObservable();
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Get chats
     */
    getChats(): Observable<any> {
        return this._httpClient.get<Chat[]>('api/apps/chat/chats').pipe(
            tap((response: Chat[]) => {
                this._chats.next(response);
            }),
        );
    }

    /**
     * Get contact
     *
     * @param id
     */
    getContact(id: string): Observable<any> {
        return this._httpClient.get<Contact>('api/apps/chat/contacts', { params: { id } }).pipe(
            tap((response: Contact) => {
                this._contact.next(response);
            }),
        );
    }

    /**
     * Get contacts
     */
    getContacts(): Observable<any> {
        return this._httpClient.get<Contact[]>('api/apps/chat/contacts').pipe(
            tap((response: Contact[]) => {
                this._contacts.next(response);
            }),
        );
    }

    /**
     * Get profile
     */
    getProfile(): Observable<any> {
        return this._httpClient.get<Profile>('api/apps/chat/profile').pipe(
            tap((response: Profile) => {
                this._profile.next(response);
            }),
        );
    }

    /**
     * Get chat
     *
     * @param id
     */
    getChatById(id: string): Observable<any> {
        return this._httpClient.get<Chat>('api/apps/chat/chat', { params: { id } })
            .pipe(
                map((chat) => {
                    // Update the chat
                    this._chat.next(chat);

                    // Return the chat
                    return chat;
                }),
                switchMap((chat) => {
                    if (!chat) {
                        return throwError('Could not found chat with id of ' + id + '!');
                    }

                    return of(chat);
                }),
            );
    }

    /**
     * Update chat
     *
     * @param id
     * @param chat
     */
    updateChat(id: string, chat: Chat): Observable<Chat> {
        return this.chats$.pipe(
            take(1),
            switchMap(chats => this._httpClient.patch<Chat>('api/apps/chat/chat', {
                id,
                chat,
            }).pipe(
                map((updatedChat) => {
                    // Find the index of the updated chat
                    const index = chats.findIndex(item => item.id === id);

                    // Update the chat
                    chats[index] = updatedChat;

                    // Update the chats
                    this._chats.next(chats);

                    // Return the updated contact
                    return updatedChat;
                }),
                switchMap(updatedChat => this.chat$.pipe(
                    take(1),
                    filter(item => item && item.id === id),
                    tap(() => {
                        // Update the chat if it's selected
                        this._chat.next(updatedChat);

                        // Return the updated chat
                        return updatedChat;
                    }),
                )),
            )),
        );
    }

    /**
     * Reset the selected chat
     */

}
