import { CommonModule, NgClass, NgFor, NgIf } from '@angular/common';
import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnDestroy, OnInit, ViewEncapsulation } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatMenuModule } from '@angular/material/menu';
import { MatSidenavModule } from '@angular/material/sidenav';
import { RouterLink, RouterOutlet } from '@angular/router';
import { BehaviorSubject, firstValueFrom, Subject, takeUntil } from 'rxjs';
import { NewChatComponent } from "../new-chat/new-chat.component";
import { ProfileComponent } from "../profile/profile.component";
import { Chat, Profile } from "../chat.types";
import { ChatService } from "../chat.service";
import { TokenService } from 'app/zynerator/security/shared/service/Token.service';
import { ConversationResponse } from '../interfaces/conversation-response';

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



    chats: Chat[];
    currentUserId: number;


    staticProfile: Profile = {
        id: '1',
        name: 'John Doe',
        email: 'john.doe@example.com',
        avatar: 'https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png',
        about: 'Software developer with a passion for creating web applications.',
    };


    /**
     * Constructor
     */
    constructor(
        public _chatService: ChatService,
        private _changeDetectorRef: ChangeDetectorRef,
        private _tokenService: TokenService,
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

        this._chatService.subscribeToCurrentUserConversation(this.currentUserId);
        this.loadUserConversations();
        this._chatService.fetchUserConversations(this.currentUserId);


        // Subscribe to the conversations observable
        this._chatService.userConversations$
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe(conversations => {
                this.userConversations = conversations;
                this._changeDetectorRef.markForCheck(); // Mark for check to update the view
                this.filteredConversations = conversations; // Initialize filteredConversations with all conversations
            });

        // Fetch initial conversations


        //console.log(this.userConversations)

        this.profile = this.staticProfile;

    }

    

    async loadUserConversations(): Promise<void> {
        try {
            await this._chatService.fetchUserConversations(this.currentUserId);
            this.userConversations = await firstValueFrom(this._chatService.userConversations$);
        } catch (error) {
            console.error('Error loading user conversations:', error);
        }
    }

    /**
     * On destroy
     */
    ngOnDestroy(): void {
        // Unsubscribe from all subscriptions
        this._unsubscribeAll.next(null);
        this._unsubscribeAll.complete();
    }

    onChatClick(chat: ConversationResponse) {
        console.log(chat)
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
