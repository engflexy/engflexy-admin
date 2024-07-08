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



import {HomeWorkCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkCollaborator.service';
import {HomeWorkDto} from '../../../../shared/model/homework/HomeWork.model';
import {HomeWorkCriteria} from '../../../../shared/criteria/homework/HomeWorkCriteria.model';
import {HoweWorkQSTReponseDto} from '../../../../shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCollaboratorService} from '../../../../shared/service/collaborator/homework/HoweWorkQSTReponseCollaborator.service';
import {TypeDeQuestionDto} from '../../../../shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionCollaboratorService} from '../../../../shared/service/collaborator/quizref/TypeDeQuestionCollaborator.service';
import {HomeWorkEtudiantDto} from '../../../../shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkEtudiantCollaborator.service';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from '../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {ReponseEtudiantHomeWorkDto} from '../../../../shared/model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkCollaboratorService} from '../../../../shared/service/collaborator/homework/ReponseEtudiantHomeWorkCollaborator.service';
import {HomeWorkQuestionDto} from '../../../../shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';
import {TypeHomeWorkDto} from '../../../../shared/model/homework/TypeHomeWork.model';
import {TypeHomeWorkCollaboratorService} from '../../../../shared/service/collaborator/homework/TypeHomeWorkCollaborator.service';
import {CoursDto} from '../../../../shared/model/course/Cours.model';
import {CoursCollaboratorService} from '../../../../shared/service/collaborator/course/CoursCollaborator.service';

@Component({
  selector: 'app-home-work-create-collaborator',
  templateUrl: './home-work-create-collaborator.component.html',
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
export class HomeWorkCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _courssFilter:  CoursDto[];
  _typeHomeWorksFilter:  TypeHomeWorkDto[];

    private _homeWorkQuestionsElement = new HomeWorkQuestionDto();
    private _homeWorkEtudiantsElement = new HomeWorkEtudiantDto();


   private _validHomeWorkLibelle = true;
    private _validHomeWorkQuestionsRef = true;
    private _validHomeWorkQuestionsLibelle = true;
    private _validCoursCode = true;
    private _validCoursLibelle = true;
    private _validTypeHomeWorkCode = true;
    private _validTypeHomeWorkLib = true;

	constructor(private alert: FuseAlertService, private service: HomeWorkCollaboratorService , private typeDeQuestionService: TypeDeQuestionCollaboratorService, private homeWorkEtudiantService: HomeWorkEtudiantCollaboratorService, private etudiantService: EtudiantCollaboratorService, private homeWorkQuestionService: HomeWorkQuestionCollaboratorService, private typeHomeWorkService: TypeHomeWorkCollaboratorService, private coursService: CoursCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.homeWorkQuestionsElement.typeDeQuestion = new TypeDeQuestionDto();
        this.typeDeQuestionService.findAll().subscribe((data) => this.typeDeQuestions = data);
        this.homeWorkEtudiantsElement.etudiant = new EtudiantDto();
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
        this.coursService.findAll().subscribe((data) => {this.courss = data; this._courssFilter = {...this.courss}});
        this.typeHomeWorkService.findAll().subscribe((data) => {this.typeHomeWorks = data; this._typeHomeWorksFilter = {...this.typeHomeWorks}});
    }

  displayCours(item: CoursDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterCours(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._courssFilter = this.courss.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._courssFilter = this.courss
	}
 }
  displayTypeHomeWork(item: TypeHomeWorkDto): string {
	return item && item.lib ? item.lib : "";

  }

  filterTypeHomeWork(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._typeHomeWorksFilter = this.typeHomeWorks.filter(s =>
			s.lib?.toLowerCase()?.includes(value)
		)
	} else {
		this._typeHomeWorksFilter = this.typeHomeWorks
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
                this.item = new HomeWorkDto();
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



    validateHomeWorkQuestions(){
        this.errorMessages = new Array();
        this.validateHomeWorkQuestionsRef();
        this.validateHomeWorkQuestionsLibelle();
    }
    validateHomeWorkEtudiants(){
        this.errorMessages = new Array();
    }


    public  setValidation(value: boolean){
        this.validHomeWorkLibelle = value;
        this.validHomeWorkQuestionsRef = value;
        this.validHomeWorkQuestionsLibelle = value;
    }

    public addHomeWorkQuestions() {
        if( this.item.homeWorkQuestions == null )
            this.item.homeWorkQuestions = new Array<HomeWorkQuestionDto>();
       this.validateHomeWorkQuestions();
       if (this.errorMessages.length === 0) {
              this.item.homeWorkQuestions.push({... this.homeWorkQuestionsElement});
              this.homeWorkQuestionsElement = new HomeWorkQuestionDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletehomeWorkQuestions(p: HomeWorkQuestionDto) {
        this.item.homeWorkQuestions.forEach((element, index) => {
            if (element === p) { this.item.homeWorkQuestions.splice(index, 1); }
        });
    }

    public edithomeWorkQuestions(p: HomeWorkQuestionDto) {
        this.homeWorkQuestionsElement = {... p};
        this.activeTab = 0;
    }
    public addHomeWorkEtudiants() {
        if( this.item.homeWorkEtudiants == null )
            this.item.homeWorkEtudiants = new Array<HomeWorkEtudiantDto>();
       this.validateHomeWorkEtudiants();
       if (this.errorMessages.length === 0) {
              this.item.homeWorkEtudiants.push({... this.homeWorkEtudiantsElement});
              this.homeWorkEtudiantsElement = new HomeWorkEtudiantDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletehomeWorkEtudiants(p: HomeWorkEtudiantDto) {
        this.item.homeWorkEtudiants.forEach((element, index) => {
            if (element === p) { this.item.homeWorkEtudiants.splice(index, 1); }
        });
    }

    public edithomeWorkEtudiants(p: HomeWorkEtudiantDto) {
        this.homeWorkEtudiantsElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateHomeWorkLibelle();
    }

    public validateHomeWorkLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validHomeWorkLibelle = false;
        } else {
            this.validHomeWorkLibelle = true;
        }
    }

    public validateHomeWorkQuestionsRef(){
        if (this.homeWorkQuestionsElement.ref == null) {
            this.errorMessages.push('Ref de la homeWorkQuestion est  invalide');
            this.validHomeWorkQuestionsRef = false;
        } else {
            this.validHomeWorkQuestionsRef = true;
        }
    }
    public validateHomeWorkQuestionsLibelle(){
        if (this.homeWorkQuestionsElement.libelle == null) {
            this.errorMessages.push('Libelle de la homeWorkQuestion est  invalide');
            this.validHomeWorkQuestionsLibelle = false;
        } else {
            this.validHomeWorkQuestionsLibelle = true;
        }
    }

    public async openCreateTypeHomeWork(typeHomeWork: string) {
    const isPermistted = await this.roleService.isPermitted('TypeHomeWork', 'add');
    if(isPermistted) {
         this.typeHomeWork = new TypeHomeWorkDto();
         this.createTypeHomeWorkDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get typeHomeWork(): TypeHomeWorkDto {
        return this.typeHomeWorkService.item;
    }
    set typeHomeWork(value: TypeHomeWorkDto) {
        this.typeHomeWorkService.item = value;
    }
    get typeHomeWorks(): Array<TypeHomeWorkDto> {
        return this.typeHomeWorkService.items;
    }
    set typeHomeWorks(value: Array<TypeHomeWorkDto>) {
        this.typeHomeWorkService.items = value;
    }
    get createTypeHomeWorkDialog(): boolean {
        return this.typeHomeWorkService.createDialog;
    }
    set createTypeHomeWorkDialog(value: boolean) {
        this.typeHomeWorkService.createDialog= value;
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
        this.coursService.createDialog= value;
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
        this.etudiantService.createDialog= value;
    }
    get typeDeQuestion(): TypeDeQuestionDto {
        return this.typeDeQuestionService.item;
    }
    set typeDeQuestion(value: TypeDeQuestionDto) {
        this.typeDeQuestionService.item = value;
    }
    get typeDeQuestions(): Array<TypeDeQuestionDto> {
        return this.typeDeQuestionService.items;
    }
    set typeDeQuestions(value: Array<TypeDeQuestionDto>) {
        this.typeDeQuestionService.items = value;
    }
    get createTypeDeQuestionDialog(): boolean {
        return this.typeDeQuestionService.createDialog;
    }
    set createTypeDeQuestionDialog(value: boolean) {
        this.typeDeQuestionService.createDialog= value;
    }



    get validHomeWorkLibelle(): boolean {
        return this._validHomeWorkLibelle;
    }

    set validHomeWorkLibelle(value: boolean) {
         this._validHomeWorkLibelle = value;
    }

    get validHomeWorkQuestionsRef(): boolean {
        return this._validHomeWorkQuestionsRef;
    }
    set validHomeWorkQuestionsRef(value: boolean) {
        this._validHomeWorkQuestionsRef = value;
    }
    get validHomeWorkQuestionsLibelle(): boolean {
        return this._validHomeWorkQuestionsLibelle;
    }
    set validHomeWorkQuestionsLibelle(value: boolean) {
        this._validHomeWorkQuestionsLibelle = value;
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
    get validTypeHomeWorkCode(): boolean {
        return this._validTypeHomeWorkCode;
    }
    set validTypeHomeWorkCode(value: boolean) {
        this._validTypeHomeWorkCode = value;
    }
    get validTypeHomeWorkLib(): boolean {
        return this._validTypeHomeWorkLib;
    }
    set validTypeHomeWorkLib(value: boolean) {
        this._validTypeHomeWorkLib = value;
    }

    get homeWorkQuestionsElement(): HomeWorkQuestionDto {
        if( this._homeWorkQuestionsElement == null )
            this._homeWorkQuestionsElement = new HomeWorkQuestionDto();
        return this._homeWorkQuestionsElement;
    }

    set homeWorkQuestionsElement(value: HomeWorkQuestionDto) {
        this._homeWorkQuestionsElement = value;
    }
    get homeWorkEtudiantsElement(): HomeWorkEtudiantDto {
        if( this._homeWorkEtudiantsElement == null )
            this._homeWorkEtudiantsElement = new HomeWorkEtudiantDto();
        return this._homeWorkEtudiantsElement;
    }

    set homeWorkEtudiantsElement(value: HomeWorkEtudiantDto) {
        this._homeWorkEtudiantsElement = value;
    }

    get items(): Array<HomeWorkDto> {
        return this.service.items;
    }

    set items(value: Array<HomeWorkDto>) {
        this.service.items = value;
    }

    get item(): HomeWorkDto {
        return this.service.item;
    }

    set item(value: HomeWorkDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): HomeWorkCriteria {
        return this.service.criteria;
    }

    set criteria(value: HomeWorkCriteria) {
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
