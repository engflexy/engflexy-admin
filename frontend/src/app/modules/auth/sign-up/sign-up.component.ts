import {NgIf, NgOptimizedImage} from '@angular/common';
import {Component, OnInit, ViewEncapsulation} from '@angular/core';
import {FormsModule, ReactiveFormsModule, UntypedFormBuilder, UntypedFormGroup, Validators} from '@angular/forms';
import {MatButtonModule} from '@angular/material/button';
import {MatCheckboxModule} from '@angular/material/checkbox';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatIconModule} from '@angular/material/icon';
import {MatInputModule} from '@angular/material/input';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {Router, RouterLink} from '@angular/router';
import {fuseAnimations} from '@fuse/animations';
import {FuseAlertComponent, FuseAlertService} from '@fuse/components/alert';
import {UserPublicService} from "../../../shared/service/public/user.public.service";
import {MatOptionModule} from "@angular/material/core";
import {MatSelectModule} from "@angular/material/select";
import {CollaboratorDto} from "../../../shared/model/vocab/Collaborator.model";

@Component({
    selector: 'auth-sign-up',
    templateUrl: './sign-up.component.html',
    encapsulation: ViewEncapsulation.None,
    animations: fuseAnimations,
    standalone: true,
    imports: [RouterLink, NgIf, FuseAlertComponent, FormsModule, ReactiveFormsModule, MatFormFieldModule, MatInputModule, MatButtonModule, MatIconModule, MatCheckboxModule, MatProgressSpinnerModule, MatOptionModule, MatSelectModule, NgOptimizedImage],
})
export class AuthSignUpComponent implements OnInit {
    signUpForm: UntypedFormGroup;

    /**
     * Constructor
     */
    constructor(
        private alert: FuseAlertService,
        private service: UserPublicService,
        private _formBuilder: UntypedFormBuilder,
        private _router: Router,
    ) {
    }

    get item(): CollaboratorDto {
        return this.service.item;
    }

    set item(value: CollaboratorDto) {
        this.service.item = value;
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        // Create the form
        this.signUpForm = this._formBuilder.group({
                name: ['', Validators.required],
                email: ['', [Validators.required, Validators.email]],
                password: ['', Validators.required],
                type: ['school', Validators.required],
                phone: ['',]
            },
        );
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Sign up
     */
    signUp(): void {
        // Do nothing if the form is invalid
        if (this.signUpForm.invalid) {
            return;
        }
        // Disable the form
        this.signUpForm.disable();
        this.item.fullName = this.signUpForm.get('name').value
        this.item.email = this.signUpForm.get('email').value
        this.item.password = this.signUpForm.get('password').value
        this.item.phone = this.signUpForm.get('phone').value
        this.item.typeCollaborator.libelle = this.signUpForm.get('type').value
        this.item.username = this.item.email
        this.service.save()
            .subscribe(res => {
                console.log(res)
                this.alert.show('success', 'account created successfully.')
                this.signUpForm.enable()
                this.signUpForm.reset()
            }, error => {
                console.error(error)
                this.alert.show('info', error?.error?.message || 'something went wrong, please try again.')
                this.signUpForm.enable()
            })
    }
}
