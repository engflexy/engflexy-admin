import {ChangeDetectionStrategy, ChangeDetectorRef, Component, Input, OnInit, ViewEncapsulation} from '@angular/core';
import {UntypedFormGroup} from '@angular/forms';
import {UserService} from "../../../../../../core/user/user.service";
import {UserDto} from "../../../../../../zynerator/security/shared/model/User.model";

@Component({
    selector: 'settings-security',
    templateUrl: './security.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class SettingsSecurityComponent implements OnInit {
    securityForm: UntypedFormGroup;
    @Input()
    user: UserDto = new UserDto()

    /**
     * Constructor
     */
    constructor(
        private userService: UserService,
        private ref: ChangeDetectorRef,
    ) {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        console.log(this.user)
        this.userService.get(this.user.id)
            .subscribe(res => {
                console.log(res)
                this.user = res
                this.ref.markForCheck()
            })
    }


}
