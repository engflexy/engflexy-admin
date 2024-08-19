import { CommonModule, NgClass, NgFor, NgIf } from '@angular/common';
import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnDestroy, OnInit, ViewEncapsulation } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatMenuModule } from '@angular/material/menu';
import { MatSidenavModule } from '@angular/material/sidenav';
import { NavigationExtras, Router, RouterLink, RouterOutlet } from '@angular/router';
import { BehaviorSubject, firstValueFrom, Subject, Subscription, takeUntil } from 'rxjs';
import { NewChatComponent } from "../new-chat/new-chat.component";
import { ProfileComponent } from "../profile/profile.component";
import { Chat, Profile } from "../chat.types";
import { ChatService } from "../chat.service";
import { TokenService } from 'app/zynerator/security/shared/service/Token.service';
import { ConversationResponse } from '../interfaces/conversation-response';
import { UserDto } from 'app/zynerator/security/shared/model/User.model';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MessageResponse } from '../interfaces/message-response';

@Component({
    selector: 'chat-chats',
    templateUrl: './chats.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    standalone: true,
    imports: [MatSidenavModule, NgIf, NewChatComponent, ProfileComponent
        , MatButtonModule, MatIconModule, MatMenuModule, MatFormFieldModule, MatInputModule, NgFor, NgClass, RouterLink, RouterOutlet, CommonModule],
})
export class ChatsComponent implements OnInit, OnDestroy {
    drawerComponent: 'profile' | 'new-chat';
    drawerOpened: boolean = false;
    profile: Profile;
    selectedChat: Chat;
    private _unsubscribeAll: Subject<any> = new Subject<any>();
    userConversations: ConversationResponse[] = [];
    filteredConversations: ConversationResponse[] = [];
    private selectedConversationSub: Subscription;
    users: UserDto[] = [];


    changedConversationIds: number[] = [];
    newConversationIds: number[] = [];


    chats: Chat[];
    currentUserId: number;
    currentUserEmail: string;

    staticProfile: Profile = {
        id: '1',
        name: 'John Doe',
        email: 'john.doe@example.com',
        //avatar: 'https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png',
        about: 'Software developer with a passion for creating web applications.',
    };


    /**
     * Constructor
     */
    constructor(
        public _chatService: ChatService,
        private _changeDetectorRef: ChangeDetectorRef,
        private _tokenService: TokenService,
        private cdRef: ChangeDetectorRef,
        private router: Router

    ) {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    async ngOnInit(): Promise<void> {

        const tokenDecoded = this._tokenService.decode();
        this.currentUserId = tokenDecoded?.id;
        this.currentUserEmail = tokenDecoded?.email;

        this._chatService.subscribeToCurrentUserConversation(this.currentUserId);
        this.loadUserConversations();
        this._chatService.fetchUserConversations(this.currentUserId);


        // Subscribe to the conversations observable
        let previousConversations: ConversationResponse[] = [];


        this._chatService.userConversations$
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe(conversations => {
                this.changedConversationIds = [];
                this.newConversationIds = [];

                conversations.forEach((newConv, index) => {
                    const previousConv = previousConversations[index];

                    if (!previousConv) {
                        this.newConversationIds.push(newConv.conversationId); // Track new conversation
                    } else if (newConv.lastMessage !== previousConv.lastMessage || newConv.lastMessageTimestamp !== previousConv.lastMessageTimestamp) {
                        this.changedConversationIds.push(newConv.conversationId); // Track changed conversation
                    }
                });

                previousConversations = [...conversations];

                this.userConversations = conversations;
                this.filteredConversations = conversations;
                console.log(this.filteredConversations)                
                //console.log("this is iiiiit: " + this.userConversations)

                this._changeDetectorRef.markForCheck();
            });
        // Fetch initial conversations


        //console.log(this.userConversations)

        this.profile = this.staticProfile;

        this._chatService.fetchUsersexceptThisUser(this.currentUserId);

        this._chatService.users$
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe((users: UserDto[]) => {
                this.users = users;
                users.forEach(user => {
                    user.avatar = "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png";
                });
                this.cdRef.detectChanges(); // Manually trigger change detection
            });

        // Subscribe to selectedConversation observable
        this.selectedConversationSub = this._chatService.selectedConversation$.pipe(
            takeUntil(this._unsubscribeAll)
        ).subscribe(conversation => {
            // Log the conversation whenever it changes
            // Optional: Only navigate if the conversation has messages
            if (conversation.length > 0) {
                this.navigateToConversation();
            }
        });


    }



    async onChatClick(conversationResponse: ConversationResponse): Promise<void> {
        await this._chatService.onUserSelected(conversationResponse.otherUserId, "collaborator", this.currentUserId);
    }

    private navigateToConversation(): void {
        const selectedUser = this._chatService._users.value.find(user => user.id === this._chatService._selectedConversationReceiverId);

        if (selectedUser) {
            const navigationExtras: NavigationExtras = {
                state: {
                    currentUserId: this.currentUserId,
                    user: selectedUser,
                    conversations: this.userConversations
                }
            };

            this.router.navigate(['/admin/chat', 'conv'], navigationExtras);
        }
    }



    async loadUserConversations(): Promise<void> {
        try {
            await this._chatService.fetchUserConversations(this.currentUserId);
            this.userConversations = await firstValueFrom(this._chatService.userConversations$);
        } catch (error) {
            console.error('Error loading user conversations:', error);
        }
    }

    markConversationAsSeen(conversationId: number): void {
        this._chatService.updateConversationSeenToTrueById(conversationId).subscribe({
          next: (result: boolean) => {
            console.log('Conversation seen status updated:', result);
          },
          error: (error) => {
            console.error('Error updating conversation seen status:', error);
          }
        });
      }
    
    


    /**
     * On destroy
     */
    ngOnDestroy(): void {
        // Unsubscribe from all subscriptions
        this._unsubscribeAll.next(null);
        this._unsubscribeAll.complete();
    }



    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Filter the chats
     *
     * @param query
     */
    filterChats(query: string): void {
        // Reset the filter
        if (!query) {
            this.filteredConversations = this.userConversations;
            return;
        }

        this.filteredConversations = this.userConversations.filter(chat => chat.otherUserName.toLowerCase().includes(query.toLowerCase()));
    }

    /**
     * Open the new chat sidebar
     */
    openNewChat(): void {
        this.drawerComponent = 'new-chat';
        this.drawerOpened = true;

        // Mark for check
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Open the profile sidebar
     */
    openProfile(): void {
        this.drawerComponent = 'profile';
        this.drawerOpened = true;

        // Mark for check
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Track by function for ngFor loops
     *
     * @param index
     * @param item
     */
    trackByFn(index: number, item: any): any {
        return item.id || index;
    }
}
