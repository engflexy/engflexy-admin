import {Component, OnInit, ViewChild} from '@angular/core';
import {FormsModule, NgForm} from "@angular/forms";
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
import {ParcoursDto} from "../../../../shared/model/course/Parcours.model";
import {ParcoursCollaboratorService} from "../../../../shared/service/collaborator/course/ParcoursCollaborator.service";
import {
    EtatInscriptionCollaboratorService
} from "../../../../shared/service/collaborator/inscriptionref/EtatInscriptionCollaborator.service";
import {
    GroupeEtudeCollaboratorService
} from "../../../../shared/service/collaborator/grpe/GroupeEtudeCollaborator.service";
import {EtatInscriptionDto} from "../../../../shared/model/inscriptionref/EtatInscription.model";
import {GroupeEtudeDto} from "../../../../shared/model/grpe/GroupeEtude.model";
import {PackStudentDto} from "../../../../shared/model/pack/PackStudent.model";
import {
    PackStudentCollaboratorService
} from "../../../../shared/service/collaborator/pack/PackStudentCollaborator.service";
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";

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
    @ViewChild('ngForm') ngForm: NgForm;
    _students: UserCriteria[]
    _materials: ParcoursDto[]
    _etats: EtatInscriptionDto[]
    _groupeEtudes: GroupeEtudeDto[]
    _packs: PackStudentDto[];


    constructor(
        private auth: AuthService,
        private alert: FuseAlertService,
        private parcoursService: ParcoursCollaboratorService,
        private packStudentService: PackStudentCollaboratorService,
        private etatInscriptionCollaboratorService: EtatInscriptionCollaboratorService,
        private groupeEtudeCollaboratorService: GroupeEtudeCollaboratorService,
        private etudiantService: EtudiantCollaboratorService,
        public refDialog: MatDialogRef<CreateInscriptionComponent>,
        private service: InscriptionCollaboratorService
    ) {
    }

    get inscription(): InscriptionDto {
        return this.service.item;
    }

    set inscription(value: InscriptionDto) {
        this.service.item = value;
    }

    get students(): Array<UserCriteria> {
        return this.etudiantService.students;
    }

    get materials(): Array<ParcoursDto> {
        return this.parcoursService.items;
    }

    get etats(): Array<EtatInscriptionDto> {
        return this.etatInscriptionCollaboratorService.items;
    }

    get groupeEtudes(): Array<GroupeEtudeDto> {
        return this.groupeEtudeCollaboratorService.items;
    }

    get packs(): Array<PackStudentDto> {
        return this.packStudentService.items;
    }

    ngOnInit() {
        this.etudiantService.findAllByCollaboratorId(this.auth?.authenticatedUser?.id)
            .subscribe(res => {
                this._students = res
            })
        this.groupeEtudeCollaboratorService.findAllOptimized()
            .subscribe(res => this._groupeEtudes = res)

        this.parcoursService.findAllOptimized().subscribe()

        this.etatInscriptionCollaboratorService.findAllOptimized()
            .subscribe(res => this._etats = res)

        this.packStudentService.findAllOptimized()
            .subscribe(res => {
                this._packs = res
                this._packs = res
            })

    }

    save() {
        console.log(this.inscription)
        // Disable the form
        this.ngForm.form.disable();
        this.service.save().subscribe(res => {
            this.refDialog.close(res)
            console.log(res)
        }, error => {
            this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.');
            console.error(error)
            this.ngForm.resetForm()
        })
    }

    filter(value: string, type: string) {
        value = value.toLowerCase();
        if (type === 'STUDENT') {
            if (value && value.length > 0) {
                this._students = this.students.filter(s =>
                    s.fullName?.toLowerCase()?.includes(value) ||
                    s.email?.toLowerCase()?.includes(value)
                )
            } else {
                this._students = this.students
            }
        }
        if (type === 'MATERIAL') {
            if (value && value.length > 0) {
                this._materials = this.materials.filter(s => s.libelle?.toLowerCase()?.includes(value))
            } else {
                this._materials = this.materials
            }
        }
        if (type === 'STATE') {
            if (value && value.length > 0) {
                this._etats = this.etats.filter(s => s.libelle?.toLowerCase()?.includes(value))
            } else {
                this._etats = this.etats
            }
        }
        if (type === 'GROUP') {
            if (value && value.length > 0) {
                this._groupeEtudes = this.groupeEtudes.filter(s => s.libelle?.toLowerCase()?.includes(value))
            } else {
                this._groupeEtudes = this.groupeEtudes
            }
        }
        if (type === 'PACK') {
            if (value && value.length > 0) {
                this._packs = this.packs.filter(s => s.libelle?.toLowerCase()?.includes(value))
            } else {
                this._packs = this.packs
            }
        }

    }

    handleNgModelChange(event: UserCriteria) {
        const student = new EtudiantDto()
        student.id = event.id
        student.fullName = event.fullName
        student.email = event.email
        student.username = event.email
        this.inscription.etudiant = student
    }

    displayFn(item: any): string {
        return item && item.libelle ? item.libelle : '';
    }

    displayFnName(item: any): string {
        return item && item.fullName ? item.fullName : '';
    }
}
