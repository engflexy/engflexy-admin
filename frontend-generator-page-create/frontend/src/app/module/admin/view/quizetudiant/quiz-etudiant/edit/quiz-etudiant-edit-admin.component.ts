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




import {QuizEtudiantAdminService} from 'src/app/shared/service/admin/quizetudiant/QuizEtudiantAdmin.service';
import {QuizEtudiantDto} from 'src/app/shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCriteria} from 'src/app/shared/criteria/quizetudiant/QuizEtudiantCriteria.model';


import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizAdminService} from 'src/app/shared/service/admin/quiz/QuizAdmin.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {ReponseEtudiantDto} from 'src/app/shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantAdminService} from 'src/app/shared/service/admin/quizetudiant/ReponseEtudiantAdmin.service';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionAdminService} from 'src/app/shared/service/admin/quiz/QuestionAdmin.service';
import {ReponseDto} from 'src/app/shared/model/quiz/Reponse.model';
import {ReponseAdminService} from 'src/app/shared/service/admin/quiz/ReponseAdmin.service';

@Component({
  selector: 'app-quiz-etudiant-edit-admin',
  templateUrl: './quiz-etudiant-edit-admin.component.html'
})
export class QuizEtudiantEditAdminComponent implements OnInit {

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


    private _reponseEtudiantsElement = new ReponseEtudiantDto();

    private _validQuizEtudiantRef = true;

    private _validQuizRef = true;
    private _validQuizLib = true;
    private _validReponseEtudiantsRef = true;



    constructor(private service: QuizEtudiantAdminService , private quizService: QuizAdminService, private etudiantService: EtudiantAdminService, private reponseEtudiantService: ReponseEtudiantAdminService, private questionService: QuestionAdminService, private reponseService: ReponseAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.reponseEtudiantsElement.reponse = new ReponseDto();
        this.reponseService.findAll().subscribe((data) => this.reponses = data);
        this.reponseEtudiantsElement.question = new QuestionDto();
        this.questionService.findAll().subscribe((data) => this.questions = data);

        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
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
            this.item = new QuizEtudiantDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateReponseEtudiants(){
        this.errorMessages = new Array();
        this.validateReponseEtudiantsRef();
    }

    public setValidation(value: boolean){
        this.validQuizEtudiantRef = value;
        this.validReponseEtudiantsRef = value;
    }

   public addReponseEtudiants() {
        if( this.item.reponseEtudiants == null )
            this.item.reponseEtudiants = new Array<ReponseEtudiantDto>();
       this.validateReponseEtudiants();
       if (this.errorMessages.length === 0) {
            if(this.reponseEtudiantsElement.id == null){
                this.item.reponseEtudiants.push(this.reponseEtudiantsElement);
            }else{
                const index = this.item.reponseEtudiants.findIndex(e => e.id == this.reponseEtudiantsElement.id);
                this.item.reponseEtudiants[index] = this.reponseEtudiantsElement;
            }
          this.reponseEtudiantsElement = new ReponseEtudiantDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteReponseEtudiants(p: ReponseEtudiantDto) {
        this.item.reponseEtudiants.forEach((element, index) => {
            if (element === p) { this.item.reponseEtudiants.splice(index, 1); }
        });
    }

    public editReponseEtudiants(p: ReponseEtudiantDto) {
        this.reponseEtudiantsElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateQuizEtudiantRef();
    }

    public validateQuizEtudiantRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
            this.errorMessages.push('Ref non valide');
            this.validQuizEtudiantRef = false;
        } else {
            this.validQuizEtudiantRef = true;
        }
    }



    private validateReponseEtudiantsRef(){
        if (this.reponseEtudiantsElement.ref == null) {
        this.errorMessages.push('Ref de la reponseEtudiant est  invalide');
            this.validReponseEtudiantsRef = false;
        } else {
            this.validReponseEtudiantsRef = true;
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

    get reponseEtudiantsElement(): ReponseEtudiantDto {
        if( this._reponseEtudiantsElement == null )
            this._reponseEtudiantsElement = new ReponseEtudiantDto();
         return this._reponseEtudiantsElement;
    }

    set reponseEtudiantsElement(value: ReponseEtudiantDto) {
        this._reponseEtudiantsElement = value;
    }

    get validQuizEtudiantRef(): boolean {
        return this._validQuizEtudiantRef;
    }
    set validQuizEtudiantRef(value: boolean) {
        this._validQuizEtudiantRef = value;
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
    get validReponseEtudiantsRef(): boolean {
        return this._validReponseEtudiantsRef;
    }
    set validReponseEtudiantsRef(value: boolean) {
        this._validReponseEtudiantsRef = value;
    }

	get items(): Array<QuizEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<QuizEtudiantDto>) {
        this.service.items = value;
    }

    get item(): QuizEtudiantDto {
        return this.service.item;
    }

    set item(value: QuizEtudiantDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): QuizEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: QuizEtudiantCriteria) {
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
