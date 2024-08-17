import { ChangeDetectionStrategy, ChangeDetectorRef, Component, Input, OnInit, ViewEncapsulation } from '@angular/core';
import { UntypedFormGroup } from '@angular/forms';
import {ProfDto} from "../../../../../../shared/model/prof/Prof.model";
import {ProfCollaboratorService} from "../../../../../../shared/service/collaborator/prof/ProfCollaborator.service";
import {UserService} from "../../../../../../core/user/user.service";
import {UserDto} from "../../../../../../zynerator/security/shared/model/User.model";
import {CollaboratorDto} from "../../../../../../shared/model/vocab/Collaborator.model";
import {
    CollaboratorCollaboratorService
} from "../../../../../../shared/service/collaborator/vocab/CollaboratorCollaborator.service";


@Component({
    selector: 'collab-details-security',
    templateUrl: './security.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class CollaboratorSecurityComponent implements OnInit {
    securityForm: UntypedFormGroup;
   @Input() collaborator: CollaboratorDto = new CollaboratorDto(); // Default value to prevent undefined
    @Input() user: UserDto = new UserDto(); // Default value to prevent undefined
    newPassword: string;
    hidePassword: boolean = true;
  //  prof: ProfDto;

    constructor(private userService: UserService,
        private ref: ChangeDetectorRef,
        private collaboratorService: CollaboratorCollaboratorService,
    ) {}

    ngOnInit(): void {
        console.log('User before fetch:', this.user); // Check initial state
        if (this.user && this.user.id) {
            this.collaboratorService.get(this.user.id)
                .subscribe(
                    res => {
                        this.user = res;
                        console.log('Prof fetched:', this.user); // Verify fetched data
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error fetching prof:', error);
                    }
                );
        } else {
            console.error('Prof ID is undefined or null');
        }
    }

    onEnabledToggle(): void {
        if (this.user && this.user.id) {
            this.collaboratorService.updateAccountStatus(this.user.id, this.user.enabled)
                .subscribe(
                    () => {
                        console.log('Account status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account status:', error);
                        this.user.enabled = !this.user.enabled;
                        this.ref.markForCheck();
                    }
                );
        }
    }

    onAccountNonExpiredToggle(): void {
        if (this.user && this.user.id) {
            this.collaboratorService.updateAccountNonExpiredStatus(this.user.id, this.user.accountNonExpired)
                .subscribe(
                    () => {
                        console.log('Account non-expired status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account non-expired status:', error);
                        this.user.accountNonExpired = !this.user.accountNonExpired;
                        this.ref.markForCheck();
                    }
                );
        }
    }

    onAccountNonLockedToggle(): void {
        if (this.user && this.user.id) {
            this.collaboratorService.updateAccountLockStatus(this.user.id, this.user.accountNonLocked)
                .subscribe(
                    () => {
                        console.log('Account lock status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account lock status:', error);
                        this.user.accountNonLocked = !this.user.accountNonLocked;
                        this.ref.markForCheck();
                    }
                );
        }
    }

    onCredentialsNonExpiredToggle(): void {
        if (this.user && this.user.id) {
            this.collaboratorService.updateCredentialsNonExpiredStatus(this.user.id, this.user.credentialsNonExpired)
                .subscribe(
                    () => {
                        console.log('Credentials non-expired status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating credentials non-expired status:', error);
                        this.user.credentialsNonExpired = !this.user.credentialsNonExpired;
                        this.ref.markForCheck();
                    }
                );
        }
    }

    onPasswordChangedToggle(): void {
        if (this.user && this.user.id) {
            this.collaboratorService.updatePasswordChangedStatus(this.user.id, this.user.passwordChanged)
                .subscribe(
                    () => {
                        console.log('Password changed status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating password changed status:', error);
                        this.user.passwordChanged = !this.user.passwordChanged;
                        this.ref.markForCheck();
                    }
                );
        }
    }

    togglePasswordVisibility(): void {
        this.hidePassword = !this.hidePassword;
    }

    onChangePassword(): void {
        if (this.user && this.user.username && this.newPassword) {
            this.collaboratorService.changePassword(this.user.username, this.newPassword)
                .subscribe(
                    () => {
                        console.log('Password changed successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error changing password:', error);
                    }
                );
        } else {
            console.error('Prof or new password is undefined');
        }
    }
}
