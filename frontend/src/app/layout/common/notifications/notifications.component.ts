import { Overlay, OverlayRef } from '@angular/cdk/overlay';
import { TemplatePortal } from '@angular/cdk/portal';
import { DatePipe, NgClass, NgFor, NgIf, NgTemplateOutlet } from '@angular/common';
import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnDestroy, OnInit, TemplateRef, ViewChild, ViewContainerRef, ViewEncapsulation } from '@angular/core';
import { MatButton, MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatTooltipModule } from '@angular/material/tooltip';
import { RouterLink } from '@angular/router';
import { NotificationsService } from 'app/layout/common/notifications/notifications.service';
import { NotificationActeurCollaboratorService } from '../../../shared/service/collaborator/notif/NotificationActeurCollaborator.service';
import { NotificationActeurDto } from '../../../shared/model/notif/NotificationActeur.model';
import { AuthService } from '../../../zynerator/security/shared/service/Auth.service';
import { Subject, takeUntil } from 'rxjs';

@Component({
    selector: 'notifications',
    templateUrl: './notifications.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    exportAs: 'notifications',
    standalone: true,
    imports: [MatButtonModule, NgIf, MatIconModule, MatTooltipModule, NgFor, NgClass, NgTemplateOutlet, RouterLink, DatePipe],
})
export class NotificationsComponent implements OnInit, OnDestroy {
    @ViewChild('notificationsOrigin') private _notificationsOrigin: MatButton;
    @ViewChild('notificationsPanel') private _notificationsPanel: TemplateRef<any>;

    notifications: NotificationActeurDto[];
    unreadCount: number = 0;
    private _overlayRef: OverlayRef;
    private _unsubscribeAll: Subject<any> = new Subject<any>();

    /**
     * Constructor
     */
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private _notificationsService: NotificationsService,
        private notificationActeurCollaboratorService: NotificationActeurCollaboratorService,
        private authService: AuthService,
        private _overlay: Overlay,
        private _viewContainerRef: ViewContainerRef
    ) { }

    /**
     * On init
     */
    ngOnInit(): void {
        const authenticatedUser = this.authService.authenticatedUser;
        console.log('communicationEnabled : ',authenticatedUser.communicationEnabled);
        console.log('classroomEnabled :',authenticatedUser.classroomEnabled);
        console.log('contactNotificationEnabled: ', authenticatedUser.contactNotificationEnabled);
        console.log('lessonReminderEnabled : ',authenticatedUser.lessonReminderEnabled);
        console.log('passwordChangedNotificationEnabled : ',authenticatedUser.passwordChangedNotificationEnabled);
        console.log('securityEnabled : ',authenticatedUser.securityEnabled);
        this.notificationActeurCollaboratorService.findByUserUsername(authenticatedUser.username)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe((notifications: NotificationActeurDto[]) => {
                this.notifications = notifications.map(notification => {
                 /*  console.log('Haaaaaaaa time:', notification.time);
                    console.log('Is Date:', notification.time instanceof Date);*/
                    return notification;
                });

                this._calculateUnreadCount();
                this._changeDetectorRef.markForCheck();
            });
    }

    /**
     * On destroy
     */
    ngOnDestroy(): void {
        // Unsubscribe from all subscriptions
        this._unsubscribeAll.next(null);
        this._unsubscribeAll.complete();

        // Dispose the overlay
        if (this._overlayRef) {
            this._overlayRef.dispose();
        }
    }

    /**
     * Open the notifications panel
     */
    openPanel(): void {
        // Return if the notifications panel or its origin is not defined
        if (!this._notificationsPanel || !this._notificationsOrigin) {
            return;
        }

        // Create the overlay if it doesn't exist
        if (!this._overlayRef) {
            this._createOverlay();
        }

        // Fetch notifications if not already loaded
        if (!this.notifications) {
            this.ngOnInit();
        }

        // Attach the portal to the overlay
        this._overlayRef.attach(new TemplatePortal(this._notificationsPanel, this._viewContainerRef));
    }

    /**
     * Close the notifications panel
     */
    closePanel(): void {
        this._overlayRef.detach();
    }

    /**
     * Fetch notifications
     */
  /*  private _fetchNotifications(): void {
        const authenticatedUser = this.authService.authenticatedUser;
        this.notificationActeurCollaboratorService.findByUserUsername(authenticatedUser.username)
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe((notifications: NotificationActeurDto[]) => {
                this.notifications = notifications.map(notification => {
          /!*          console.log('Original time:', notification.time);
                    console.log('Is Date:', notification.time instanceof Date);*!/
                    return notification;
                });

                this._calculateUnreadCount();
                this._changeDetectorRef.markForCheck();
            });
    }
*/
    /**
     * Create the overlay
     */
    private _createOverlay(): void {
        // Create the overlay
        this._overlayRef = this._overlay.create({
            hasBackdrop: true,
            backdropClass: 'fuse-backdrop-on-mobile',
            scrollStrategy: this._overlay.scrollStrategies.block(),
            positionStrategy: this._overlay.position()
                .flexibleConnectedTo(this._notificationsOrigin._elementRef.nativeElement)
                .withLockedPosition(true)
                .withPush(true)
                .withPositions([
                    {
                        originX: 'start',
                        originY: 'bottom',
                        overlayX: 'start',
                        overlayY: 'top',
                    },
                    {
                        originX: 'start',
                        originY: 'top',
                        overlayX: 'start',
                        overlayY: 'bottom',
                    },
                    {
                        originX: 'end',
                        originY: 'bottom',
                        overlayX: 'end',
                        overlayY: 'top',
                    },
                    {
                        originX: 'end',
                        originY: 'top',
                        overlayX: 'end',
                        overlayY: 'bottom',
                    },
                ]),
        });

        // Detach the overlay from the portal on backdrop click
        this._overlayRef.backdropClick().subscribe(() => {
            this._overlayRef.detach();
        });
    }

    /**
     * Calculate the unread count
     *
     * @private
     */
    private _calculateUnreadCount(): void {
        let count = 0;

        if (this.notifications && this.notifications.length) {
            count = this.notifications.filter(notification => !notification.read).length;
        }

        this.unreadCount = count;
    }
}
