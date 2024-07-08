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



import {QuizAdminService} from '../../../../shared/service/admin/quiz/QuizAdmin.service';
import {QuizDto} from '../../../../shared/model/quiz/Quiz.model';
import {QuizCriteria} from '../../../../shared/criteria/quiz/QuizCriteria.model';
import {QuizEtudiantDto} from '../../../../shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantAdminService} from '../../../../shared/service/admin/quizetudiant/QuizEtudiantAdmin.service';
import {TypeDeQuestionDto} from '../../../../shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionAdminService} from '../../../../shared/service/admin/quizref/TypeDeQuestionAdmin.service';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from '../../../../shared/service/admin/inscription/EtudiantAdmin.service';
import {ReponseEtudiantDto} from '../../../../shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantAdminService} from '../../../../shared/service/admin/quizetudiant/ReponseEtudiantAdmin.service';
import {QuestionDto} from '../../../../shared/model/quiz/Question.model';
import {QuestionAdminService} from '../../../../shared/service/admin/quiz/QuestionAdmin.service';
import {ReponseDto} from '../../../../shared/model/quiz/Reponse.model';
import {ReponseAdminService} from '../../../../shared/service/admin/quiz/ReponseAdmin.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionAdminService} from '../../../../shared/service/admin/course/SectionAdmin.service';

@Component({
  selector: 'app-quiz-create-admin',
  templateUrl: './quiz-create-admin.component.html',
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
export class QuizCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _sectionsFilter:  SectionDto[];

    private _questionsElement = new QuestionDto();
    private _quizEtudiantsElement = new QuizEtudiantDto();


   private _validQuizRef = true;
   private _validQuizLib = true;
    private _validQuestionsRef = true;
    private _validQuizEtudiantsRef = true;
    private _validSectionCode = true;
    private _validSectionLibelle = true;

	constructor(private alert: FuseAlertService, private service: QuizAdminService , private quizEtudiantService: QuizEtudiantAdminService, private typeDeQuestionService: TypeDeQuestionAdminService, private etudiantService: EtudiantAdminService, private questionService: QuestionAdminService, private sectionService: SectionAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.questionsElement.typeDeQuestion = new TypeDeQuestionDto();
        this.typeDeQuestionService.findAll().subscribe((data) => this.typeDeQuestions = data);
        this.quizEtudiantsElement.etudiant = new EtudiantDto();
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
        this.sectionService.findAll().subscribe((data) => {this.sections = data; this._sectionsFilter = {...this.sections}});
    }

  displaySection(item: SectionDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterSection(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._sectionsFilter = this.sections.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._sectionsFilter = this.sections
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
                this.item = new QuizDto();
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



    validateQuestions(){
        this.errorMessages = new Array();
        this.validateQuestionsRef();
    }
    validateQuizEtudiants(){
        this.errorMessages = new Array();
        this.validateQuizEtudiantsRef();
    }


    public  setValidation(value: boolean){
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
              this.item.questions.push({... this.questionsElement});
              this.questionsElement = new QuestionDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletequestions(p: QuestionDto) {
        this.item.questions.forEach((element, index) => {
            if (element === p) { this.item.questions.splice(index, 1); }
        });
    }

    public editquestions(p: QuestionDto) {
        this.questionsElement = {... p};
        this.activeTab = 0;
    }
    public addQuizEtudiants() {
        if( this.item.quizEtudiants == null )
            this.item.quizEtudiants = new Array<QuizEtudiantDto>();
       this.validateQuizEtudiants();
       if (this.errorMessages.length === 0) {
              this.item.quizEtudiants.push({... this.quizEtudiantsElement});
              this.quizEtudiantsElement = new QuizEtudiantDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletequizEtudiants(p: QuizEtudiantDto) {
        this.item.quizEtudiants.forEach((element, index) => {
            if (element === p) { this.item.quizEtudiants.splice(index, 1); }
        });
    }

    public editquizEtudiants(p: QuizEtudiantDto) {
        this.quizEtudiantsElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
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

    public validateQuestionsRef(){
        if (this.questionsElement.ref == null) {
            this.errorMessages.push('Ref de la question est  invalide');
            this.validQuestionsRef = false;
        } else {
            this.validQuestionsRef = true;
        }
    }
    public validateQuizEtudiantsRef(){
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

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
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
