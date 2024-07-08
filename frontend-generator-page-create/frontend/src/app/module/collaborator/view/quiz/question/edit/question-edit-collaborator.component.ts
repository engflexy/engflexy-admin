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




import {QuestionCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuestionCollaborator.service';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionCriteria} from 'src/app/shared/criteria/quiz/QuestionCriteria.model';


import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuizCollaborator.service';
import {TypeDeQuestionDto} from 'src/app/shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionCollaboratorService} from 'src/app/shared/service/collaborator/quizref/TypeDeQuestionCollaborator.service';
import {ReponseDto} from 'src/app/shared/model/quiz/Reponse.model';
import {ReponseCollaboratorService} from 'src/app/shared/service/collaborator/quiz/ReponseCollaborator.service';

@Component({
  selector: 'app-question-edit-collaborator',
  templateUrl: './question-edit-collaborator.component.html'
})
export class QuestionEditCollaboratorComponent implements OnInit {

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


    private _reponsesElement = new ReponseDto();

    private _validQuestionRef = true;

    private _validTypeDeQuestionRef = true;
    private _validTypeDeQuestionLib = true;
    private _validReponsesRef = true;
    private _validReponsesLib = true;
    private _validQuizRef = true;
    private _validQuizLib = true;



    constructor(private service: QuestionCollaboratorService , private quizService: QuizCollaboratorService, private typeDeQuestionService: TypeDeQuestionCollaboratorService, private reponseService: ReponseCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {

        this.typeDeQuestionService.findAll().subscribe((data) => this.typeDeQuestions = data);
        this.quizService.findAll().subscribe((data) => this.quizs = data);
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
            this.item = new QuestionDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateReponses(){
        this.errorMessages = new Array();
        this.validateReponsesRef();
        this.validateReponsesLib();
    }

    public setValidation(value: boolean){
        this.validQuestionRef = value;
        this.validReponsesRef = value;
        this.validReponsesLib = value;
    }

   public addReponses() {
        if( this.item.reponses == null )
            this.item.reponses = new Array<ReponseDto>();
       this.validateReponses();
       if (this.errorMessages.length === 0) {
            if(this.reponsesElement.id == null){
                this.item.reponses.push(this.reponsesElement);
            }else{
                const index = this.item.reponses.findIndex(e => e.id == this.reponsesElement.id);
                this.item.reponses[index] = this.reponsesElement;
            }
          this.reponsesElement = new ReponseDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteReponses(p: ReponseDto) {
        this.item.reponses.forEach((element, index) => {
            if (element === p) { this.item.reponses.splice(index, 1); }
        });
    }

    public editReponses(p: ReponseDto) {
        this.reponsesElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
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



    private validateReponsesRef(){
        if (this.reponsesElement.ref == null) {
        this.errorMessages.push('Ref de la reponse est  invalide');
            this.validReponsesRef = false;
        } else {
            this.validReponsesRef = true;
        }
    }
    private validateReponsesLib(){
        if (this.reponsesElement.lib == null) {
        this.errorMessages.push('Lib de la reponse est  invalide');
            this.validReponsesLib = false;
        } else {
            this.validReponsesLib = true;
        }
    }

   public async openCreateQuiz(quiz: string) {
        const isPermistted = await this.roleService.isPermitted('Quiz', 'edit');
        if (isPermistted) {
             this.quiz = new QuizDto();
             this.createQuizDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
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

    get reponsesElement(): ReponseDto {
        if( this._reponsesElement == null )
            this._reponsesElement = new ReponseDto();
         return this._reponsesElement;
    }

    set reponsesElement(value: ReponseDto) {
        this._reponsesElement = value;
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

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
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
