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



import {HomeWorkQuestionCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';
import {HomeWorkQuestionDto} from '../../../../shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCriteria} from '../../../../shared/criteria/homework/HomeWorkQuestionCriteria.model';
import {HoweWorkQSTReponseDto} from '../../../../shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCollaboratorService} from '../../../../shared/service/collaborator/homework/HoweWorkQSTReponseCollaborator.service';
import {TypeDeQuestionDto} from '../../../../shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionCollaboratorService} from '../../../../shared/service/collaborator/quizref/TypeDeQuestionCollaborator.service';
import {HomeWorkDto} from '../../../../shared/model/homework/HomeWork.model';
import {HomeWorkCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkCollaborator.service';

@Component({
  selector: 'app-home-work-question-create-collaborator',
  templateUrl: './home-work-question-create-collaborator.component.html',
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
export class HomeWorkQuestionCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _typeDeQuestionsFilter:  TypeDeQuestionDto[];
  _homeWorksFilter:  HomeWorkDto[];

    private _howeWorkQSTReponsesElement = new HoweWorkQSTReponseDto();


   private _validHomeWorkQuestionRef = true;
   private _validHomeWorkQuestionLibelle = true;
    private _validTypeDeQuestionRef = true;
    private _validTypeDeQuestionLib = true;
    private _validHoweWorkQSTReponsesRef = true;
    private _validHoweWorkQSTReponsesLib = true;
    private _validHomeWorkLibelle = true;

	constructor(private alert: FuseAlertService, private service: HomeWorkQuestionCollaboratorService , private howeWorkQSTReponseService: HoweWorkQSTReponseCollaboratorService, private typeDeQuestionService: TypeDeQuestionCollaboratorService, private homeWorkService: HomeWorkCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.typeDeQuestionService.findAll().subscribe((data) => {this.typeDeQuestions = data; this._typeDeQuestionsFilter = {...this.typeDeQuestions}});
        this.homeWorkService.findAll().subscribe((data) => {this.homeWorks = data; this._homeWorksFilter = {...this.homeWorks}});
    }

  displayTypeDeQuestion(item: TypeDeQuestionDto): string {
	return item && item.lib ? item.lib : "";

  }

  filterTypeDeQuestion(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._typeDeQuestionsFilter = this.typeDeQuestions.filter(s =>
			s.lib?.toLowerCase()?.includes(value)
		)
	} else {
		this._typeDeQuestionsFilter = this.typeDeQuestions
	}
 }
  displayHomeWork(item: HomeWorkDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterHomeWork(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._homeWorksFilter = this.homeWorks.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._homeWorksFilter = this.homeWorks
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
                this.item = new HomeWorkQuestionDto();
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



    validateHoweWorkQSTReponses(){
        this.errorMessages = new Array();
        this.validateHoweWorkQSTReponsesRef();
        this.validateHoweWorkQSTReponsesLib();
    }


    public  setValidation(value: boolean){
        this.validHomeWorkQuestionRef = value;
        this.validHomeWorkQuestionLibelle = value;
        this.validHoweWorkQSTReponsesRef = value;
        this.validHoweWorkQSTReponsesLib = value;
    }

    public addHoweWorkQSTReponses() {
        if( this.item.howeWorkQSTReponses == null )
            this.item.howeWorkQSTReponses = new Array<HoweWorkQSTReponseDto>();
       this.validateHoweWorkQSTReponses();
       if (this.errorMessages.length === 0) {
              this.item.howeWorkQSTReponses.push({... this.howeWorkQSTReponsesElement});
              this.howeWorkQSTReponsesElement = new HoweWorkQSTReponseDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletehoweWorkQSTReponses(p: HoweWorkQSTReponseDto) {
        this.item.howeWorkQSTReponses.forEach((element, index) => {
            if (element === p) { this.item.howeWorkQSTReponses.splice(index, 1); }
        });
    }

    public edithoweWorkQSTReponses(p: HoweWorkQSTReponseDto) {
        this.howeWorkQSTReponsesElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateHomeWorkQuestionRef();
        this.validateHomeWorkQuestionLibelle();
    }

    public validateHomeWorkQuestionRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
        this.errorMessages.push('Ref non valide');
        this.validHomeWorkQuestionRef = false;
        } else {
            this.validHomeWorkQuestionRef = true;
        }
    }
    public validateHomeWorkQuestionLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validHomeWorkQuestionLibelle = false;
        } else {
            this.validHomeWorkQuestionLibelle = true;
        }
    }

    public validateHoweWorkQSTReponsesRef(){
        if (this.howeWorkQSTReponsesElement.ref == null) {
            this.errorMessages.push('Ref de la howeWorkQSTReponse est  invalide');
            this.validHoweWorkQSTReponsesRef = false;
        } else {
            this.validHoweWorkQSTReponsesRef = true;
        }
    }
    public validateHoweWorkQSTReponsesLib(){
        if (this.howeWorkQSTReponsesElement.lib == null) {
            this.errorMessages.push('Lib de la howeWorkQSTReponse est  invalide');
            this.validHoweWorkQSTReponsesLib = false;
        } else {
            this.validHoweWorkQSTReponsesLib = true;
        }
    }

    public async openCreateHomeWork(homeWork: string) {
    const isPermistted = await this.roleService.isPermitted('HomeWork', 'add');
    if(isPermistted) {
         this.homeWork = new HomeWorkDto();
         this.createHomeWorkDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
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
    get homeWork(): HomeWorkDto {
        return this.homeWorkService.item;
    }
    set homeWork(value: HomeWorkDto) {
        this.homeWorkService.item = value;
    }
    get homeWorks(): Array<HomeWorkDto> {
        return this.homeWorkService.items;
    }
    set homeWorks(value: Array<HomeWorkDto>) {
        this.homeWorkService.items = value;
    }
    get createHomeWorkDialog(): boolean {
        return this.homeWorkService.createDialog;
    }
    set createHomeWorkDialog(value: boolean) {
        this.homeWorkService.createDialog= value;
    }



    get validHomeWorkQuestionRef(): boolean {
        return this._validHomeWorkQuestionRef;
    }

    set validHomeWorkQuestionRef(value: boolean) {
         this._validHomeWorkQuestionRef = value;
    }
    get validHomeWorkQuestionLibelle(): boolean {
        return this._validHomeWorkQuestionLibelle;
    }

    set validHomeWorkQuestionLibelle(value: boolean) {
         this._validHomeWorkQuestionLibelle = value;
    }

    get validTypeDeQuestionRef(): boolean {
        return this._validTypeDeQuestionRef;
    }
    set validTypeDeQuestionRef(value: boolean) {
        this._validTypeDeQuestionRef = value;
    }
    get validTypeDeQuestionLib(): boolean {
        return this._validTypeDeQuestionLib;
    }
    set validTypeDeQuestionLib(value: boolean) {
        this._validTypeDeQuestionLib = value;
    }
    get validHoweWorkQSTReponsesRef(): boolean {
        return this._validHoweWorkQSTReponsesRef;
    }
    set validHoweWorkQSTReponsesRef(value: boolean) {
        this._validHoweWorkQSTReponsesRef = value;
    }
    get validHoweWorkQSTReponsesLib(): boolean {
        return this._validHoweWorkQSTReponsesLib;
    }
    set validHoweWorkQSTReponsesLib(value: boolean) {
        this._validHoweWorkQSTReponsesLib = value;
    }
    get validHomeWorkLibelle(): boolean {
        return this._validHomeWorkLibelle;
    }
    set validHomeWorkLibelle(value: boolean) {
        this._validHomeWorkLibelle = value;
    }

    get howeWorkQSTReponsesElement(): HoweWorkQSTReponseDto {
        if( this._howeWorkQSTReponsesElement == null )
            this._howeWorkQSTReponsesElement = new HoweWorkQSTReponseDto();
        return this._howeWorkQSTReponsesElement;
    }

    set howeWorkQSTReponsesElement(value: HoweWorkQSTReponseDto) {
        this._howeWorkQSTReponsesElement = value;
    }

    get items(): Array<HomeWorkQuestionDto> {
        return this.service.items;
    }

    set items(value: Array<HomeWorkQuestionDto>) {
        this.service.items = value;
    }

    get item(): HomeWorkQuestionDto {
        return this.service.item;
    }

    set item(value: HomeWorkQuestionDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): HomeWorkQuestionCriteria {
        return this.service.criteria;
    }

    set criteria(value: HomeWorkQuestionCriteria) {
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
