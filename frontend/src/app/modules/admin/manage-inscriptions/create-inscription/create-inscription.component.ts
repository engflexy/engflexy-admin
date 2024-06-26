import {Component, OnInit, ViewChild} from '@angular/core';
import {FormsModule, NgForm, UntypedFormBuilder} from "@angular/forms";
import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {NgForOf, NgIf} from "@angular/common";
import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {InscriptionDto} from "../../../../shared/model/grpe/Inscription.model";
import {
    InscriptionCollaboratorService
} from "../../../../shared/service/collaborator/grpe/InscriptionCollaborator.service";
import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {
    EtudiantCollaboratorService
} from "../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import {UserCriteria} from "../../../../core/criteria/user-criteria";
import {MatIconModule} from "@angular/material/icon";
import {MatTooltipModule} from "@angular/material/tooltip";

@Component({
    selector: 'app-create-inscription',
    templateUrl: './create-inscription.component.html',
    imports: [
        FormsModule,
        MatButtonModule,
        MatDialogModule,
        MatFormFieldModule,
        MatInputModule,
        NgIf,
        MatAutocompleteModule,
        NgForOf,
        MatIconModule,
        MatTooltipModule
    ],
    standalone: true
})
export class CreateInscriptionComponent implements OnInit {
    inscription: InscriptionDto = new InscriptionDto()
    @ViewChild('ngForm') ngForm: NgForm;
    students: UserCriteria[]


    constructor(private _formBuilder: UntypedFormBuilder,
                private auth: AuthService,
                private alert: FuseAlertService,
                private etudiantService: EtudiantCollaboratorService,
                public refDialog: MatDialogRef<CreateInscriptionComponent>,
                private service: InscriptionCollaboratorService
    ) {
    }

    ngOnInit() {
        this.etudiantService.findAllByCollaboratorId(this.auth?.authenticatedUser?.id)
            .subscribe(res => this.students = res)
    }

    save() {
        // Do nothing if the form is invalid
        if (this.ngForm.invalid) {
            return;
        }
        // Disable the form
        this.ngForm.form.disable();
    }

    filterStudent(value: string) {

    }
}
