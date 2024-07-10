import {Component, OnInit, Input} from '@angular/core';
import {ConfirmationService, MessageService} from 'primeng/api';
import {FileTempDto} from 'src/app/zynerator/dto/FileTempDto.model';
import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';

import {environment} from 'src/environments/environment';

import {RoleService} from 'src/app/zynerator/security/shared/service/Role.service';
import {StringUtilService} from 'src/app/zynerator/util/StringUtil.service';
import {ServiceLocator} from 'src/app/zynerator/service/ServiceLocator';




import {EtudiantCollaboratorService} from 'src/app/shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantCriteria} from 'src/app/shared/criteria/inscription/EtudiantCriteria.model';


import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from 'src/app/shared/service/collaborator/course/ParcoursCollaborator.service';
import {QuizEtudiantDto} from 'src/app/shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/quizetudiant/QuizEtudiantCollaborator.service';
import {InteretEtudiantDto} from 'src/app/shared/model/inscriptionref/InteretEtudiant.model';
import {InteretEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/InteretEtudiantCollaborator.service';
import {StatutSocialDto} from 'src/app/shared/model/inscriptionref/StatutSocial.model';
import {StatutSocialCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/StatutSocialCollaborator.service';
import {GroupeEtudiantDto} from 'src/app/shared/model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service';
import {LangueDto} from 'src/app/shared/model/inscriptionref/Langue.model';
import {LangueCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/LangueCollaborator.service';
import {ReponseEtudiantDto} from 'src/app/shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/quizetudiant/ReponseEtudiantCollaborator.service';
import {GroupeEtudeDto} from 'src/app/shared/model/grpe/GroupeEtude.model';
import {GroupeEtudeCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeEtudeCollaborator.service';
import {CollaboratorDto} from 'src/app/shared/model/vocab/Collaborator.model';
import {CollaboratorCollaboratorService} from 'src/app/shared/service/collaborator/vocab/CollaboratorCollaborator.service';
import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuizCollaborator.service';
import {SkillDto} from 'src/app/shared/model/inscriptionref/Skill.model';
import {SkillCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/SkillCollaborator.service';
import {FonctionDto} from 'src/app/shared/model/inscriptionref/Fonction.model';
import {FonctionCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/FonctionCollaborator.service';
import {GroupeEtudiantDetailDto} from 'src/app/shared/model/grpe/GroupeEtudiantDetail.model';
import {GroupeEtudiantDetailCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service';
import {PackStudentDto} from 'src/app/shared/model/pack/PackStudent.model';
import {PackStudentCollaboratorService} from 'src/app/shared/service/collaborator/pack/PackStudentCollaborator.service';
import {TeacherLocalityDto} from 'src/app/shared/model/inscriptionref/TeacherLocality.model';
import {TeacherLocalityCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/TeacherLocalityCollaborator.service';
import {NiveauEtudeDto} from 'src/app/shared/model/inscriptionref/NiveauEtude.model';
import {NiveauEtudeCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/NiveauEtudeCollaborator.service';

@Component({
  selector: 'app-etudiant-edit-collaborator',
  templateUrl: './etudiant-edit-collaborator.component.html'
})
export class EtudiantEditCollaboratorComponent implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();


    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;
    private _file: any;
    private _files: any;


    private _quizEtudiantsElement = new QuizEtudiantDto();
    private _groupeEtudiantDetailsElement = new GroupeEtudiantDetailDto();


    private _validTeacherLocalityCode = true;
    private _validTeacherLocalityLibelle = true;
    private _validParcoursCode = true;
    private _validParcoursLibelle = true;
    private _validQuizEtudiantsRef = true;
    private _validGroupeEtudeLibelle = true;
    private _validPackStudentCode = true;
    private _validPackStudentLibelle = true;
    private _validStatutSocialCode = true;
    private _validStatutSocialLibelle = true;
    private _validInteretEtudiantCode = true;
    private _validInteretEtudiantLibelle = true;
    private _validNiveauEtudeLibelle = true;
    private _validNiveauEtudeCode = true;
    private _validSkillCode = true;
    private _validSkillLibelle = true;
    private _validFonctionCode = true;
    private _validFonctionLibelle = true;
    private _validLangueRef = true;
    private _validLangueLibelle = true;


    private _groupeEtudiantDetails: Array<GroupeEtudiantDetailDto> = [];

    constructor(private service: EtudiantCollaboratorService , private parcoursService: ParcoursCollaboratorService, private quizEtudiantService: QuizEtudiantCollaboratorService, private interetEtudiantService: InteretEtudiantCollaboratorService, private statutSocialService: StatutSocialCollaboratorService, private groupeEtudiantService: GroupeEtudiantCollaboratorService, private langueService: LangueCollaboratorService, private groupeEtudeService: GroupeEtudeCollaboratorService, private collaboratorService: CollaboratorCollaboratorService, private quizService: QuizCollaboratorService, private skillService: SkillCollaboratorService, private fonctionService: FonctionCollaboratorService, private groupeEtudiantDetailService: GroupeEtudiantDetailCollaboratorService, private packStudentService: PackStudentCollaboratorService, private teacherLocalityService: TeacherLocalityCollaboratorService, private niveauEtudeService: NiveauEtudeCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.quizEtudiantsElement.quiz = new QuizDto();
        this.quizService.findAll().subscribe((data) => this.quizs = data);

        this.groupeEtudiantService.findAll().subscribe(data => this.prepareGroupeEtudiantDetails(data));
        this.groupeEtudiantDetailsElement.groupeEtudiant = new GroupeEtudiantDto();
        this.groupeEtudiantService.findAll().subscribe((data) => this.groupeEtudiants = data);

        this.teacherLocalityService.findAll().subscribe((data) => this.teacherLocalitys = data);
        this.parcoursService.findAll().subscribe((data) => this.parcourss = data);
        this.groupeEtudeService.findAll().subscribe((data) => this.groupeEtudes = data);
        this.packStudentService.findAll().subscribe((data) => this.packStudents = data);
        this.statutSocialService.findAll().subscribe((data) => this.statutSocials = data);
        this.interetEtudiantService.findAll().subscribe((data) => this.interetEtudiants = data);
        this.niveauEtudeService.findAll().subscribe((data) => this.niveauEtudes = data);
        this.skillService.findAll().subscribe((data) => this.skills = data);
        this.fonctionService.findAll().subscribe((data) => this.fonctions = data);
        this.langueService.findAll().subscribe((data) => this.langues = data);
        this.collaboratorService.findAll().subscribe((data) => this.collaborators = data);
    }

    public prepareEdit() {
    }



 public edit(): void {
        this.submitted = true;
        this.prepareEdit();
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.editWithShowOption(false);
        } else {
            this.messageService.add({
                severity: 'error',
                summary: 'Erreurs',
                detail: 'Merci de corrigé les erreurs sur le formulaire'
            });
        }
    }

    public editWithShowOption(showList: boolean) {
        this.service.edit().subscribe(religion=>{
            const myIndex = this.items.findIndex(e => e.id === this.item.id);
            this.items[myIndex] = religion;
            this.editDialog = false;
            this.submitted = false;
            this.item = new EtudiantDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }




    prepareGroupeEtudiantDetails(groupeEtudiants: Array<GroupeEtudiantDto>): void{
        if( groupeEtudiants != null){
            groupeEtudiants.forEach(e => {
                const groupeEtudiantDetail = new GroupeEtudiantDetailDto();
                groupeEtudiantDetail.groupeEtudiant = e;
                this.groupeEtudiantDetails.push(groupeEtudiantDetail);
            });
        }
    }

    public validateQuizEtudiants(){
        this.errorMessages = new Array();
        this.validateQuizEtudiantsRef();
    }

    public setValidation(value: boolean){
        this.validQuizEtudiantsRef = value;
    }

   public addQuizEtudiants() {
        if( this.item.quizEtudiants == null )
            this.item.quizEtudiants = new Array<QuizEtudiantDto>();
       this.validateQuizEtudiants();
       if (this.errorMessages.length === 0) {
            if(this.quizEtudiantsElement.id == null){
                this.item.quizEtudiants.push(this.quizEtudiantsElement);
            }else{
                const index = this.item.quizEtudiants.findIndex(e => e.id == this.quizEtudiantsElement.id);
                this.item.quizEtudiants[index] = this.quizEtudiantsElement;
            }
          this.quizEtudiantsElement = new QuizEtudiantDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteQuizEtudiants(p: QuizEtudiantDto) {
        this.item.quizEtudiants.forEach((element, index) => {
            if (element === p) { this.item.quizEtudiants.splice(index, 1); }
        });
    }

    public editQuizEtudiants(p: QuizEtudiantDto) {
        this.quizEtudiantsElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
    }



    private validateQuizEtudiantsRef(){
        if (this.quizEtudiantsElement.ref == null) {
        this.errorMessages.push('Ref de la quizEtudiant est  invalide');
            this.validQuizEtudiantsRef = false;
        } else {
            this.validQuizEtudiantsRef = true;
        }
    }


    get langue(): LangueDto {
        return this.langueService.item;
    }
    set langue(value: LangueDto) {
        this.langueService.item = value;
    }
    get langues(): Array<LangueDto> {
        return this.langueService.items;
    }
    set langues(value: Array<LangueDto>) {
        this.langueService.items = value;
    }
    get createLangueDialog(): boolean {
        return this.langueService.createDialog;
    }
    set createLangueDialog(value: boolean) {
        this.langueService.createDialog= value;
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
        this.packStudentService.createDialog= value;
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
        this.statutSocialService.createDialog= value;
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
        this.groupeEtudiantService.createDialog= value;
    }
    get collaborator(): CollaboratorDto {
        return this.collaboratorService.item;
    }
    set collaborator(value: CollaboratorDto) {
        this.collaboratorService.item = value;
    }
    get collaborators(): Array<CollaboratorDto> {
        return this.collaboratorService.items;
    }
    set collaborators(value: Array<CollaboratorDto>) {
        this.collaboratorService.items = value;
    }
    get createCollaboratorDialog(): boolean {
        return this.collaboratorService.createDialog;
    }
    set createCollaboratorDialog(value: boolean) {
        this.collaboratorService.createDialog= value;
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
        this.groupeEtudeService.createDialog= value;
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
        this.niveauEtudeService.createDialog= value;
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
        this.quizService.createDialog= value;
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
        this.parcoursService.createDialog= value;
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
        this.skillService.createDialog= value;
    }
    get teacherLocality(): TeacherLocalityDto {
        return this.teacherLocalityService.item;
    }
    set teacherLocality(value: TeacherLocalityDto) {
        this.teacherLocalityService.item = value;
    }
    get teacherLocalitys(): Array<TeacherLocalityDto> {
        return this.teacherLocalityService.items;
    }
    set teacherLocalitys(value: Array<TeacherLocalityDto>) {
        this.teacherLocalityService.items = value;
    }
    get createTeacherLocalityDialog(): boolean {
        return this.teacherLocalityService.createDialog;
    }
    set createTeacherLocalityDialog(value: boolean) {
        this.teacherLocalityService.createDialog= value;
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
        this.interetEtudiantService.createDialog= value;
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
        this.fonctionService.createDialog= value;
    }

    get groupeEtudiantDetails(): Array<GroupeEtudiantDetailDto> {
        if( this._groupeEtudiantDetails == null )
            this._groupeEtudiantDetails = new Array();
         return this._groupeEtudiantDetails;
    }

    set groupeEtudiantDetails(value: Array<GroupeEtudiantDetailDto>) {
        this._groupeEtudiantDetails = value;
    }
    get quizEtudiantsElement(): QuizEtudiantDto {
        if( this._quizEtudiantsElement == null )
            this._quizEtudiantsElement = new QuizEtudiantDto();
         return this._quizEtudiantsElement;
    }

    set quizEtudiantsElement(value: QuizEtudiantDto) {
        this._quizEtudiantsElement = value;
    }
    get groupeEtudiantDetailsElement(): GroupeEtudiantDetailDto {
        if( this._groupeEtudiantDetailsElement == null )
            this._groupeEtudiantDetailsElement = new GroupeEtudiantDetailDto();
         return this._groupeEtudiantDetailsElement;
    }

    set groupeEtudiantDetailsElement(value: GroupeEtudiantDetailDto) {
        this._groupeEtudiantDetailsElement = value;
    }


    get validTeacherLocalityCode(): boolean {
        return this._validTeacherLocalityCode;
    }
    set validTeacherLocalityCode(value: boolean) {
        this._validTeacherLocalityCode = value;
    }
    get validTeacherLocalityLibelle(): boolean {
        return this._validTeacherLocalityLibelle;
    }
    set validTeacherLocalityLibelle(value: boolean) {
        this._validTeacherLocalityLibelle = value;
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
    get validQuizEtudiantsRef(): boolean {
        return this._validQuizEtudiantsRef;
    }
    set validQuizEtudiantsRef(value: boolean) {
        this._validQuizEtudiantsRef = value;
    }
    get validGroupeEtudeLibelle(): boolean {
        return this._validGroupeEtudeLibelle;
    }
    set validGroupeEtudeLibelle(value: boolean) {
        this._validGroupeEtudeLibelle = value;
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
    get validLangueRef(): boolean {
        return this._validLangueRef;
    }
    set validLangueRef(value: boolean) {
        this._validLangueRef = value;
    }
    get validLangueLibelle(): boolean {
        return this._validLangueLibelle;
    }
    set validLangueLibelle(value: boolean) {
        this._validLangueLibelle = value;
    }

	get items(): Array<EtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<EtudiantDto>) {
        this.service.items = value;
    }

    get item(): EtudiantDto {
        return this.service.item;
    }

    set item(value: EtudiantDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): EtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: EtudiantCriteria) {
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
