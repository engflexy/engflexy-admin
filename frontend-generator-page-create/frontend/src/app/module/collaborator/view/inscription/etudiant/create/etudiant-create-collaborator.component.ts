import {Component, OnInit} from '@angular/core';

import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {NgForOf, NgIf} from "@angular/common";

import {FuseAlertService} from "../../../../../@fuse/components/alert";

import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatIconModule} from "@angular/material/icon";
import {MatTooltipModule} from "@angular/material/tooltip";

import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";



import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';


import {environment} from '../../../../../environments/environment';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';
import {StringUtilService} from '../../../../zynerator/util/StringUtil.service';
import {ServiceLocator} from '../../../../zynerator/service/ServiceLocator';

import {FormsModule} from "@angular/forms";
import {MatCheckboxModule} from "@angular/material/checkbox

import {TranslocoModule} from "@ngneat/transloco";



import {EtudiantCollaboratorService} from '../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantCriteria} from '../../../../shared/criteria/inscription/EtudiantCriteria.model';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from '../../../../shared/service/collaborator/course/ParcoursCollaborator.service';
import {QuizEtudiantDto} from '../../../../shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCollaboratorService} from '../../../../shared/service/collaborator/quizetudiant/QuizEtudiantCollaborator.service';
import {InteretEtudiantDto} from '../../../../shared/model/inscriptionref/InteretEtudiant.model';
import {InteretEtudiantCollaboratorService} from '../../../../shared/service/collaborator/inscriptionref/InteretEtudiantCollaborator.service';
import {StatutSocialDto} from '../../../../shared/model/inscriptionref/StatutSocial.model';
import {StatutSocialCollaboratorService} from '../../../../shared/service/collaborator/inscriptionref/StatutSocialCollaborator.service';
import {GroupeEtudiantDto} from '../../../../shared/model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service';
import {LangueDto} from '../../../../shared/model/inscriptionref/Langue.model';
import {LangueCollaboratorService} from '../../../../shared/service/collaborator/inscriptionref/LangueCollaborator.service';
import {ReponseEtudiantDto} from '../../../../shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantCollaboratorService} from '../../../../shared/service/collaborator/quizetudiant/ReponseEtudiantCollaborator.service';
import {GroupeEtudeDto} from '../../../../shared/model/grpe/GroupeEtude.model';
import {GroupeEtudeCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeEtudeCollaborator.service';
import {CollaboratorDto} from '../../../../shared/model/vocab/Collaborator.model';
import {CollaboratorCollaboratorService} from '../../../../shared/service/collaborator/vocab/CollaboratorCollaborator.service';
import {QuizDto} from '../../../../shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from '../../../../shared/service/collaborator/quiz/QuizCollaborator.service';
import {SkillDto} from '../../../../shared/model/inscriptionref/Skill.model';
import {SkillCollaboratorService} from '../../../../shared/service/collaborator/inscriptionref/SkillCollaborator.service';
import {FonctionDto} from '../../../../shared/model/inscriptionref/Fonction.model';
import {FonctionCollaboratorService} from '../../../../shared/service/collaborator/inscriptionref/FonctionCollaborator.service';
import {GroupeEtudiantDetailDto} from '../../../../shared/model/grpe/GroupeEtudiantDetail.model';
import {GroupeEtudiantDetailCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service';
import {PackStudentDto} from '../../../../shared/model/pack/PackStudent.model';
import {PackStudentCollaboratorService} from '../../../../shared/service/collaborator/pack/PackStudentCollaborator.service';
import {TeacherLocalityDto} from '../../../../shared/model/inscriptionref/TeacherLocality.model';
import {TeacherLocalityCollaboratorService} from '../../../../shared/service/collaborator/inscriptionref/TeacherLocalityCollaborator.service';
import {NiveauEtudeDto} from '../../../../shared/model/inscriptionref/NiveauEtude.model';
import {NiveauEtudeCollaboratorService} from '../../../../shared/service/collaborator/inscriptionref/NiveauEtudeCollaborator.service';

@Component({
  selector: 'app-etudiant-create-collaborator',
  templateUrl: './etudiant-create-collaborator.component.html',
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
export class EtudiantCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _teacherLocalitysFilter:  TeacherLocalityDto[];
  _parcourssFilter:  ParcoursDto[];
  _groupeEtudesFilter:  GroupeEtudeDto[];
  _packStudentsFilter:  PackStudentDto[];
  _statutSocialsFilter:  StatutSocialDto[];
  _interetEtudiantsFilter:  InteretEtudiantDto[];
  _niveauEtudesFilter:  NiveauEtudeDto[];
  _skillsFilter:  SkillDto[];
  _fonctionsFilter:  FonctionDto[];
  _languesFilter:  LangueDto[];
  _collaboratorsFilter:  CollaboratorDto[];

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

	constructor(private alert: FuseAlertService, private service: EtudiantCollaboratorService , private parcoursService: ParcoursCollaboratorService, private quizEtudiantService: QuizEtudiantCollaboratorService, private interetEtudiantService: InteretEtudiantCollaboratorService, private statutSocialService: StatutSocialCollaboratorService, private groupeEtudiantService: GroupeEtudiantCollaboratorService, private langueService: LangueCollaboratorService, private groupeEtudeService: GroupeEtudeCollaboratorService, private collaboratorService: CollaboratorCollaboratorService, private quizService: QuizCollaboratorService, private skillService: SkillCollaboratorService, private fonctionService: FonctionCollaboratorService, private groupeEtudiantDetailService: GroupeEtudiantDetailCollaboratorService, private packStudentService: PackStudentCollaboratorService, private teacherLocalityService: TeacherLocalityCollaboratorService, private niveauEtudeService: NiveauEtudeCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.quizEtudiantsElement.quiz = new QuizDto();
        this.quizService.findAll().subscribe((data) => this.quizs = data);
        this.groupeEtudiantService.findAll().subscribe(data => this.prepareGroupeEtudiantDetails(data));
        this.groupeEtudiantDetailsElement.groupeEtudiant = new GroupeEtudiantDto();
        this.groupeEtudiantService.findAll().subscribe((data) => this.groupeEtudiants = data);
        this.teacherLocalityService.findAll().subscribe((data) => {this.teacherLocalitys = data; this._teacherLocalitysFilter = {...this.teacherLocalitys}});
        this.parcoursService.findAll().subscribe((data) => {this.parcourss = data; this._parcourssFilter = {...this.parcourss}});
        this.groupeEtudeService.findAll().subscribe((data) => {this.groupeEtudes = data; this._groupeEtudesFilter = {...this.groupeEtudes}});
        this.packStudentService.findAll().subscribe((data) => {this.packStudents = data; this._packStudentsFilter = {...this.packStudents}});
        this.statutSocialService.findAll().subscribe((data) => {this.statutSocials = data; this._statutSocialsFilter = {...this.statutSocials}});
        this.interetEtudiantService.findAll().subscribe((data) => {this.interetEtudiants = data; this._interetEtudiantsFilter = {...this.interetEtudiants}});
        this.niveauEtudeService.findAll().subscribe((data) => {this.niveauEtudes = data; this._niveauEtudesFilter = {...this.niveauEtudes}});
        this.skillService.findAll().subscribe((data) => {this.skills = data; this._skillsFilter = {...this.skills}});
        this.fonctionService.findAll().subscribe((data) => {this.fonctions = data; this._fonctionsFilter = {...this.fonctions}});
        this.langueService.findAll().subscribe((data) => {this.langues = data; this._languesFilter = {...this.langues}});
        this.collaboratorService.findAll().subscribe((data) => {this.collaborators = data; this._collaboratorsFilter = {...this.collaborators}});
    }

  displayTeacherLocality(item: TeacherLocalityDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterTeacherLocality(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._teacherLocalitysFilter = this.teacherLocalitys.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._teacherLocalitysFilter = this.teacherLocalitys
	}
 }
  displayParcours(item: ParcoursDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterParcours(value: string){
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

  filterGroupeEtude(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._groupeEtudesFilter = this.groupeEtudes.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._groupeEtudesFilter = this.groupeEtudes
	}
 }
  displayPackStudent(item: PackStudentDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterPackStudent(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._packStudentsFilter = this.packStudents.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._packStudentsFilter = this.packStudents
	}
 }
  displayStatutSocial(item: StatutSocialDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterStatutSocial(value: string){
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

  filterInteretEtudiant(value: string){
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

  filterNiveauEtude(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._niveauEtudesFilter = this.niveauEtudes.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._niveauEtudesFilter = this.niveauEtudes
	}
 }
  displaySkill(item: SkillDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterSkill(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._skillsFilter = this.skills.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._skillsFilter = this.skills
	}
 }
  displayFonction(item: FonctionDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterFonction(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._fonctionsFilter = this.fonctions.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._fonctionsFilter = this.fonctions
	}
 }
  displayLangue(item: LangueDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterLangue(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._languesFilter = this.langues.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._languesFilter = this.langues
	}
 }
  displayCollaborator(item: CollaboratorDto): string {
	return item && item.id ? item.id : "";

  }

  filterCollaborator(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._collaboratorsFilter = this.collaborators.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._collaboratorsFilter = this.collaborators
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
                this.item = new EtudiantDto();
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


     prepareGroupeEtudiantDetails(groupeEtudiants: Array<GroupeEtudiantDto>): void{
        if( groupeEtudiants != null){
                groupeEtudiants.forEach(e => {
                const groupeEtudiantDetail = new GroupeEtudiantDetailDto();
                groupeEtudiantDetail.groupeEtudiant = e;
                this.groupeEtudiantDetails.push(groupeEtudiantDetail);
            });
        }
    }

    validateQuizEtudiants(){
        this.errorMessages = new Array();
        this.validateQuizEtudiantsRef();
    }


    public  setValidation(value: boolean){
        this.validQuizEtudiantsRef = value;
    }

    public addQuizEtudiants() {
        if( this.item.quizEtudiants == null )
            this.item.quizEtudiants = new Array<QuizEtudiantDto>();
       this.validateQuizEtudiants();
       if (this.errorMessages.length === 0) {
              this.item.quizEtudiants.push({... this.quizEtudiantsElement});
              this.quizEtudiantsElement = new QuizEtudiantDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletequizEtudiants(p: QuizEtudiantDto) {
        this.item.quizEtudiants.forEach((element, index) => {
            if (element === p) { this.item.quizEtudiants.splice(index, 1); }
        });
    }

    public editquizEtudiants(p: QuizEtudiantDto) {
        this.quizEtudiantsElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
    }


    public validateQuizEtudiantsRef(){
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

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
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
