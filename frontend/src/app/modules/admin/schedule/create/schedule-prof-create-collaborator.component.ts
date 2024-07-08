import {Component, Inject, OnInit, PLATFORM_ID} from '@angular/core';

import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {DatePipe, NgForOf, NgIf} from "@angular/common";

import {FuseAlertService} from "../../../../../@fuse/components/alert";

import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatIconModule} from "@angular/material/icon";
import {MatTooltipModule} from "@angular/material/tooltip";
import {Router} from '@angular/router';


import {environment} from '../../../../../environments/environment';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';
import {StringUtilService} from '../../../../zynerator/util/StringUtil.service';

import {FormsModule} from "@angular/forms";

import {TranslocoModule} from "@ngneat/transloco";


import {
    ScheduleProfCollaboratorService
} from '../../../../shared/service/collaborator/prof/ScheduleProfCollaborator.service';
import {ScheduleProfDto} from '../../../../shared/model/prof/ScheduleProf.model';
import {ScheduleProfCriteria} from '../../../../shared/criteria/prof/ScheduleProfCriteria.model';
import {GroupeEtudiantDto} from '../../../../shared/model/grpe/GroupeEtudiant.model';
import {
    GroupeEtudiantCollaboratorService
} from '../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service';
import {CoursDto} from '../../../../shared/model/course/Cours.model';
import {CoursCollaboratorService} from '../../../../shared/service/collaborator/course/CoursCollaborator.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ProfCollaborator.service';
import {MatSelectModule} from "@angular/material/select";
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

@Component({
    selector: 'app-schedule-prof-create-collaborator',
    templateUrl: './schedule-prof-create-collaborator.component.html',
    imports: [
        MatButtonModule,
        MatDialogModule,
        MatFormFieldModule,
        MatInputModule,
        NgIf,
        MatAutocompleteModule,
        NgForOf,
        MatIconModule,
        MatTooltipModule,
        TranslocoModule,
        FormsModule,
        MatCheckboxModule,
        MatSelectModule
    ],
    standalone: true
})
export class ScheduleProfCreateCollaboratorComponent implements OnInit {

    protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

    _groupeEtudiantsFilter: GroupeEtudiantDto[];
    _profsFilter: ProfDto[];
    _courssFilter: CoursDto[];
    _parcourssFilter: ParcoursDto[];
    _etudiantFilter: EtudiantDto[];


    private _validProfRef = true;
    private _validCoursCode = true;
    private _validCoursLibelle = true;

    constructor(private alert: FuseAlertService,
                private service: ScheduleProfCollaboratorService,
                private groupeEtudiantDetailAdminService: GroupeEtudiantDetailAdminService,
                private groupeEtudiantService: GroupeEtudiantCollaboratorService,
                private coursService: CoursCollaboratorService,
                private etudiantService: EtudiantCollaboratorService,
                public refDialog: MatDialogRef<ScheduleProfCreateCollaboratorComponent>,
                private parcoursService: ParcoursCollaboratorService,
                private profService: ProfCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {


    }

    ngOnInit(): void {
        this.groupeEtudiantService.findAll().subscribe((data) => {
            this.groupeEtudiants = data;
            this._groupeEtudiantsFilter = {...this.groupeEtudiants}
        });
        this.profService.findAll().subscribe((data) => {
            this.profs = data;
            this._profsFilter = {...this.profs}
        });
        this.parcoursService.findAll().subscribe((data) => {
            this.parcourss = data;
            this._parcourssFilter = {...this.parcourss}
        });
        this.etudiantService.findAll().subscribe((data) => {
            this.etudiants = data;
            this._etudiantFilter = {...this.etudiants}
        });
        this.coursService.findAll().subscribe((data) => {
            this.courss = data;
            this._courssFilter = {...this.courss}
        });
    }


    public handleGroupEtudiantChange(): void {
        this.changeProf();
        this.changeParcours();
        this.findByGroupeEtudiantId();
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


    public save(): void {
        this.submitted = true;
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.saveWithShowOption(false);

        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public saveWithShowOption(showList: boolean) {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.createDialog = false;
                this.submitted = false;
                this.item = new ScheduleProfDto();
                this.refDialog.close(item);
            } else {
                this.alert.show('info', 'something went wrong!, please try again.');
            }

        }, error => {
            console.log(error);
        });
    }


    public hideCreateDialog() {
        this.createDialog = false;
        this.setValidation(true);
    }


    public setValidation(value: boolean) {
    }


    public validateForm(): void {
        this.errorMessages = new Array<string>();
    }

    displayStudentsOfGroup(): void {
        console.log();
    }


    public async openCreateProf(prof: string) {
        const isPermistted = await this.roleService.isPermitted('Prof', 'add');
        if (isPermistted) {
            this.prof = new ProfDto();
            this.createProfDialog = true;
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
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


    //hna
    get createProfDialog(): boolean {
        return this.profService.createDialog;
    }

    set createProfDialog(value: boolean) {
        this.profService.createDialog = value;
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

    get createGroupeEtudiantDialog(): boolean {
        return this.groupeEtudiantService.createDialog;
    }

    set createGroupeEtudiantDialog(value: boolean) {
        this.groupeEtudiantService.createDialog = value;
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

    get createCoursDialog(): boolean {
        return this.coursService.createDialog;
    }

    set createCoursDialog(value: boolean) {
        this.coursService.createDialog = value;
    }


    get validProfRef(): boolean {
        return this._validProfRef;
    }

    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }

    get validCoursCode(): boolean {
        return this._validCoursCode;
    }

    set validCoursCode(value: boolean) {
        this._validCoursCode = value;
    }

    get validCoursLibelle(): boolean {
        return this._validCoursLibelle;
    }

    set validCoursLibelle(value: boolean) {
        this._validCoursLibelle = value;
    }


    get items(): Array<ScheduleProfDto> {
        return this.service.items;
    }

    set items(value: Array<ScheduleProfDto>) {
        this.service.items = value;
    }

    get item(): ScheduleProfDto {
        return this.service.item;
    }

    set item(value: ScheduleProfDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): ScheduleProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: ScheduleProfCriteria) {
        this.service.criteria = value;
    }

    get dateFormat() {
        return environment.dateFormatCreate;
    }

    get dateFormatColumn() {
        return environment.dateFormatCreate;
    }

    get submitted(): boolean {
        return this._submitted;
    }

    set submitted(value: boolean) {
        this._submitted = value;
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


    get activeTab(): number {
        return this._activeTab;
    }

    set activeTab(value: number) {
        this._activeTab = value;
    }


    protected readonly compareObjects = compareObjects;


    courses: CoursDto[];

    getCoursByParcours() {
        this.coursService.findByParcoursId(this.item.groupeEtudiant.parcours.id).subscribe(data => {
            this.courses = data;
            console.log(data)
        })
    }
}
