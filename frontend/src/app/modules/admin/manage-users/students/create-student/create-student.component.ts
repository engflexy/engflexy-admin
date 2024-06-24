import {Component, OnInit, ViewChild} from '@angular/core';
import {EtudiantDto} from "../../../../../shared/model/inscription/Etudiant.model";
import {NgForm, UntypedFormBuilder, UntypedFormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../../../../zynerator/security/shared/service/Auth.service";
import {
    EtudiantCollaboratorService
} from "../../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import {DialogRef} from "@angular/cdk/dialog";
import {MatDialog, MatDialogRef} from "@angular/material/dialog";
import {FuseAlertService} from "../../../../../../@fuse/components/alert";

@Component({
    selector: 'app-create-student',
    templateUrl: './create-student.component.html'
})
export class CreateStudentComponent implements OnInit {
    student: EtudiantDto = new EtudiantDto()
    form: UntypedFormGroup;
    @ViewChild('ngForm') ngForm: NgForm;


    constructor(private _formBuilder: UntypedFormBuilder,
                private auth: AuthService,
                private alert: FuseAlertService,
                public refDialog: MatDialogRef<CreateStudentComponent>,
                private studentService: EtudiantCollaboratorService
    ) {
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
        this.student.fullName = this.form.get('fullName').value
        this.student.email = this.form.get('email').value
        this.student.phone = this.form.get('phone').value
        this.student.username = this.student.email
        // @ts-ignore
        this.student.collaborator = this.auth.authenticatedUser
        console.log(this.student)
        this.studentService.create(this.student)
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
