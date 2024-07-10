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



import {HomeWorkEtudiantCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkEtudiantCollaborator.service';
import {HomeWorkEtudiantDto} from '../../../../shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCriteria} from '../../../../shared/criteria/homework/HomeWorkEtudiantCriteria.model';
import {HoweWorkQSTReponseDto} from '../../../../shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCollaboratorService} from '../../../../shared/service/collaborator/homework/HoweWorkQSTReponseCollaborator.service';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from '../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {ReponseEtudiantHomeWorkDto} from '../../../../shared/model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkCollaboratorService} from '../../../../shared/service/collaborator/homework/ReponseEtudiantHomeWorkCollaborator.service';
import {HomeWorkQuestionDto} from '../../../../shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';
import {HomeWorkDto} from '../../../../shared/model/homework/HomeWork.model';
import {HomeWorkCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkCollaborator.service';

@Component({
  selector: 'app-home-work-etudiant-create-collaborator',
  templateUrl: './home-work-etudiant-create-collaborator.component.html',
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
export class HomeWorkEtudiantCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _etudiantsFilter:  EtudiantDto[];
  _homeWorksFilter:  HomeWorkDto[];

    private _reponseEtudiantHomeWorksElement = new ReponseEtudiantHomeWorkDto();


    private _validHomeWorkLibelle = true;

	constructor(private alert: FuseAlertService, private service: HomeWorkEtudiantCollaboratorService , private howeWorkQSTReponseService: HoweWorkQSTReponseCollaboratorService, private etudiantService: EtudiantCollaboratorService, private reponseEtudiantHomeWorkService: ReponseEtudiantHomeWorkCollaboratorService, private homeWorkQuestionService: HomeWorkQuestionCollaboratorService, private homeWorkService: HomeWorkCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.reponseEtudiantHomeWorksElement.howeWorkQSTReponse = new HoweWorkQSTReponseDto();
        this.howeWorkQSTReponseService.findAll().subscribe((data) => this.howeWorkQSTReponses = data);
        this.reponseEtudiantHomeWorksElement.homeWorkQuestion = new HomeWorkQuestionDto();
        this.homeWorkQuestionService.findAll().subscribe((data) => this.homeWorkQuestions = data);
        this.etudiantService.findAll().subscribe((data) => {this.etudiants = data; this._etudiantsFilter = {...this.etudiants}});
        this.homeWorkService.findAll().subscribe((data) => {this.homeWorks = data; this._homeWorksFilter = {...this.homeWorks}});
    }

  displayEtudiant(item: EtudiantDto): string {
	return item && item.id ? item.id : "";

  }

  filterEtudiant(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._etudiantsFilter = this.etudiants.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._etudiantsFilter = this.etudiants
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
                this.item = new HomeWorkEtudiantDto();
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



    validateReponseEtudiantHomeWorks(){
        this.errorMessages = new Array();
    }


    public  setValidation(value: boolean){
    }

    public addReponseEtudiantHomeWorks() {
        if( this.item.reponseEtudiantHomeWorks == null )
            this.item.reponseEtudiantHomeWorks = new Array<ReponseEtudiantHomeWorkDto>();
       this.validateReponseEtudiantHomeWorks();
       if (this.errorMessages.length === 0) {
              this.item.reponseEtudiantHomeWorks.push({... this.reponseEtudiantHomeWorksElement});
              this.reponseEtudiantHomeWorksElement = new ReponseEtudiantHomeWorkDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletereponseEtudiantHomeWorks(p: ReponseEtudiantHomeWorkDto) {
        this.item.reponseEtudiantHomeWorks.forEach((element, index) => {
            if (element === p) { this.item.reponseEtudiantHomeWorks.splice(index, 1); }
        });
    }

    public editreponseEtudiantHomeWorks(p: ReponseEtudiantHomeWorkDto) {
        this.reponseEtudiantHomeWorksElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
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
    public async openCreateHomeWork(homeWork: string) {
    const isPermistted = await this.roleService.isPermitted('HomeWork', 'add');
    if(isPermistted) {
         this.homeWork = new HomeWorkDto();
         this.createHomeWorkDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
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




    get validHomeWorkLibelle(): boolean {
        return this._validHomeWorkLibelle;
    }
    set validHomeWorkLibelle(value: boolean) {
        this._validHomeWorkLibelle = value;
    }

    get reponseEtudiantHomeWorksElement(): ReponseEtudiantHomeWorkDto {
        if( this._reponseEtudiantHomeWorksElement == null )
            this._reponseEtudiantHomeWorksElement = new ReponseEtudiantHomeWorkDto();
        return this._reponseEtudiantHomeWorksElement;
    }

    set reponseEtudiantHomeWorksElement(value: ReponseEtudiantHomeWorkDto) {
        this._reponseEtudiantHomeWorksElement = value;
    }

    get items(): Array<HomeWorkEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<HomeWorkEtudiantDto>) {
        this.service.items = value;
    }

    get item(): HomeWorkEtudiantDto {
        return this.service.item;
    }

    set item(value: HomeWorkEtudiantDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): HomeWorkEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: HomeWorkEtudiantCriteria) {
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
