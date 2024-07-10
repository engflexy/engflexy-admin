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



import {ReponseEtudiantHomeWorkAdminService} from '../../../../shared/service/admin/homework/ReponseEtudiantHomeWorkAdmin.service';
import {ReponseEtudiantHomeWorkDto} from '../../../../shared/model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkCriteria} from '../../../../shared/criteria/homework/ReponseEtudiantHomeWorkCriteria.model';
import {HoweWorkQSTReponseDto} from '../../../../shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseAdminService} from '../../../../shared/service/admin/homework/HoweWorkQSTReponseAdmin.service';
import {HomeWorkEtudiantDto} from '../../../../shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantAdminService} from '../../../../shared/service/admin/homework/HomeWorkEtudiantAdmin.service';
import {HomeWorkQuestionDto} from '../../../../shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionAdminService} from '../../../../shared/service/admin/homework/HomeWorkQuestionAdmin.service';

@Component({
  selector: 'app-reponse-etudiant-home-work-create-admin',
  templateUrl: './reponse-etudiant-home-work-create-admin.component.html',
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
export class ReponseEtudiantHomeWorkCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _howeWorkQSTReponsesFilter:  HoweWorkQSTReponseDto[];
  _homeWorkEtudiantsFilter:  HomeWorkEtudiantDto[];
  _homeWorkQuestionsFilter:  HomeWorkQuestionDto[];



    private _validHoweWorkQSTReponseRef = true;
    private _validHoweWorkQSTReponseLib = true;
    private _validHomeWorkQuestionRef = true;
    private _validHomeWorkQuestionLibelle = true;

	constructor(private alert: FuseAlertService, private service: ReponseEtudiantHomeWorkAdminService , private howeWorkQSTReponseService: HoweWorkQSTReponseAdminService, private homeWorkEtudiantService: HomeWorkEtudiantAdminService, private homeWorkQuestionService: HomeWorkQuestionAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.howeWorkQSTReponseService.findAll().subscribe((data) => {this.howeWorkQSTReponses = data; this._howeWorkQSTReponsesFilter = {...this.howeWorkQSTReponses}});
        this.homeWorkEtudiantService.findAll().subscribe((data) => {this.homeWorkEtudiants = data; this._homeWorkEtudiantsFilter = {...this.homeWorkEtudiants}});
        this.homeWorkQuestionService.findAll().subscribe((data) => {this.homeWorkQuestions = data; this._homeWorkQuestionsFilter = {...this.homeWorkQuestions}});
    }

  displayHoweWorkQSTReponse(item: HoweWorkQSTReponseDto): string {
	return item && item.lib ? item.lib : "";

  }

  filterHoweWorkQSTReponse(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._howeWorkQSTReponsesFilter = this.howeWorkQSTReponses.filter(s =>
			s.lib?.toLowerCase()?.includes(value)
		)
	} else {
		this._howeWorkQSTReponsesFilter = this.howeWorkQSTReponses
	}
 }
  displayHomeWorkEtudiant(item: HomeWorkEtudiantDto): string {
	return item && item.id ? item.id : "";

  }

  filterHomeWorkEtudiant(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._homeWorkEtudiantsFilter = this.homeWorkEtudiants.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._homeWorkEtudiantsFilter = this.homeWorkEtudiants
	}
 }
  displayHomeWorkQuestion(item: HomeWorkQuestionDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterHomeWorkQuestion(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._homeWorkQuestionsFilter = this.homeWorkQuestions.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._homeWorkQuestionsFilter = this.homeWorkQuestions
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
                this.item = new ReponseEtudiantHomeWorkDto();
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





    public  setValidation(value: boolean){
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
    }



    public async openCreateHomeWorkEtudiant(homeWorkEtudiant: string) {
    const isPermistted = await this.roleService.isPermitted('HomeWorkEtudiant', 'add');
    if(isPermistted) {
         this.homeWorkEtudiant = new HomeWorkEtudiantDto();
         this.createHomeWorkEtudiantDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }
    public async openCreateHoweWorkQSTReponse(howeWorkQSTReponse: string) {
    const isPermistted = await this.roleService.isPermitted('HoweWorkQSTReponse', 'add');
    if(isPermistted) {
         this.howeWorkQSTReponse = new HoweWorkQSTReponseDto();
         this.createHoweWorkQSTReponseDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }
    public async openCreateHomeWorkQuestion(homeWorkQuestion: string) {
    const isPermistted = await this.roleService.isPermitted('HomeWorkQuestion', 'add');
    if(isPermistted) {
         this.homeWorkQuestion = new HomeWorkQuestionDto();
         this.createHomeWorkQuestionDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get homeWorkEtudiant(): HomeWorkEtudiantDto {
        return this.homeWorkEtudiantService.item;
    }
    set homeWorkEtudiant(value: HomeWorkEtudiantDto) {
        this.homeWorkEtudiantService.item = value;
    }
    get homeWorkEtudiants(): Array<HomeWorkEtudiantDto> {
        return this.homeWorkEtudiantService.items;
    }
    set homeWorkEtudiants(value: Array<HomeWorkEtudiantDto>) {
        this.homeWorkEtudiantService.items = value;
    }
    get createHomeWorkEtudiantDialog(): boolean {
        return this.homeWorkEtudiantService.createDialog;
    }
    set createHomeWorkEtudiantDialog(value: boolean) {
        this.homeWorkEtudiantService.createDialog= value;
    }
    get howeWorkQSTReponse(): HoweWorkQSTReponseDto {
        return this.howeWorkQSTReponseService.item;
    }
    set howeWorkQSTReponse(value: HoweWorkQSTReponseDto) {
        this.howeWorkQSTReponseService.item = value;
    }
    get howeWorkQSTReponses(): Array<HoweWorkQSTReponseDto> {
        return this.howeWorkQSTReponseService.items;
    }
    set howeWorkQSTReponses(value: Array<HoweWorkQSTReponseDto>) {
        this.howeWorkQSTReponseService.items = value;
    }
    get createHoweWorkQSTReponseDialog(): boolean {
        return this.howeWorkQSTReponseService.createDialog;
    }
    set createHoweWorkQSTReponseDialog(value: boolean) {
        this.howeWorkQSTReponseService.createDialog= value;
    }
    get homeWorkQuestion(): HomeWorkQuestionDto {
        return this.homeWorkQuestionService.item;
    }
    set homeWorkQuestion(value: HomeWorkQuestionDto) {
        this.homeWorkQuestionService.item = value;
    }
    get homeWorkQuestions(): Array<HomeWorkQuestionDto> {
        return this.homeWorkQuestionService.items;
    }
    set homeWorkQuestions(value: Array<HomeWorkQuestionDto>) {
        this.homeWorkQuestionService.items = value;
    }
    get createHomeWorkQuestionDialog(): boolean {
        return this.homeWorkQuestionService.createDialog;
    }
    set createHomeWorkQuestionDialog(value: boolean) {
        this.homeWorkQuestionService.createDialog= value;
    }




    get validHoweWorkQSTReponseRef(): boolean {
        return this._validHoweWorkQSTReponseRef;
    }
    set validHoweWorkQSTReponseRef(value: boolean) {
        this._validHoweWorkQSTReponseRef = value;
    }
    get validHoweWorkQSTReponseLib(): boolean {
        return this._validHoweWorkQSTReponseLib;
    }
    set validHoweWorkQSTReponseLib(value: boolean) {
        this._validHoweWorkQSTReponseLib = value;
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


    get items(): Array<ReponseEtudiantHomeWorkDto> {
        return this.service.items;
    }

    set items(value: Array<ReponseEtudiantHomeWorkDto>) {
        this.service.items = value;
    }

    get item(): ReponseEtudiantHomeWorkDto {
        return this.service.item;
    }

    set item(value: ReponseEtudiantHomeWorkDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): ReponseEtudiantHomeWorkCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReponseEtudiantHomeWorkCriteria) {
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
