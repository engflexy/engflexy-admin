import {ChangeDetectionStrategy, ChangeDetectorRef, Component, Input, OnInit, ViewEncapsulation} from '@angular/core';
import {UntypedFormBuilder, UntypedFormGroup} from '@angular/forms';
import {user} from "../../../../../../mock-api/common/user/data";
import {UserDto} from "../../../../../../zynerator/security/shared/model/User.model";
import {UserService} from "../../../../../../core/user/user.service";
import {
    EtudiantCollaboratorService
} from "../../../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";

@Component({
    selector: 'settings-notifications',
    templateUrl: './notifications.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class SettingsNotificationsComponent implements OnInit {
/*
    notificationsForm: UntypedFormGroup;
*/
    @Input() user: UserDto = new UserDto();

    /**
     * Constructor
     */
    constructor(
/*
        private _formBuilder: UntypedFormBuilder,
*/
        private userService: UserService,
        private ref: ChangeDetectorRef,
        private etudiantService: EtudiantCollaboratorService,
    ) {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        // Create the form
        /*this.notificationsForm = this._formBuilder.group({
            communication: [true],
            security: [true],
            meetups: [false],
            comments: [false],
            mention: [true],
            lesson: [true],
            inquiry: [true],
        });*/
        if (this.user && this.user.id) {
            this.etudiantService.get(this.user.id)
                .subscribe(
                    res => {
                        this.user = res;
                        console.log('User fetched:', this.user);
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error fetching user:', error);
                    }
                );
        } else {
            console.error('User ID is undefined or null');
        }
    }


   /* protected readonly user = user;
    protected readonly user = user;*/
    onCommunicationEnabledToggle(): void {
        if (this.user && this.user.id) {
            this.etudiantService.onCommunicationEnabled(this.user.id, this.user.communicationEnabled)
                .subscribe(
                    () => {
                        console.log('Account status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account status:', error);
                        this.user.communicationEnabled = !this.user.communicationEnabled;
                        this.ref.markForCheck();
                    }
                );
        }
    }
    onSecurityEnabled(): void {
        if (this.user && this.user.id) {
            this.etudiantService.onSecurityEnabled(this.user.id, this.user.securityEnabled)
                .subscribe(
                    () => {
                        console.log('Account status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account status:', error);
                        this.user.securityEnabled = !this.user.securityEnabled;
                        this.ref.markForCheck();
                    }
                );
        }
    }
    onLessonReminderEnabled(): void {
        if (this.user && this.user.id) {
            this.etudiantService.onLessonReminderEnabled(this.user.id, this.user.lessonReminderEnabled)
                .subscribe(
                    () => {
                        console.log('Account status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account status:', error);
                        this.user.lessonReminderEnabled = !this.user.lessonReminderEnabled;
                        this.ref.markForCheck();
                    }
                );
        }
    }
    onClassroomEnabled(): void {
        if (this.user && this.user.id) {
            this.etudiantService.onClassroomEnabled(this.user.id, this.user.classroomEnabled)
                .subscribe(
                    () => {
                        console.log('Account status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account status:', error);
                        this.user.classroomEnabled = !this.user.classroomEnabled;
                        this.ref.markForCheck();
                    }
                );
        }
    }
    onPasswordChangedNotificationEnabled(): void {
        if (this.user && this.user.id) {
            this.etudiantService.onPasswordChangedNotificationEnabled(this.user.id, this.user.passwordChangedNotificationEnabled)
                .subscribe(
                    () => {
                        console.log('Account status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account status:', error);
                        this.user.passwordChangedNotificationEnabled = !this.user.passwordChangedNotificationEnabled;
                        this.ref.markForCheck();
                    }
                );
        }
    }
    onContactNotificationEnabled(): void {
        if (this.user && this.user.id) {
            this.etudiantService.onContactNotificationEnabled(this.user.id, this.user.contactNotificationEnabled)
                .subscribe(
                    () => {
                        console.log('Account status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account status:', error);
                        this.user.contactNotificationEnabled = !this.user.contactNotificationEnabled;
                        this.ref.markForCheck();
                    }
                );
        }
    }

}
