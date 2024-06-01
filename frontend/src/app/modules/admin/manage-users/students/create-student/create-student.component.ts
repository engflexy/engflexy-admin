import {Component, OnInit, ViewChild} from '@angular/core';
import {EtudiantDto} from "../../../../../shared/model/inscription/Etudiant.model";
import {NgForm, UntypedFormBuilder, UntypedFormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../../../../zynerator/security/shared/service/Auth.service";
import {
    EtudiantCollaboratorService
} from "../../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";

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
        this.student.username = this.form.get('email').value
        // @ts-ignore
        this.student.collaborator = this.auth.authenticatedUser
        console.log(this.student)
        this.studentService.create(this.student)
            .subscribe(res => {
                console.log(res)
                this.form.enable()
                this.ngForm.reset()
            }, error => {
                console.error(error)
                this.form.enable()
            })
    }
}
