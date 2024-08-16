import {Component, ViewChild} from '@angular/core';
import {EtudiantDto} from "../../../../../shared/model/inscription/Etudiant.model";
import {NgForm, UntypedFormBuilder, UntypedFormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../../../../zynerator/security/shared/service/Auth.service";
import {FuseAlertService} from "../../../../../../@fuse/components/alert";
import {MatDialogRef} from "@angular/material/dialog";
import {
    EtudiantCollaboratorService
} from "../../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import {ProfDto} from "../../../../../shared/model/prof/Prof.model";
import {ProfCollaboratorService} from "../../../../../shared/service/collaborator/prof/ProfCollaborator.service";

@Component({
  selector: 'app-create-teacher',
  templateUrl: './create-teacher.component.html'
})
export class CreateTeacherComponent {
    form: UntypedFormGroup;
    @ViewChild('ngForm') ngForm: NgForm;


    constructor(private _formBuilder: UntypedFormBuilder,
                private auth: AuthService,
                private alert: FuseAlertService,
                public refDialog: MatDialogRef<CreateTeacherComponent>,
                private profCollaboratorService: ProfCollaboratorService
    ) {
    }


    get prof(): ProfDto {
        return this.profCollaboratorService.item;
    }

    set prof(value: ProfDto) {
        this.profCollaboratorService.item = value;
    }

    ngOnInit() {
        // Create the form
        this.form = this._formBuilder.group({
                fullName: ['', Validators.required],
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
        this.prof.fullName = this.form.get('fullName').value
        this.prof.email = this.form.get('email').value
        this.prof.phone = this.form.get('phone').value
        this.prof.username = this.prof.email
        // @ts-ignore
        this.prof.collaborator = this.auth.authenticatedUser
        console.log(this.prof)
        this.profCollaboratorService.create(this.prof)
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
