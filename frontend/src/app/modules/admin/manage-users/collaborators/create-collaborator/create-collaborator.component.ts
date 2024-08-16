import {Component, ViewChild} from '@angular/core';
import {NgForm, UntypedFormBuilder, UntypedFormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../../../../zynerator/security/shared/service/Auth.service";
import {FuseAlertService} from "../../../../../../@fuse/components/alert";
import {MatDialogRef} from "@angular/material/dialog";
import {CollaboratorAdminService} from "../../../../../shared/service/admin/vocab/CollaboratorAdmin.service";
import {CollaboratorDto} from "../../../../../shared/model/vocab/Collaborator.model";

@Component({
    selector: 'app-create-collaborator',
    templateUrl: './create-collaborator.component.html'
})
export class CreateCollaboratorComponent {
    form: UntypedFormGroup;
    @ViewChild('ngForm') ngForm: NgForm;


    constructor(private _formBuilder: UntypedFormBuilder,
                private auth: AuthService,
                private alert: FuseAlertService,
                public refDialog: MatDialogRef<CreateCollaboratorComponent>,
                private service: CollaboratorAdminService
    ) {
    }


    get item(): CollaboratorDto {
        return this.service.item;
    }

    set item(value: CollaboratorDto) {
        this.service.item = value;
    }

    ngOnInit() {
        // Create the form
        this.form = this._formBuilder.group({
                fullName: ['', Validators.required],
                type: ['school', Validators.required],
                email: ['', [Validators.required, Validators.email]],
                phone: ['',],
            },
        );
    }

    save() {
        // Do nothing if the form is invalid
        if (this.form.invalid) {
            return;
        }
        // Disable the form
        this.form.disable();
        this.item.fullName = this.form.get('fullName').value
        this.item.email = this.form.get('email').value
        this.item.phone = this.form.get('phone').value
        this.item.typeCollaborator.libelle = this.form.get('type').value
        this.item.username = this.item.email
        console.log(this.item)
        this.service.create(this.item)
            .subscribe(res => {
                console.log(res)
                this.form.enable()
                this.ngForm.reset()
                this.refDialog.close(res)
            }, error => {
                console.error(error)
                this.alert.show('info', error?.error?.message || 'something went wrong, please try again.')
                this.form.enable()
            })
    }


}
