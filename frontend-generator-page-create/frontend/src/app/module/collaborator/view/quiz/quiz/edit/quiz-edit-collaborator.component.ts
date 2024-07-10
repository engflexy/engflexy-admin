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




import {QuizCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuizCollaborator.service';
import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCriteria} from 'src/app/shared/criteria/quiz/QuizCriteria.model';


import {QuizEtudiantDto} from 'src/app/shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/quizetudiant/QuizEtudiantCollaborator.service';
import {TypeDeQuestionDto} from 'src/app/shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionCollaboratorService} from 'src/app/shared/service/collaborator/quizref/TypeDeQuestionCollaborator.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from 'src/app/shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {ReponseEtudiantDto} from 'src/app/shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/quizetudiant/ReponseEtudiantCollaborator.service';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuestionCollaborator.service';
import {ReponseDto} from 'src/app/shared/model/quiz/Reponse.model';
import {ReponseCollaboratorService} from 'src/app/shared/service/collaborator/quiz/ReponseCollaborator.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCollaboratorService} from 'src/app/shared/service/collaborator/course/SectionCollaborator.service';

@Component({
  selector: 'app-quiz-edit-collaborator',
  templateUrl: './quiz-edit-collaborator.component.html'
})
export class QuizEditCollaboratorComponent implements OnInit {

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


    private _questionsElement = new QuestionDto();
    private _quizEtudiantsElement = new QuizEtudiantDto();

    private _validQuizRef = true;
    private _validQuizLib = true;

    private _validQuestionsRef = true;
    private _validQuizEtudiantsRef = true;
    private _validSectionCode = true;
    private _validSectionLibelle = true;



    constructor(private service: QuizCollaboratorService , private quizEtudiantService: QuizEtudiantCollaboratorService, private typeDeQuestionService: TypeDeQuestionCollaboratorService, private etudiantService: EtudiantCollaboratorService, private questionService: QuestionCollaboratorService, private sectionService: SectionCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.questionsElement.typeDeQuestion = new TypeDeQuestionDto();
        this.typeDeQuestionService.findAll().subscribe((data) => this.typeDeQuestions = data);

        this.quizEtudiantsElement.etudiant = new EtudiantDto();
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);

        this.sectionService.findAll().subscribe((data) => this.sections = data);
    }

    public prepareEdit() {
        this.item.dateDebut = this.service.format(this.item.dateDebut);
        this.item.dateFin = this.service.format(this.item.dateFin);
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
            this.item = new QuizDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateQuestions(){
        this.errorMessages = new Array();
        this.validateQuestionsRef();
    }

    public validateQuizEtudiants(){
        this.errorMessages = new Array();
        this.validateQuizEtudiantsRef();
    }

    public setValidation(value: boolean){
        this.validQuizRef = value;
        this.validQuizLib = value;
        this.validQuestionsRef = value;
        this.validQuizEtudiantsRef = value;
    }

   public addQuestions() {
        if( this.item.questions == null )
            this.item.questions = new Array<QuestionDto>();
       this.validateQuestions();
       if (this.errorMessages.length === 0) {
            if(this.questionsElement.id == null){
                this.item.questions.push(this.questionsElement);
            }else{
                const index = this.item.questions.findIndex(e => e.id == this.questionsElement.id);
                this.item.questions[index] = this.questionsElement;
            }
          this.questionsElement = new QuestionDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteQuestions(p: QuestionDto) {
        this.item.questions.forEach((element, index) => {
            if (element === p) { this.item.questions.splice(index, 1); }
        });
    }

    public editQuestions(p: QuestionDto) {
        this.questionsElement = {... p};
        this.activeTab = 0;
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
        this.validateQuizRef();
        this.validateQuizLib();
    }

    public validateQuizRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
            this.errorMessages.push('Ref non valide');
            this.validQuizRef = false;
        } else {
            this.validQuizRef = true;
        }
    }

    public validateQuizLib(){
        if (this.stringUtilService.isEmpty(this.item.lib)) {
            this.errorMessages.push('Lib non valide');
            this.validQuizLib = false;
        } else {
            this.validQuizLib = true;
        }
    }



    private validateQuestionsRef(){
        if (this.questionsElement.ref == null) {
        this.errorMessages.push('Ref de la question est  invalide');
            this.validQuestionsRef = false;
        } else {
            this.validQuestionsRef = true;
        }
    }
    private validateQuizEtudiantsRef(){
        if (this.quizEtudiantsElement.ref == null) {
        this.errorMessages.push('Ref de la quizEtudiant est  invalide');
            this.validQuizEtudiantsRef = false;
        } else {
            this.validQuizEtudiantsRef = true;
        }
    }


    get section(): SectionDto {
        return this.sectionService.item;
    }
    set section(value: SectionDto) {
        this.sectionService.item = value;
    }
    get sections(): Array<SectionDto> {
        return this.sectionService.items;
    }
    set sections(value: Array<SectionDto>) {
        this.sectionService.items = value;
    }
    get createSectionDialog(): boolean {
        return this.sectionService.createDialog;
    }
    set createSectionDialog(value: boolean) {
        this.sectionService.createDialog= value;
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

    get questionsElement(): QuestionDto {
        if( this._questionsElement == null )
            this._questionsElement = new QuestionDto();
         return this._questionsElement;
    }

    set questionsElement(value: QuestionDto) {
        this._questionsElement = value;
    }
    get quizEtudiantsElement(): QuizEtudiantDto {
        if( this._quizEtudiantsElement == null )
            this._quizEtudiantsElement = new QuizEtudiantDto();
         return this._quizEtudiantsElement;
    }

    set quizEtudiantsElement(value: QuizEtudiantDto) {
        this._quizEtudiantsElement = value;
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

    get validQuestionsRef(): boolean {
        return this._validQuestionsRef;
    }
    set validQuestionsRef(value: boolean) {
        this._validQuestionsRef = value;
    }
    get validQuizEtudiantsRef(): boolean {
        return this._validQuizEtudiantsRef;
    }
    set validQuizEtudiantsRef(value: boolean) {
        this._validQuizEtudiantsRef = value;
    }
    get validSectionCode(): boolean {
        return this._validSectionCode;
    }
    set validSectionCode(value: boolean) {
        this._validSectionCode = value;
    }
    get validSectionLibelle(): boolean {
        return this._validSectionLibelle;
    }
    set validSectionLibelle(value: boolean) {
        this._validSectionLibelle = value;
    }

	get items(): Array<QuizDto> {
        return this.service.items;
    }

    set items(value: Array<QuizDto>) {
        this.service.items = value;
    }

    get item(): QuizDto {
        return this.service.item;
    }

    set item(value: QuizDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): QuizCriteria {
        return this.service.criteria;
    }

    set criteria(value: QuizCriteria) {
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
