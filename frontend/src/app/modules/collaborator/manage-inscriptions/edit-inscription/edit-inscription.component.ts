import {Component, ViewChild} from '@angular/core';
import {NgForm} from "@angular/forms";
import {ManageUserDto} from "../../../../core/criteria/manage-user-dto";
import {ParcoursDto} from "../../../../shared/model/course/Parcours.model";
import {EtatInscriptionDto} from "../../../../shared/model/inscriptionref/EtatInscription.model";
import {GroupeEtudeDto} from "../../../../shared/model/grpe/GroupeEtude.model";
import {PackStudentDto} from "../../../../shared/model/pack/PackStudent.model";
import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {ParcoursCollaboratorService} from "../../../../shared/service/collaborator/course/ParcoursCollaborator.service";
import {
    PackStudentCollaboratorService
} from "../../../../shared/service/collaborator/pack/PackStudentCollaborator.service";
import {
    EtatInscriptionCollaboratorService
} from "../../../../shared/service/collaborator/inscriptionref/EtatInscriptionCollaborator.service";
import {
    GroupeEtudeCollaboratorService
} from "../../../../shared/service/collaborator/grpe/GroupeEtudeCollaborator.service";
import {
    EtudiantCollaboratorService
} from "../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import {MatDialogRef} from "@angular/material/dialog";
import {
    InscriptionCollaboratorService
} from "../../../../shared/service/collaborator/grpe/InscriptionCollaborator.service";
import {InscriptionDto} from "../../../../shared/model/grpe/Inscription.model";
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";

@Component({
    selector: 'app-collaborator-edit-inscription',
    templateUrl: './edit-inscription.component.html',
})
export class EditInscriptionComponent {
    @ViewChild('ngForm') ngForm: NgForm;
    _students: ManageUserDto[]
    _materials: ParcoursDto[]
    _etats: EtatInscriptionDto[]
    _groupeEtudes: GroupeEtudeDto[]
    _packs: PackStudentDto[];


    constructor(private auth: AuthService,
                private alert: FuseAlertService,
                private parcoursService: ParcoursCollaboratorService,
                private packStudentService: PackStudentCollaboratorService,
                private etatInscriptionCollaboratorService: EtatInscriptionCollaboratorService,
                private groupeEtudeCollaboratorService: GroupeEtudeCollaboratorService,
                private etudiantService: EtudiantCollaboratorService,
                public refDialog: MatDialogRef<EditInscriptionComponent>,
                private service: InscriptionCollaboratorService
    ) {
    }

    get inscription(): InscriptionDto {
        return this.service.item;
    }

    set inscription(value: InscriptionDto) {
        this.service.item = value;
    }

    get students(): Array<ManageUserDto> {
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
        console.log(this.inscription)
        this.etudiantService.findAllByCollaboratorId(this.auth?.authenticatedUser?.id)
            .subscribe(res => {
                this._students = res
            })
        this.groupeEtudeCollaboratorService.findAllOptimized()
            .subscribe(res => this._groupeEtudes = res)

        this.parcoursService.findAllOptimized()
            .subscribe(res => this._materials = res)

        this.etatInscriptionCollaboratorService.findAllOptimized()
            .subscribe(res => this._etats = res)

        this.packStudentService.findAllOptimized()
            .subscribe(res => this._packs = res)

    }

    update() {
        console.log(this.inscription)
        // Disable the form
        this.ngForm.form.disable();
        this.service.edit().subscribe(res => {
            this.refDialog.close(res)
            console.log(res)
        }, error => {
            this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.');
            console.error(error)
            this.ngForm.reset()
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

    handleNgModelChange(event: ManageUserDto) {
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

    handleInscChange(event: any) {
        console.log(event)
        const timer = setInterval(s => {
            console.log(this.inscription)
            clearInterval(timer)
        }, 2000)
    }
}
