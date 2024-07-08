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



import {QuestionAdminService} from '../../../../shared/service/admin/quiz/QuestionAdmin.service';
import {QuestionDto} from '../../../../shared/model/quiz/Question.model';
import {QuestionCriteria} from '../../../../shared/criteria/quiz/QuestionCriteria.model';
import {QuizDto} from '../../../../shared/model/quiz/Quiz.model';
import {QuizAdminService} from '../../../../shared/service/admin/quiz/QuizAdmin.service';
import {TypeDeQuestionDto} from '../../../../shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionAdminService} from '../../../../shared/service/admin/quizref/TypeDeQuestionAdmin.service';
import {ReponseDto} from '../../../../shared/model/quiz/Reponse.model';
import {ReponseAdminService} from '../../../../shared/service/admin/quiz/ReponseAdmin.service';

@Component({
  selector: 'app-question-create-admin',
  templateUrl: './question-create-admin.component.html',
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
export class QuestionCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _typeDeQuestionsFilter:  TypeDeQuestionDto[];
  _quizsFilter:  QuizDto[];

    private _reponsesElement = new ReponseDto();


   private _validQuestionRef = true;
    private _validTypeDeQuestionRef = true;
    private _validTypeDeQuestionLib = true;
    private _validReponsesRef = true;
    private _validReponsesLib = true;
    private _validQuizRef = true;
    private _validQuizLib = true;

	constructor(private alert: FuseAlertService, private service: QuestionAdminService , private quizService: QuizAdminService, private typeDeQuestionService: TypeDeQuestionAdminService, private reponseService: ReponseAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.typeDeQuestionService.findAll().subscribe((data) => {this.typeDeQuestions = data; this._typeDeQuestionsFilter = {...this.typeDeQuestions}});
        this.quizService.findAll().subscribe((data) => {this.quizs = data; this._quizsFilter = {...this.quizs}});
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
  displayQuiz(item: QuizDto): string {
	return item && item.lib ? item.lib : "";

  }

  filterQuiz(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._quizsFilter = this.quizs.filter(s =>
			s.lib?.toLowerCase()?.includes(value)
		)
	} else {
		this._quizsFilter = this.quizs
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
                this.item = new QuestionDto();
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



    validateReponses(){
        this.errorMessages = new Array();
        this.validateReponsesRef();
        this.validateReponsesLib();
    }


    public  setValidation(value: boolean){
        this.validQuestionRef = value;
        this.validReponsesRef = value;
        this.validReponsesLib = value;
    }

    public addReponses() {
        if( this.item.reponses == null )
            this.item.reponses = new Array<ReponseDto>();
       this.validateReponses();
       if (this.errorMessages.length === 0) {
              this.item.reponses.push({... this.reponsesElement});
              this.reponsesElement = new ReponseDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletereponses(p: ReponseDto) {
        this.item.reponses.forEach((element, index) => {
            if (element === p) { this.item.reponses.splice(index, 1); }
        });
    }

    public editreponses(p: ReponseDto) {
        this.reponsesElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateQuestionRef();
    }

    public validateQuestionRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
        this.errorMessages.push('Ref non valide');
        this.validQuestionRef = false;
        } else {
            this.validQuestionRef = true;
        }
    }

    public validateReponsesRef(){
        if (this.reponsesElement.ref == null) {
            this.errorMessages.push('Ref de la reponse est  invalide');
            this.validReponsesRef = false;
        } else {
            this.validReponsesRef = true;
        }
    }
    public validateReponsesLib(){
        if (this.reponsesElement.lib == null) {
            this.errorMessages.push('Lib de la reponse est  invalide');
            this.validReponsesLib = false;
        } else {
            this.validReponsesLib = true;
        }
    }

    public async openCreateQuiz(quiz: string) {
    const isPermistted = await this.roleService.isPermitted('Quiz', 'add');
    if(isPermistted) {
         this.quiz = new QuizDto();
         this.createQuizDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
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



    get validQuestionRef(): boolean {
        return this._validQuestionRef;
    }

    set validQuestionRef(value: boolean) {
         this._validQuestionRef = value;
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
    get validReponsesRef(): boolean {
        return this._validReponsesRef;
    }
    set validReponsesRef(value: boolean) {
        this._validReponsesRef = value;
    }
    get validReponsesLib(): boolean {
        return this._validReponsesLib;
    }
    set validReponsesLib(value: boolean) {
        this._validReponsesLib = value;
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

    get reponsesElement(): ReponseDto {
        if( this._reponsesElement == null )
            this._reponsesElement = new ReponseDto();
        return this._reponsesElement;
    }

    set reponsesElement(value: ReponseDto) {
        this._reponsesElement = value;
    }

    get items(): Array<QuestionDto> {
        return this.service.items;
    }

    set items(value: Array<QuestionDto>) {
        this.service.items = value;
    }

    get item(): QuestionDto {
        return this.service.item;
    }

    set item(value: QuestionDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): QuestionCriteria {
        return this.service.criteria;
    }

    set criteria(value: QuestionCriteria) {
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
