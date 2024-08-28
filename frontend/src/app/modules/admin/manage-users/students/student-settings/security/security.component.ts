import { ChangeDetectionStrategy, ChangeDetectorRef, Component, Input, OnInit, ViewEncapsulation } from '@angular/core';
import { UntypedFormGroup } from '@angular/forms';
import { UserService } from "../../../../../../core/user/user.service";
import { UserDto } from "../../../../../../zynerator/security/shared/model/User.model";
import { EtudiantCollaboratorService } from "../../../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import {ActivatedRoute} from "@angular/router";
import {EtudiantDto} from "../../../../../../shared/model/inscription/Etudiant.model";

@Component({
    selector: 'settings-security',
    templateUrl: './security.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class SettingsSecurityComponent implements OnInit {
    securityForm: UntypedFormGroup;
    @Input() user: EtudiantDto = new EtudiantDto(); // Default value to prevent undefined
    newPassword: string;
    hidePassword: boolean = true;

    constructor(
        private userService: UserService,
        private ref: ChangeDetectorRef,
        private etudiantService: EtudiantCollaboratorService,
        private route: ActivatedRoute,

    ) {}

    ngOnInit(): void {
        const email = this.route.snapshot.params.email;
        if ( email) {
            this.etudiantService.findByUserName(email)
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

    onEnabledToggle(): void {
        if (this.user && this.user.id) {
            this.etudiantService.updateAccountStatus(this.user.id, this.user.enabled)
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
            this.etudiantService.updateAccountNonExpiredStatus(this.user.id, this.user.accountNonExpired)
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
            this.etudiantService.updateAccountLockStatus(this.user.id, this.user.accountNonLocked)
                .subscribe(
                    () => {
                        console.log('Account lock status updated successfully');
                        this.ref.markForCheck();
                    },
                    error => {
                        console.error('Error updating account lock status:', error);
                        this.user.accountNonLocked = !this.user.accountNonLocked;
                    }
                );
        }
    }

    onCredentialsNonExpiredToggle(): void {
        if (this.user && this.user.id) {
            this.etudiantService.updateCredentialsNonExpiredStatus(this.user.id, this.user.credentialsNonExpired)
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
            this.etudiantService.updatePasswordChangedStatus(this.user.id, this.user.passwordChanged)
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
            this.etudiantService.changePassword(this.user.username, this.newPassword)
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
            console.error('User or new password is undefined');
        }
    }
}
