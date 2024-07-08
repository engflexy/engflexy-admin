import {ChangeDetectorRef, Component, Inject, OnInit, PLATFORM_ID} from '@angular/core';

import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {DatePipe, NgForOf, NgIf} from "@angular/common";

import {FuseAlertService} from "../../../../../@fuse/components/alert";

import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatIconModule} from "@angular/material/icon";
import {MatTooltipModule} from "@angular/material/tooltip";
import {Router} from '@angular/router';


import {environment} from '../../../../../environments/environment';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';
import {StringUtilService} from '../../../../zynerator/util/StringUtil.service';

import {FormsModule} from "@angular/forms";

import {TranslocoModule} from "@ngneat/transloco";


import {
    InscriptionCollaboratorService
} from '../../../../shared/service/collaborator/grpe/InscriptionCollaborator.service';
import {InscriptionDto} from '../../../../shared/model/grpe/Inscription.model';
import {InscriptionCriteria} from '../../../../shared/criteria/grpe/InscriptionCriteria.model';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from '../../../../shared/service/collaborator/course/ParcoursCollaborator.service';
import {QuizDto} from '../../../../shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from '../../../../shared/service/collaborator/quiz/QuizCollaborator.service';
import {SkillDto} from '../../../../shared/model/inscriptionref/Skill.model';
import {
    SkillCollaboratorService
} from '../../../../shared/service/collaborator/inscriptionref/SkillCollaborator.service';
import {InteretEtudiantDto} from '../../../../shared/model/inscriptionref/InteretEtudiant.model';
import {
    InteretEtudiantCollaboratorService
} from '../../../../shared/service/collaborator/inscriptionref/InteretEtudiantCollaborator.service';
import {FonctionDto} from '../../../../shared/model/inscriptionref/Fonction.model';
import {
    FonctionCollaboratorService
} from '../../../../shared/service/collaborator/inscriptionref/FonctionCollaborator.service';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {
    EtudiantCollaboratorService
} from '../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {EtatInscriptionDto} from '../../../../shared/model/inscriptionref/EtatInscription.model';
import {
    EtatInscriptionCollaboratorService
} from '../../../../shared/service/collaborator/inscriptionref/EtatInscriptionCollaborator.service';
import {GroupeTypeDto} from '../../../../shared/model/grpe/GroupeType.model';
import {
    GroupeTypeCollaboratorService
} from '../../../../shared/service/collaborator/grpe/GroupeTypeCollaborator.service';
import {StatutSocialDto} from '../../../../shared/model/inscriptionref/StatutSocial.model';
import {
    StatutSocialCollaboratorService
} from '../../../../shared/service/collaborator/inscriptionref/StatutSocialCollaborator.service';
import {PackStudentDto} from '../../../../shared/model/pack/PackStudent.model';
import {
    PackStudentCollaboratorService
} from '../../../../shared/service/collaborator/pack/PackStudentCollaborator.service';
import {GroupeEtudeDto} from '../../../../shared/model/grpe/GroupeEtude.model';
import {
    GroupeEtudeCollaboratorService
} from '../../../../shared/service/collaborator/grpe/GroupeEtudeCollaborator.service';
import {NiveauEtudeDto} from '../../../../shared/model/inscriptionref/NiveauEtude.model';
import {
    NiveauEtudeCollaboratorService
} from '../../../../shared/service/collaborator/inscriptionref/NiveauEtudeCollaborator.service';
import {MatCheckboxModule} from "@angular/material/checkbox";

@Component({
    selector: 'app-inscription-create-collaborator',
    templateUrl: './inscription-create-collaborator.component.html',
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
        MatCheckboxModule
    ],
    standalone: true
})
export class InscriptionCreateCollaboratorComponent implements OnInit {

    protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

    _etudiantsFilter: EtudiantDto[];
    _etatInscriptionsFilter: EtatInscriptionDto[];
    _parcourssFilter: ParcoursDto[];
    _groupeEtudesFilter: GroupeEtudeDto[];
    _groupeTypesFilter: GroupeTypeDto[];
    _statutSocialsFilter: StatutSocialDto[];
    _interetEtudiantsFilter: InteretEtudiantDto[];
    _niveauEtudesFilter: NiveauEtudeDto[];
    _fonctionsFilter: FonctionDto[];
    _quizsFilter: QuizDto[];
    _packStudentsFilter: PackStudentDto[];
    _skillsFilter: SkillDto[];


    private _validInscriptionNumeroInscription = true;
    private _validInscriptionEtudiant = true;
    private _validInscriptionEtatInscription = true;
    private _validInscriptionParcours = true;
    private _validInscriptionGroupeEtude = true;
    private _validInscriptionGroupeType = true;
    private _validInscriptionStatutSocial = true;
    private _validInscriptionInteretEtudiant = true;
    private _validInscriptionNiveauEtude = true;
    private _validInscriptionFonction = true;
    private _validInscriptionQuiz = true;
    private _validEtatInscriptionRef = true;
    private _validParcoursCode = true;
    private _validParcoursLibelle = true;
    private _validGroupeEtudeLibelle = true;
    private _validGroupeTypeCode = true;
    private _validGroupeTypeLibelle = true;
    private _validStatutSocialCode = true;
    private _validStatutSocialLibelle = true;
    private _validInteretEtudiantCode = true;
    private _validInteretEtudiantLibelle = true;
    private _validNiveauEtudeLibelle = true;
    private _validNiveauEtudeCode = true;
    private _validFonctionCode = true;
    private _validFonctionLibelle = true;
    private _validQuizRef = true;
    private _validQuizLib = true;
    private _validPackStudentCode = true;
    private _validPackStudentLibelle = true;
    private _validSkillCode = true;
    private _validSkillLibelle = true;

    constructor(public refDialog: MatDialogRef<InscriptionCreateCollaboratorComponent>,
                private alert: FuseAlertService, private service: InscriptionCollaboratorService, private parcoursService: ParcoursCollaboratorService, private quizService: QuizCollaboratorService, private skillService: SkillCollaboratorService, private interetEtudiantService: InteretEtudiantCollaboratorService, private fonctionService: FonctionCollaboratorService, private etudiantService: EtudiantCollaboratorService, private etatInscriptionService: EtatInscriptionCollaboratorService, private groupeTypeService: GroupeTypeCollaboratorService, private statutSocialService: StatutSocialCollaboratorService, private packStudentService: PackStudentCollaboratorService, private groupeEtudeService: GroupeEtudeCollaboratorService, private niveauEtudeService: NiveauEtudeCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {

    }

    ngOnInit(): void {
        this.etudiantService.findAll().subscribe((data) => {
            this.etudiants = data;
            this._etudiantsFilter = {...this.etudiants}
        });
        this.etatInscriptionService.findAll().subscribe((data) => {
            this.etatInscriptions = data;
            this._etatInscriptionsFilter = {...this.etatInscriptions}
        });
        this.parcoursService.findAll().subscribe((data) => {
            this.parcourss = data;
            this._parcourssFilter = {...this.parcourss}
        });
        this.groupeEtudeService.findAll().subscribe((data) => {
            this.groupeEtudes = data;
            this._groupeEtudesFilter = {...this.groupeEtudes}
        });
        this.groupeTypeService.findAll().subscribe((data) => {
            this.groupeTypes = data;
            this._groupeTypesFilter = {...this.groupeTypes}
        });
        this.statutSocialService.findAll().subscribe((data) => {
            this.statutSocials = data;
            this._statutSocialsFilter = {...this.statutSocials}
        });
        this.interetEtudiantService.findAll().subscribe((data) => {
            this.interetEtudiants = data;
            this._interetEtudiantsFilter = {...this.interetEtudiants}
        });
        this.niveauEtudeService.findAll().subscribe((data) => {
            this.niveauEtudes = data;
            this._niveauEtudesFilter = {...this.niveauEtudes}
        });
        this.fonctionService.findAll().subscribe((data) => {
            this.fonctions = data;
            this._fonctionsFilter = {...this.fonctions}
        });
        this.quizService.findAll().subscribe((data) => {
            this.quizs = data;
            this._quizsFilter = {...this.quizs}
        });
        this.packStudentService.findAll().subscribe((data) => {
            this.packStudents = data;
            this._packStudentsFilter = {...this.packStudents}
        });
        this.skillService.findAll().subscribe((data) => {
            this.skills = data;
            this._skillsFilter = {...this.skills}
        });
    }

    displayEtudiant(item: EtudiantDto): string {
        return item && item.fullName ? item.fullName : "";

    }

    filterEtudiant(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._etudiantsFilter = this.etudiants.filter(s =>
                s.fullName?.toLowerCase()?.includes(value)
            )
        } else {
            this._etudiantsFilter = this.etudiants
        }
    }

    displayEtatInscription(item: EtatInscriptionDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterEtatInscription(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._etatInscriptionsFilter = this.etatInscriptions.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._etatInscriptionsFilter = this.etatInscriptions
        }
    }

    displayParcours(item: ParcoursDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterParcours(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._parcourssFilter = this.parcourss.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._parcourssFilter = this.parcourss
        }
    }

    displayGroupeEtude(item: GroupeEtudeDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterGroupeEtude(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._groupeEtudesFilter = this.groupeEtudes.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._groupeEtudesFilter = this.groupeEtudes
        }
    }

    displayGroupeType(item: GroupeTypeDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterGroupeType(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._groupeTypesFilter = this.groupeTypes.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._groupeTypesFilter = this.groupeTypes
        }
    }

    displayStatutSocial(item: StatutSocialDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterStatutSocial(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._statutSocialsFilter = this.statutSocials.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._statutSocialsFilter = this.statutSocials
        }
    }

    displayInteretEtudiant(item: InteretEtudiantDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterInteretEtudiant(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._interetEtudiantsFilter = this.interetEtudiants.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._interetEtudiantsFilter = this.interetEtudiants
        }
    }

    displayNiveauEtude(item: NiveauEtudeDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterNiveauEtude(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._niveauEtudesFilter = this.niveauEtudes.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._niveauEtudesFilter = this.niveauEtudes
        }
    }

    displayFonction(item: FonctionDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterFonction(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._fonctionsFilter = this.fonctions.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._fonctionsFilter = this.fonctions
        }
    }

    displayQuiz(item: QuizDto): string {
        return item && item.lib ? item.lib : "";

    }

    filterQuiz(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._quizsFilter = this.quizs.filter(s =>
                s.lib?.toLowerCase()?.includes(value)
            )
        } else {
            this._quizsFilter = this.quizs
        }
    }

    displayPackStudent(item: PackStudentDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterPackStudent(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._packStudentsFilter = this.packStudents.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._packStudentsFilter = this.packStudents
        }
    }

    displaySkill(item: SkillDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterSkill(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._skillsFilter = this.skills.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._skillsFilter = this.skills
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
                this.item = new InscriptionDto();
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
        this.validInscriptionNumeroInscription = value;
        this.validInscriptionEtudiant = value;
        this.validInscriptionEtatInscription = value;
        this.validInscriptionParcours = value;
        this.validInscriptionGroupeEtude = value;
        this.validInscriptionGroupeType = value;
        this.validInscriptionStatutSocial = value;
        this.validInscriptionInteretEtudiant = value;
        this.validInscriptionNiveauEtude = value;
        this.validInscriptionFonction = value;
        this.validInscriptionQuiz = value;
    }


    public validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validateInscriptionNumeroInscription();
        this.validateInscriptionEtudiant();
        this.validateInscriptionEtatInscription();
        this.validateInscriptionParcours();
        this.validateInscriptionGroupeEtude();
        this.validateInscriptionGroupeType();
        this.validateInscriptionStatutSocial();
        this.validateInscriptionInteretEtudiant();
        this.validateInscriptionNiveauEtude();
        this.validateInscriptionFonction();
        this.validateInscriptionQuiz();
    }

    public validateInscriptionNumeroInscription() {
        if (this.stringUtilService.isEmpty(this.item.numeroInscription)) {
            this.errorMessages.push('Numero inscription non valide');
            this.validInscriptionNumeroInscription = false;
        } else {
            this.validInscriptionNumeroInscription = true;
        }
    }

    public validateInscriptionEtudiant() {
        if (this.stringUtilService.isEmpty(this.item.etudiant)) {
            this.errorMessages.push('Etudiant non valide');
            this.validInscriptionEtudiant = false;
        } else {
            this.validInscriptionEtudiant = true;
        }
    }

    public validateInscriptionEtatInscription() {
        if (this.stringUtilService.isEmpty(this.item.etatInscription)) {
            this.errorMessages.push('Etat inscription non valide');
            this.validInscriptionEtatInscription = false;
        } else {
            this.validInscriptionEtatInscription = true;
        }
    }

    public validateInscriptionParcours() {
        if (this.stringUtilService.isEmpty(this.item.parcours)) {
            this.errorMessages.push('Parcours non valide');
            this.validInscriptionParcours = false;
        } else {
            this.validInscriptionParcours = true;
        }
    }

    public validateInscriptionGroupeEtude() {
        if (this.stringUtilService.isEmpty(this.item.groupeEtude)) {
            this.errorMessages.push('Groupe etude non valide');
            this.validInscriptionGroupeEtude = false;
        } else {
            this.validInscriptionGroupeEtude = true;
        }
    }

    public validateInscriptionGroupeType() {
        if (this.stringUtilService.isEmpty(this.item.groupeType)) {
            this.errorMessages.push('Groupe type non valide');
            this.validInscriptionGroupeType = false;
        } else {
            this.validInscriptionGroupeType = true;
        }
    }

    public validateInscriptionStatutSocial() {
        if (this.stringUtilService.isEmpty(this.item.statutSocial)) {
            this.errorMessages.push('Statut social non valide');
            this.validInscriptionStatutSocial = false;
        } else {
            this.validInscriptionStatutSocial = true;
        }
    }

    public validateInscriptionInteretEtudiant() {
        if (this.stringUtilService.isEmpty(this.item.interetEtudiant)) {
            this.errorMessages.push('Interet etudiant non valide');
            this.validInscriptionInteretEtudiant = false;
        } else {
            this.validInscriptionInteretEtudiant = true;
        }
    }

    public validateInscriptionNiveauEtude() {
        if (this.stringUtilService.isEmpty(this.item.niveauEtude)) {
            this.errorMessages.push('Niveau etude non valide');
            this.validInscriptionNiveauEtude = false;
        } else {
            this.validInscriptionNiveauEtude = true;
        }
    }

    public validateInscriptionFonction() {
        if (this.stringUtilService.isEmpty(this.item.fonction)) {
            this.errorMessages.push('Fonction non valide');
            this.validInscriptionFonction = false;
        } else {
            this.validInscriptionFonction = true;
        }
    }

    public validateInscriptionQuiz() {
        if (this.stringUtilService.isEmpty(this.item.quiz)) {
            this.errorMessages.push('Quiz non valide');
            this.validInscriptionQuiz = false;
        } else {
            this.validInscriptionQuiz = true;
        }
    }


    public async openCreateGroupeType(groupeType: string) {
        const isPermistted = await this.roleService.isPermitted('GroupeType', 'add');
        if (isPermistted) {
            this.groupeType = new GroupeTypeDto();
            this.createGroupeTypeDialog = true;
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public async openCreateGroupeEtude(groupeEtude: string) {
        const isPermistted = await this.roleService.isPermitted('GroupeEtude', 'add');
        if (isPermistted) {
            this.groupeEtude = new GroupeEtudeDto();
            this.createGroupeEtudeDialog = true;
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    get groupeType(): GroupeTypeDto {
        return this.groupeTypeService.item;
    }

    set groupeType(value: GroupeTypeDto) {
        this.groupeTypeService.item = value;
    }

    get groupeTypes(): Array<GroupeTypeDto> {
        return this.groupeTypeService.items;
    }

    set groupeTypes(value: Array<GroupeTypeDto>) {
        this.groupeTypeService.items = value;
    }

    get createGroupeTypeDialog(): boolean {
        return this.groupeTypeService.createDialog;
    }

    set createGroupeTypeDialog(value: boolean) {
        this.groupeTypeService.createDialog = value;
    }

    get packStudent(): PackStudentDto {
        return this.packStudentService.item;
    }

    set packStudent(value: PackStudentDto) {
        this.packStudentService.item = value;
    }

    get packStudents(): Array<PackStudentDto> {
        return this.packStudentService.items;
    }

    set packStudents(value: Array<PackStudentDto>) {
        this.packStudentService.items = value;
    }

    get createPackStudentDialog(): boolean {
        return this.packStudentService.createDialog;
    }

    set createPackStudentDialog(value: boolean) {
        this.packStudentService.createDialog = value;
    }

    get statutSocial(): StatutSocialDto {
        return this.statutSocialService.item;
    }

    set statutSocial(value: StatutSocialDto) {
        this.statutSocialService.item = value;
    }

    get statutSocials(): Array<StatutSocialDto> {
        return this.statutSocialService.items;
    }

    set statutSocials(value: Array<StatutSocialDto>) {
        this.statutSocialService.items = value;
    }

    get createStatutSocialDialog(): boolean {
        return this.statutSocialService.createDialog;
    }

    set createStatutSocialDialog(value: boolean) {
        this.statutSocialService.createDialog = value;
    }

    get niveauEtude(): NiveauEtudeDto {
        return this.niveauEtudeService.item;
    }

    set niveauEtude(value: NiveauEtudeDto) {
        this.niveauEtudeService.item = value;
    }

    get niveauEtudes(): Array<NiveauEtudeDto> {
        return this.niveauEtudeService.items;
    }

    set niveauEtudes(value: Array<NiveauEtudeDto>) {
        this.niveauEtudeService.items = value;
    }

    get createNiveauEtudeDialog(): boolean {
        return this.niveauEtudeService.createDialog;
    }

    set createNiveauEtudeDialog(value: boolean) {
        this.niveauEtudeService.createDialog = value;
    }

    get quiz(): QuizDto {
        return this.quizService.item;
    }

    set quiz(value: QuizDto) {
        this.quizService.item = value;
    }

    get quizs(): Array<QuizDto> {
        return this.quizService.items;
    }

    set quizs(value: Array<QuizDto>) {
        this.quizService.items = value;
    }

    get createQuizDialog(): boolean {
        return this.quizService.createDialog;
    }

    set createQuizDialog(value: boolean) {
        this.quizService.createDialog = value;
    }

    get parcours(): ParcoursDto {
        return this.parcoursService.item;
    }

    set parcours(value: ParcoursDto) {
        this.parcoursService.item = value;
    }

    get parcourss(): Array<ParcoursDto> {
        return this.parcoursService.items;
    }

    set parcourss(value: Array<ParcoursDto>) {
        this.parcoursService.items = value;
    }

    get createParcoursDialog(): boolean {
        return this.parcoursService.createDialog;
    }

    set createParcoursDialog(value: boolean) {
        this.parcoursService.createDialog = value;
    }

    get skill(): SkillDto {
        return this.skillService.item;
    }

    set skill(value: SkillDto) {
        this.skillService.item = value;
    }

    get skills(): Array<SkillDto> {
        return this.skillService.items;
    }

    set skills(value: Array<SkillDto>) {
        this.skillService.items = value;
    }

    get createSkillDialog(): boolean {
        return this.skillService.createDialog;
    }

    set createSkillDialog(value: boolean) {
        this.skillService.createDialog = value;
    }

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

    get createEtudiantDialog(): boolean {
        return this.etudiantService.createDialog;
    }

    set createEtudiantDialog(value: boolean) {
        this.etudiantService.createDialog = value;
    }

    get interetEtudiant(): InteretEtudiantDto {
        return this.interetEtudiantService.item;
    }

    set interetEtudiant(value: InteretEtudiantDto) {
        this.interetEtudiantService.item = value;
    }

    get interetEtudiants(): Array<InteretEtudiantDto> {
        return this.interetEtudiantService.items;
    }

    set interetEtudiants(value: Array<InteretEtudiantDto>) {
        this.interetEtudiantService.items = value;
    }

    get createInteretEtudiantDialog(): boolean {
        return this.interetEtudiantService.createDialog;
    }

    set createInteretEtudiantDialog(value: boolean) {
        this.interetEtudiantService.createDialog = value;
    }

    get etatInscription(): EtatInscriptionDto {
        return this.etatInscriptionService.item;
    }

    set etatInscription(value: EtatInscriptionDto) {
        this.etatInscriptionService.item = value;
    }

    get etatInscriptions(): Array<EtatInscriptionDto> {
        return this.etatInscriptionService.items;
    }

    set etatInscriptions(value: Array<EtatInscriptionDto>) {
        this.etatInscriptionService.items = value;
    }

    get createEtatInscriptionDialog(): boolean {
        return this.etatInscriptionService.createDialog;
    }

    set createEtatInscriptionDialog(value: boolean) {
        this.etatInscriptionService.createDialog = value;
    }

    get fonction(): FonctionDto {
        return this.fonctionService.item;
    }

    set fonction(value: FonctionDto) {
        this.fonctionService.item = value;
    }

    get fonctions(): Array<FonctionDto> {
        return this.fonctionService.items;
    }

    set fonctions(value: Array<FonctionDto>) {
        this.fonctionService.items = value;
    }

    get createFonctionDialog(): boolean {
        return this.fonctionService.createDialog;
    }

    set createFonctionDialog(value: boolean) {
        this.fonctionService.createDialog = value;
    }

    get groupeEtude(): GroupeEtudeDto {
        return this.groupeEtudeService.item;
    }

    set groupeEtude(value: GroupeEtudeDto) {
        this.groupeEtudeService.item = value;
    }

    get groupeEtudes(): Array<GroupeEtudeDto> {
        return this.groupeEtudeService.items;
    }

    set groupeEtudes(value: Array<GroupeEtudeDto>) {
        this.groupeEtudeService.items = value;
    }

    get createGroupeEtudeDialog(): boolean {
        return this.groupeEtudeService.createDialog;
    }

    set createGroupeEtudeDialog(value: boolean) {
        this.groupeEtudeService.createDialog = value;
    }


    get validInscriptionNumeroInscription(): boolean {
        return this._validInscriptionNumeroInscription;
    }

    set validInscriptionNumeroInscription(value: boolean) {
        this._validInscriptionNumeroInscription = value;
    }

    get validInscriptionEtudiant(): boolean {
        return this._validInscriptionEtudiant;
    }

    set validInscriptionEtudiant(value: boolean) {
        this._validInscriptionEtudiant = value;
    }

    get validInscriptionEtatInscription(): boolean {
        return this._validInscriptionEtatInscription;
    }

    set validInscriptionEtatInscription(value: boolean) {
        this._validInscriptionEtatInscription = value;
    }

    get validInscriptionParcours(): boolean {
        return this._validInscriptionParcours;
    }

    set validInscriptionParcours(value: boolean) {
        this._validInscriptionParcours = value;
    }

    get validInscriptionGroupeEtude(): boolean {
        return this._validInscriptionGroupeEtude;
    }

    set validInscriptionGroupeEtude(value: boolean) {
        this._validInscriptionGroupeEtude = value;
    }

    get validInscriptionGroupeType(): boolean {
        return this._validInscriptionGroupeType;
    }

    set validInscriptionGroupeType(value: boolean) {
        this._validInscriptionGroupeType = value;
    }

    get validInscriptionStatutSocial(): boolean {
        return this._validInscriptionStatutSocial;
    }

    set validInscriptionStatutSocial(value: boolean) {
        this._validInscriptionStatutSocial = value;
    }

    get validInscriptionInteretEtudiant(): boolean {
        return this._validInscriptionInteretEtudiant;
    }

    set validInscriptionInteretEtudiant(value: boolean) {
        this._validInscriptionInteretEtudiant = value;
    }

    get validInscriptionNiveauEtude(): boolean {
        return this._validInscriptionNiveauEtude;
    }

    set validInscriptionNiveauEtude(value: boolean) {
        this._validInscriptionNiveauEtude = value;
    }

    get validInscriptionFonction(): boolean {
        return this._validInscriptionFonction;
    }

    set validInscriptionFonction(value: boolean) {
        this._validInscriptionFonction = value;
    }

    get validInscriptionQuiz(): boolean {
        return this._validInscriptionQuiz;
    }

    set validInscriptionQuiz(value: boolean) {
        this._validInscriptionQuiz = value;
    }

    get validEtatInscriptionRef(): boolean {
        return this._validEtatInscriptionRef;
    }

    set validEtatInscriptionRef(value: boolean) {
        this._validEtatInscriptionRef = value;
    }

    get validParcoursCode(): boolean {
        return this._validParcoursCode;
    }

    set validParcoursCode(value: boolean) {
        this._validParcoursCode = value;
    }

    get validParcoursLibelle(): boolean {
        return this._validParcoursLibelle;
    }

    set validParcoursLibelle(value: boolean) {
        this._validParcoursLibelle = value;
    }

    get validGroupeEtudeLibelle(): boolean {
        return this._validGroupeEtudeLibelle;
    }

    set validGroupeEtudeLibelle(value: boolean) {
        this._validGroupeEtudeLibelle = value;
    }

    get validGroupeTypeCode(): boolean {
        return this._validGroupeTypeCode;
    }

    set validGroupeTypeCode(value: boolean) {
        this._validGroupeTypeCode = value;
    }

    get validGroupeTypeLibelle(): boolean {
        return this._validGroupeTypeLibelle;
    }

    set validGroupeTypeLibelle(value: boolean) {
        this._validGroupeTypeLibelle = value;
    }

    get validStatutSocialCode(): boolean {
        return this._validStatutSocialCode;
    }

    set validStatutSocialCode(value: boolean) {
        this._validStatutSocialCode = value;
    }

    get validStatutSocialLibelle(): boolean {
        return this._validStatutSocialLibelle;
    }

    set validStatutSocialLibelle(value: boolean) {
        this._validStatutSocialLibelle = value;
    }

    get validInteretEtudiantCode(): boolean {
        return this._validInteretEtudiantCode;
    }

    set validInteretEtudiantCode(value: boolean) {
        this._validInteretEtudiantCode = value;
    }

    get validInteretEtudiantLibelle(): boolean {
        return this._validInteretEtudiantLibelle;
    }

    set validInteretEtudiantLibelle(value: boolean) {
        this._validInteretEtudiantLibelle = value;
    }

    get validNiveauEtudeLibelle(): boolean {
        return this._validNiveauEtudeLibelle;
    }

    set validNiveauEtudeLibelle(value: boolean) {
        this._validNiveauEtudeLibelle = value;
    }

    get validNiveauEtudeCode(): boolean {
        return this._validNiveauEtudeCode;
    }

    set validNiveauEtudeCode(value: boolean) {
        this._validNiveauEtudeCode = value;
    }

    get validFonctionCode(): boolean {
        return this._validFonctionCode;
    }

    set validFonctionCode(value: boolean) {
        this._validFonctionCode = value;
    }

    get validFonctionLibelle(): boolean {
        return this._validFonctionLibelle;
    }

    set validFonctionLibelle(value: boolean) {
        this._validFonctionLibelle = value;
    }

    get validQuizRef(): boolean {
        return this._validQuizRef;
    }

    set validQuizRef(value: boolean) {
        this._validQuizRef = value;
    }

    get validQuizLib(): boolean {
        return this._validQuizLib;
    }

    set validQuizLib(value: boolean) {
        this._validQuizLib = value;
    }

    get validPackStudentCode(): boolean {
        return this._validPackStudentCode;
    }

    set validPackStudentCode(value: boolean) {
        this._validPackStudentCode = value;
    }

    get validPackStudentLibelle(): boolean {
        return this._validPackStudentLibelle;
    }

    set validPackStudentLibelle(value: boolean) {
        this._validPackStudentLibelle = value;
    }

    get validSkillCode(): boolean {
        return this._validSkillCode;
    }

    set validSkillCode(value: boolean) {
        this._validSkillCode = value;
    }

    get validSkillLibelle(): boolean {
        return this._validSkillLibelle;
    }

    set validSkillLibelle(value: boolean) {
        this._validSkillLibelle = value;
    }


    get items(): Array<InscriptionDto> {
        return this.service.items;
    }

    set items(value: Array<InscriptionDto>) {
        this.service.items = value;
    }

    get item(): InscriptionDto {
        return this.service.item;
    }

    set item(value: InscriptionDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): InscriptionCriteria {
        return this.service.criteria;
    }

    set criteria(value: InscriptionCriteria) {
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

}
