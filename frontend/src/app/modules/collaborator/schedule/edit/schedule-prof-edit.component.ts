import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {DatePipe} from "@angular/common";

import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {Router} from '@angular/router';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';


import {
    ScheduleProfCollaboratorService
} from '../../../../shared/service/collaborator/prof/ScheduleProfCollaborator.service';
import {ScheduleProfDto} from '../../../../shared/model/prof/ScheduleProf.model';
import {GroupeEtudiantDto} from '../../../../shared/model/grpe/GroupeEtudiant.model';
import {
    GroupeEtudiantCollaboratorService
} from '../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service';
import {CoursDto} from '../../../../shared/model/course/Cours.model';
import {CoursCollaboratorService} from '../../../../shared/service/collaborator/course/CoursCollaborator.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ProfCollaborator.service';
import {compareObjects} from "../../../../zynerator/util/Gloabl";
import {ParcoursDto} from "../../../../shared/model/course/Parcours.model";
import {ParcoursCollaboratorService} from "../../../../shared/service/collaborator/course/ParcoursCollaborator.service";
import {
    EtudiantCollaboratorService
} from "../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";
import {
    GroupeEtudiantDetailAdminService
} from "../../../../shared/service/admin/grpe/GroupeEtudiantDetailAdmin.service";
import {Class} from "../models/Class";

@Component({
    selector: 'app-collaborator-schedule-prof-create-collaborator',
    templateUrl: './schedule-prof-edit.component.html'
})
export class ScheduleProfEditComponent implements OnInit {
    protected _errorMessages = new Array<string>();
    protected datePipe: DatePipe;
    protected roleService: RoleService;
    protected router: Router;
    _groupeEtudiantsFilter: GroupeEtudiantDto[];
    _profsFilter: ProfDto[];
    _courssFilter: CoursDto[];
    _parcourssFilter: ParcoursDto[];
    _etudiantFilter: EtudiantDto[];

    constructor(private alert: FuseAlertService,
                private service: ScheduleProfCollaboratorService,
                private groupeEtudiantDetailAdminService: GroupeEtudiantDetailAdminService,
                private groupeEtudiantService: GroupeEtudiantCollaboratorService,
                private coursService: CoursCollaboratorService,
                private etudiantService: EtudiantCollaboratorService,
                public refDialog: MatDialogRef<ScheduleProfEditComponent>,
                private parcoursService: ParcoursCollaboratorService,
                @Inject(MAT_DIALOG_DATA) public classe: Class,
                private profService: ProfCollaboratorService) {


    }

    ngOnInit(): void {

        if (this.classe?.id) {
            this.service.findByIdWithAssociatedList(new ScheduleProfDto(this.classe.id))
                .subscribe(res => {
                    this.item = res
                    this.item.startTime = new Date(res.startTime)
                    this.item.endTime = new Date(res.endTime)
                    console.log(this.item)
                    if (this.item?.groupeEtudiant?.parcours?.id) {
                        this.getCoursByParcours()
                    }
                })
        }

        this.groupeEtudiantService.findAll().subscribe((data) => {
            this.groupeEtudiants = data;
            this._groupeEtudiantsFilter = [...this.groupeEtudiants]
        });
        this.profService.findAll().subscribe((data) => {
            this.profs = data;
            this._profsFilter = [...this.profs]
        });
        this.parcoursService.findAll().subscribe((data) => {
            this.parcourss = data;
            this._parcourssFilter = [...this.parcourss]
        });
        this.etudiantService.findAll().subscribe((data) => {
            this.etudiants = data;
            this._etudiantFilter = [...this.etudiants]
        });
    }


    public handleGroupEtudiantChange(): void {
        this.item.prof = this.item.groupeEtudiant.prof
        this.getCoursByParcours()
    }

    public findByGroupeEtudiantId(): void {
        if (this.item.groupeEtudiant) {
            this.groupeEtudiantDetailAdminService.findByGroupeEtudiantId(this.item.groupeEtudiant.id).subscribe(data => this.item.groupeEtudiant.groupeEtudiantDetails = data);
        }
    }

    // public findByParcoursCourss(): void {
    //     if (this.item.groupeEtudiant.parcours.courss) {
    //         this.coursService.findByParcoursId(this.item.groupeEtudiant.id).subscribe(data =>this.item.groupeEtudiant.groupeEtudiantDetails = data);
    //     }
    // }


    changeProf(): void {
        console.log(this.item)
        if (this.item.groupeEtudiant && this.item.groupeEtudiant.prof) {
            this.item.prof = this.item.groupeEtudiant.prof;
        } else {
            this.item.prof = null; // or handle it as needed if no prof is found
        }

    }

    changeParcours() {
        if (this.item.groupeEtudiant && this.item.groupeEtudiant.parcours) {
            this.item.groupeEtudiant.parcours = this.item.groupeEtudiant.parcours;
            this.getCoursByParcours();

        } else {
            this.item.groupeEtudiant.parcours = null; // or handle it as needed if no parcours is found
        }
    }

    displayGroupeEtudiant(item: GroupeEtudiantDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterGroupeEtudiant(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._groupeEtudiantsFilter = this.groupeEtudiants.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._groupeEtudiantsFilter = this.groupeEtudiants
        }
    }

    displayProf(item: ProfDto): string {
        return item && item.ref ? item.ref : "";

    }

    filterProf(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._profsFilter = this.profs.filter(s =>
                s.ref?.toLowerCase()?.includes(value)
            )
        } else {
            this._profsFilter = this.profs
        }
    }

    displayCours(item: CoursDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterCours(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._courssFilter = this.courss.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._courssFilter = this.courss
        }
    }


    public update(): void {
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.editWithOption(false);

        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public editWithOption(showList: boolean) {
        this.item.subject = this.item.cours.libelle
        this.item.grpName = this.item.groupeEtudiant.libelle
        this.item.profName = this.item.prof.fullName
        console.log(this.item)
        this.service.edit().subscribe(item => {
            if (item != null) {
                this.refDialog.close(this.item);
            } else {
                this.alert.show('info', 'something went wrong!, please try again.');
            }

        }, error => {
            console.log(error);
        });
    }

    public validateForm(): void {
        this.errorMessages = new Array<string>();
    }


    get prof(): ProfDto {
        return this.profService.item;
    }

    set prof(value: ProfDto) {
        this.profService.item = value;
    }

    get profs(): Array<ProfDto> {
        return this.profService.items;
    }

    set profs(value: Array<ProfDto>) {
        this.profService.items = value;
    }

    //hnaaa
    get etudiant(): EtudiantDto {
        return this.etudiantService.item;
    }

    set etudiant(value: EtudiantDto) {
        this.etudiantService.item = value;
    }

    get etudiants(): Array<EtudiantDto> {
        return this.etudiantService.items;
    }

    set etudiants(value: Array<EtudiantDto>) {
        this.etudiantService.items = value;
    }

    get parcourss(): Array<ParcoursDto> {
        return this.parcoursService.items;
    }

    set parcourss(value: Array<ParcoursDto>) {
        this.parcoursService.items = value;
    }


    get groupeEtudiant(): GroupeEtudiantDto {
        return this.groupeEtudiantService.item;
    }

    set groupeEtudiant(value: GroupeEtudiantDto) {
        this.groupeEtudiantService.item = value;
    }

    get groupeEtudiants(): Array<GroupeEtudiantDto> {
        return this.groupeEtudiantService.items;
    }

    set groupeEtudiants(value: Array<GroupeEtudiantDto>) {
        this.groupeEtudiantService.items = value;
    }


    get cours(): CoursDto {
        return this.coursService.item;
    }

    set cours(value: CoursDto) {
        this.coursService.item = value;
    }

    get courss(): Array<CoursDto> {
        return this.coursService.items;
    }

    set courss(value: Array<CoursDto>) {
        this.coursService.items = value;
    }

    get item(): ScheduleProfDto {
        return this.service.item;
    }

    set item(value: ScheduleProfDto) {
        this.service.item = value;
    }


    get errorMessages(): string[] {
        if (this._errorMessages == null) {
            this._errorMessages = new Array<string>();
        }
        return this._errorMessages;
    }

    set errorMessages(value: string[]) {
        this._errorMessages = value;
    }

    get validate(): boolean {
        return this.service.validate;
    }

    set validate(value: boolean) {
        this.service.validate = value;
    }


    protected readonly compareObjects = compareObjects;


    getCoursByParcours(data?) {
        let id: number = data?.id ? data.id : this.item.groupeEtudiant.parcours.id
        this.coursService.findByParcoursId(id).subscribe(data => {
            this._courssFilter = data;
            this.courss = [...data];
        })
    }
}
