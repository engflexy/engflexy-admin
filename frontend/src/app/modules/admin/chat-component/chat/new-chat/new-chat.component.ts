import { NgFor, NgIf } from '@angular/common';
import { ChangeDetectionStrategy, ChangeDetectorRef, Component, Input, OnDestroy, OnInit, ViewEncapsulation } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatDrawer } from '@angular/material/sidenav';
import { Subject, Subscription, takeUntil } from 'rxjs';
import { Contact } from "../chat.types";
import { ChatService } from "../chat.service";
import { NavigationExtras, Router, RouterLink, RouterOutlet } from '@angular/router';
import { UserDto } from 'app/zynerator/security/shared/model/User.model';
import { TokenService } from 'app/zynerator/security/shared/service/Token.service';
import { StompService } from '../stomp.service';

@Component({
    selector: 'chat-new-chat',
    templateUrl: './new-chat.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    standalone: true,
    imports: [MatButtonModule, MatIconModule, NgIf, NgFor, RouterLink, RouterOutlet],
})
export class NewChatComponent implements OnInit, OnDestroy {
    @Input() drawer: MatDrawer;
    contacts: Contact[] = [];

    private _unsubscribeAll: Subject<any> = new Subject<any>();
    users: UserDto[] = [];
    private selectedConversationSub: Subscription;
    currentUserId: number;

    /**
     * Constructor
     */
    constructor(
        private _chatService: ChatService,
        private _tokenService: TokenService,
        private cdRef: ChangeDetectorRef,
        private _changeDetectorRef: ChangeDetectorRef,
        private stomp: StompService,
        private router: Router
    ) {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {

        const tokenDecoded = this._tokenService.decode();
        this.currentUserId = tokenDecoded?.id;
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
            //if (conversation.length > 0) {
            this.navigateToConversation();
            //}
        });

    }

    async onUserClick(user: UserDto): Promise<void> {
        await this._chatService.onUserSelected(user.id, "collaborator", this.currentUserId);
    }

    private navigateToConversation(): void {
        const selectedUser = this.users.find(user => user.id === this._chatService._selectedConversationReceiverId);


        if (selectedUser) {
            const navigationExtras: NavigationExtras = {
                state: {
                    currentUserId: this.currentUserId,
                    user: selectedUser,
                }
            };

            this.router.navigate(['/admin/chat', 'conv'], navigationExtras);
        }
    }

    openNewChat(): void {
        //this.drawerOpened = false;
        this._changeDetectorRef.markForCheck();
    }

    /**
     * On destroy
     */
    ngOnDestroy(): void {
        // Unsubscribe from all subscriptions
        this._unsubscribeAll.next(null);
        this._unsubscribeAll.complete();

        if (this.selectedConversationSub) {
            this.selectedConversationSub.unsubscribe();
        }
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Track by function for ngFor loops
     *
     * @param index
     * @param item
     */
    trackByFn(index: number, item: UserDto): number {
        return item.id;
    }
}
