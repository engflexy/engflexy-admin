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



import {ReponseEtudiantAdminService} from '../../../../shared/service/admin/quizetudiant/ReponseEtudiantAdmin.service';
import {ReponseEtudiantDto} from '../../../../shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantCriteria} from '../../../../shared/criteria/quizetudiant/ReponseEtudiantCriteria.model';
import {QuizEtudiantDto} from '../../../../shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantAdminService} from '../../../../shared/service/admin/quizetudiant/QuizEtudiantAdmin.service';
import {QuestionDto} from '../../../../shared/model/quiz/Question.model';
import {QuestionAdminService} from '../../../../shared/service/admin/quiz/QuestionAdmin.service';
import {ReponseDto} from '../../../../shared/model/quiz/Reponse.model';
import {ReponseAdminService} from '../../../../shared/service/admin/quiz/ReponseAdmin.service';

@Component({
  selector: 'app-reponse-etudiant-create-admin',
  templateUrl: './reponse-etudiant-create-admin.component.html',
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
export class ReponseEtudiantCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _reponsesFilter:  ReponseDto[];
  _quizEtudiantsFilter:  QuizEtudiantDto[];
  _questionsFilter:  QuestionDto[];



   private _validReponseEtudiantRef = true;
    private _validReponseRef = true;
    private _validReponseLib = true;
    private _validQuizEtudiantRef = true;
    private _validQuestionRef = true;

	constructor(private alert: FuseAlertService, private service: ReponseEtudiantAdminService , private quizEtudiantService: QuizEtudiantAdminService, private questionService: QuestionAdminService, private reponseService: ReponseAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.reponseService.findAll().subscribe((data) => {this.reponses = data; this._reponsesFilter = {...this.reponses}});
        this.quizEtudiantService.findAll().subscribe((data) => {this.quizEtudiants = data; this._quizEtudiantsFilter = {...this.quizEtudiants}});
        this.questionService.findAll().subscribe((data) => {this.questions = data; this._questionsFilter = {...this.questions}});
    }

  displayReponse(item: ReponseDto): string {
	return item && item.lib ? item.lib : "";

  }

  filterReponse(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._reponsesFilter = this.reponses.filter(s =>
			s.lib?.toLowerCase()?.includes(value)
		)
	} else {
		this._reponsesFilter = this.reponses
	}
 }
  displayQuizEtudiant(item: QuizEtudiantDto): string {
	return item && item.ref ? item.ref : "";

  }

  filterQuizEtudiant(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._quizEtudiantsFilter = this.quizEtudiants.filter(s =>
			s.ref?.toLowerCase()?.includes(value)
		)
	} else {
		this._quizEtudiantsFilter = this.quizEtudiants
	}
 }
  displayQuestion(item: QuestionDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterQuestion(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._questionsFilter = this.questions.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._questionsFilter = this.questions
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
                this.item = new ReponseEtudiantDto();
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
        this.validReponseEtudiantRef = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateReponseEtudiantRef();
    }

    public validateReponseEtudiantRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
        this.errorMessages.push('Ref non valide');
        this.validReponseEtudiantRef = false;
        } else {
            this.validReponseEtudiantRef = true;
        }
    }


    public async openCreateQuizEtudiant(quizEtudiant: string) {
    const isPermistted = await this.roleService.isPermitted('QuizEtudiant', 'add');
    if(isPermistted) {
         this.quizEtudiant = new QuizEtudiantDto();
         this.createQuizEtudiantDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get reponse(): ReponseDto {
        return this.reponseService.item;
    }
    set reponse(value: ReponseDto) {
        this.reponseService.item = value;
    }
    get reponses(): Array<ReponseDto> {
        return this.reponseService.items;
    }
    set reponses(value: Array<ReponseDto>) {
        this.reponseService.items = value;
    }
    get createReponseDialog(): boolean {
        return this.reponseService.createDialog;
    }
    set createReponseDialog(value: boolean) {
        this.reponseService.createDialog= value;
    }
    get question(): QuestionDto {
        return this.questionService.item;
    }
    set question(value: QuestionDto) {
        this.questionService.item = value;
    }
    get questions(): Array<QuestionDto> {
        return this.questionService.items;
    }
    set questions(value: Array<QuestionDto>) {
        this.questionService.items = value;
    }
    get createQuestionDialog(): boolean {
        return this.questionService.createDialog;
    }
    set createQuestionDialog(value: boolean) {
        this.questionService.createDialog= value;
    }
    get quizEtudiant(): QuizEtudiantDto {
        return this.quizEtudiantService.item;
    }
    set quizEtudiant(value: QuizEtudiantDto) {
        this.quizEtudiantService.item = value;
    }
    get quizEtudiants(): Array<QuizEtudiantDto> {
        return this.quizEtudiantService.items;
    }
    set quizEtudiants(value: Array<QuizEtudiantDto>) {
        this.quizEtudiantService.items = value;
    }
    get createQuizEtudiantDialog(): boolean {
        return this.quizEtudiantService.createDialog;
    }
    set createQuizEtudiantDialog(value: boolean) {
        this.quizEtudiantService.createDialog= value;
    }



    get validReponseEtudiantRef(): boolean {
        return this._validReponseEtudiantRef;
    }

    set validReponseEtudiantRef(value: boolean) {
         this._validReponseEtudiantRef = value;
    }

    get validReponseRef(): boolean {
        return this._validReponseRef;
    }
    set validReponseRef(value: boolean) {
        this._validReponseRef = value;
    }
    get validReponseLib(): boolean {
        return this._validReponseLib;
    }
    set validReponseLib(value: boolean) {
        this._validReponseLib = value;
    }
    get validQuizEtudiantRef(): boolean {
        return this._validQuizEtudiantRef;
    }
    set validQuizEtudiantRef(value: boolean) {
        this._validQuizEtudiantRef = value;
    }
    get validQuestionRef(): boolean {
        return this._validQuestionRef;
    }
    set validQuestionRef(value: boolean) {
        this._validQuestionRef = value;
    }


    get items(): Array<ReponseEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<ReponseEtudiantDto>) {
        this.service.items = value;
    }

    get item(): ReponseEtudiantDto {
        return this.service.item;
    }

    set item(value: ReponseEtudiantDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): ReponseEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReponseEtudiantCriteria) {
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
