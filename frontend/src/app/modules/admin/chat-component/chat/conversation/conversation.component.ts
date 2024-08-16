import { TextFieldModule } from '@angular/cdk/text-field';
import { DatePipe, NgClass, NgFor, NgIf, NgTemplateOutlet } from '@angular/common';
import { ChangeDetectionStrategy, ChangeDetectorRef, Component, ElementRef, HostListener, NgZone, OnDestroy, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatMenuModule } from '@angular/material/menu';
import { MatSidenavModule } from '@angular/material/sidenav';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { FuseMediaWatcherService } from '@fuse/services/media-watcher';
import { Subject, Subscription, takeUntil } from 'rxjs';
import { ChatService } from "../chat.service";
import { Chat } from "../chat.types";
import { ContactInfoComponent } from "../contact-info/contact-info.component";
import { UserDto } from 'app/zynerator/security/shared/model/User.model';
import { MessageResponse } from '../interfaces/message-response';
import { PickerComponent } from '@ctrl/ngx-emoji-mart';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';
import { ConversationResponse } from '../interfaces/conversation-response';

@Component({
    selector: 'chat-conversation',
    templateUrl: './conversation.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    standalone: true,
    imports: [PickerComponent, NgIf, MatSidenavModule, ContactInfoComponent, MatButtonModule, RouterLink, MatIconModule, MatMenuModule, NgFor, NgClass, NgTemplateOutlet, MatFormFieldModule, MatInputModule, TextFieldModule, DatePipe],
})
export class ConversationComponent implements OnInit, OnDestroy {
    @ViewChild('messageInput') messageInput: ElementRef;
    @ViewChild('emojiPicker') emojiPicker: ElementRef;
    chat: Chat;
    drawerMode: 'over' | 'side' = 'side';
    drawerOpened: boolean = false;
    private _unsubscribeAll: Subject<any> = new Subject<any>();

    user: UserDto;
    message: string = '';
    selectedConversationId: number;
    selectedConversationReceiverId: number;
    selectedConversationReceiverName: string;
    selectedConversation: MessageResponse[] = [];
    currentUserId: number;
    private selectedConversationSub: Subscription;
    showEmojiPicker = false;
    allConversations: ConversationResponse[] = [];
    foundConversation: ConversationResponse;
    /**
     * Constructor
     */
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private _chatService: ChatService,
        private _fuseMediaWatcherService: FuseMediaWatcherService,
        private _ngZone: NgZone,
        private router: Router,
        private sanitizer: DomSanitizer,
    ) {
        const navigation = this.router.getCurrentNavigation();
        if (navigation?.extras?.state) {
            this.user = navigation.extras.state['user'];
            this.currentUserId = navigation.extras.state['currentUserId'];            
            this.allConversations = navigation.extras.state['conversations']
        }
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Decorated methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Resize on 'input' and 'ngModelChange' events
     *
     * @private
     */
    @HostListener('input')
    @HostListener('ngModelChange')
    private _resizeMessageInput(): void {
        // This doesn't need to trigger Angular's change detection by itself
        this._ngZone.runOutsideAngular(() => {
            setTimeout(() => {
                // Set the height to 'auto' so we can correctly read the scrollHeight
                this.messageInput.nativeElement.style.height = 'auto';

                // Detect the changes so the height is applied
                this._changeDetectorRef.detectChanges();

                // Get the scrollHeight and subtract the vertical padding
                this.messageInput.nativeElement.style.height = `${this.messageInput.nativeElement.scrollHeight}px`;

                // Detect the changes one more time to apply the final height
                this._changeDetectorRef.detectChanges();
            });
        });
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {

        // Subscribe to selectedConversation observable
        this.selectedConversationSub = this._chatService.selectedConversation$.subscribe(conversation => {
            this.selectedConversation = conversation;
            this.selectedConversationId = this._chatService._selectedConversationId;
            this.selectedConversationReceiverId = this._chatService._selectedConversationReceiverId;
            this.selectedConversationReceiverName = this._chatService._selectedConversationReceiverName;

            this._changeDetectorRef.markForCheck();
        });



        //console.log(this.selectedConversationId + "    " + this._chatService.updateConversationSeenToFalseById(this.selectedConversationId))

        // Subscribe to media changes
        this._fuseMediaWatcherService.onMediaChange$
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe(({ matchingAliases }) => {
                // Set the drawerMode if the given breakpoint is active
                if (matchingAliases.includes('lg')) {
                    this.drawerMode = 'side';
                }
                else {
                    this.drawerMode = 'over';
                }

                // Mark for check
                this._changeDetectorRef.markForCheck();
            });

            this.foundConversation = this.allConversations.find(conversation => conversation.conversationId == this.selectedConversationId);

            if(this.foundConversation.lastReceiverId == this.currentUserId){
                this.markConversationAsSeen(this.selectedConversationId)
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

    markConversationAsNotSeen(conversationId: number): void {
        this._chatService.updateConversationSeenToFalseById(conversationId).subscribe({
            next: (result: boolean) => {
                console.log('Conversation seen status updated:', result);
            },
            error: (error) => {
                console.error('Error updating conversation seen status:', error);
            }
        });
    }


    sendMessage(messageInput: HTMLTextAreaElement): void {
        console.log('Message:', messageInput.value); // Log the message
        if (messageInput.value.trim() != "") {
            this._chatService.sendMessage(messageInput.value, this.currentUserId, this.selectedConversationId, this.selectedConversationReceiverId)
            messageInput.value = ''; // Clear the textarea  
            //this.markConversationAsNotSeen(this.selectedConversationId)
        }
        if (this.showEmojiPicker) {
            this.showEmojiPicker = !this.showEmojiPicker;
        }

        //if(this.foundConversation.lastReceiverId == this.currentUserId){
        //}

        this.markConversationAsNotSeen(this.selectedConversationId)

    }

    /**
     * On destroy
     */
    ngOnDestroy(): void {
        // Unsubscribe from all subscriptions
        this._unsubscribeAll.next(null);
        this._unsubscribeAll.complete();

        // Unsubscribe from selected conversation observable
        if (this.selectedConversationSub) {
            this.selectedConversationSub.unsubscribe();
        }
    }

    sanitizeMessage(message: string): SafeHtml {
        // This pattern matches http, https, and plain text URLs (like google.com)
        const urlPattern = /((https?:\/\/)?[\w.-]+\.[a-z]{2,})(\/[^\s]*)?/gi;
        const sanitizedMessage = message.replace(
            urlPattern,
            (url) => {
                // If the URL doesn't start with http/https, prepend it with https://
                const href = url.startsWith('http') ? url : `https://${url}`;
                return `<a href="${href}" target="_blank" style="color: blue; text-decoration: underline;">${url}</a>`;
            }
        );
        return this.sanitizer.bypassSecurityTrustHtml(sanitizedMessage);
    }



    // Listen for clicks on the entire document
    @HostListener('document:click', ['$event'])
    clickOutside(event: Event) {
        if (this.showEmojiPicker && this.emojiPicker && !this.emojiPicker.nativeElement.contains(event.target)) {
            this.showEmojiPicker = false;
        }
    }

    toggleEmojiPicker(event: Event) {
        event.stopPropagation(); // Prevent the click event from propagating to the document listener
        this.showEmojiPicker = !this.showEmojiPicker;
    }

    addEmoji(event: any) {
        const { emoji } = event;
        const textArea = this.messageInput.nativeElement;
        if (textArea) {
            textArea.value += emoji.native; // Append the emoji to the text area content
            textArea.focus(); // Set focus on the text area
        }
    }


    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Open the contact info
     */
    openContactInfo(): void {
        // Open the drawer
        this.drawerOpened = true;

        // Mark for check
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Reset the chat
     */
    resetChat(): void {
        this._chatService.resetChat();

        // Close the contact info in case it's opened
        this.drawerOpened = false;

        // Mark for check
        this._changeDetectorRef.markForCheck();
    }

    /**
     * Toggle mute notifications
     */
    toggleMuteNotifications(): void {
        // Toggle the muted
        this.chat.muted = !this.chat.muted;

        // Update the chat on the server
        this._chatService.updateChat(this.chat.id, this.chat).subscribe();
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
