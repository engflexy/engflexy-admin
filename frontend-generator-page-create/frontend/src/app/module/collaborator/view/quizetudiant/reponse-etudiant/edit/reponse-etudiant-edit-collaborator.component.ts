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




import {ReponseEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/quizetudiant/ReponseEtudiantCollaborator.service';
import {ReponseEtudiantDto} from 'src/app/shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantCriteria} from 'src/app/shared/criteria/quizetudiant/ReponseEtudiantCriteria.model';


import {QuizEtudiantDto} from 'src/app/shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/quizetudiant/QuizEtudiantCollaborator.service';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuestionCollaborator.service';
import {ReponseDto} from 'src/app/shared/model/quiz/Reponse.model';
import {ReponseCollaboratorService} from 'src/app/shared/service/collaborator/quiz/ReponseCollaborator.service';

@Component({
  selector: 'app-reponse-etudiant-edit-collaborator',
  templateUrl: './reponse-etudiant-edit-collaborator.component.html'
})
export class ReponseEtudiantEditCollaboratorComponent implements OnInit {

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



    private _validReponseEtudiantRef = true;

    private _validReponseRef = true;
    private _validReponseLib = true;
    private _validQuizEtudiantRef = true;
    private _validQuestionRef = true;



    constructor(private service: ReponseEtudiantCollaboratorService , private quizEtudiantService: QuizEtudiantCollaboratorService, private questionService: QuestionCollaboratorService, private reponseService: ReponseCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.reponseService.findAll().subscribe((data) => this.reponses = data);
        this.quizEtudiantService.findAll().subscribe((data) => this.quizEtudiants = data);
        this.questionService.findAll().subscribe((data) => this.questions = data);
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
            this.item = new ReponseEtudiantDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validReponseEtudiantRef = value;
    }

    public validateForm(): void{
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
        const isPermistted = await this.roleService.isPermitted('QuizEtudiant', 'edit');
        if (isPermistted) {
             this.quizEtudiant = new QuizEtudiantDto();
             this.createQuizEtudiantDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
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

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
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
