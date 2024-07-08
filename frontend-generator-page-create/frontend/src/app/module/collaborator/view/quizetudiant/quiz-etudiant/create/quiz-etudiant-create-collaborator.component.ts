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



import {QuizEtudiantCollaboratorService} from '../../../../shared/service/collaborator/quizetudiant/QuizEtudiantCollaborator.service';
import {QuizEtudiantDto} from '../../../../shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCriteria} from '../../../../shared/criteria/quizetudiant/QuizEtudiantCriteria.model';
import {QuizDto} from '../../../../shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from '../../../../shared/service/collaborator/quiz/QuizCollaborator.service';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from '../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {ReponseEtudiantDto} from '../../../../shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantCollaboratorService} from '../../../../shared/service/collaborator/quizetudiant/ReponseEtudiantCollaborator.service';
import {QuestionDto} from '../../../../shared/model/quiz/Question.model';
import {QuestionCollaboratorService} from '../../../../shared/service/collaborator/quiz/QuestionCollaborator.service';
import {ReponseDto} from '../../../../shared/model/quiz/Reponse.model';
import {ReponseCollaboratorService} from '../../../../shared/service/collaborator/quiz/ReponseCollaborator.service';

@Component({
  selector: 'app-quiz-etudiant-create-collaborator',
  templateUrl: './quiz-etudiant-create-collaborator.component.html',
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
export class QuizEtudiantCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _etudiantsFilter:  EtudiantDto[];
  _quizsFilter:  QuizDto[];

    private _reponseEtudiantsElement = new ReponseEtudiantDto();


   private _validQuizEtudiantRef = true;
    private _validQuizRef = true;
    private _validQuizLib = true;
    private _validReponseEtudiantsRef = true;

	constructor(private alert: FuseAlertService, private service: QuizEtudiantCollaboratorService , private quizService: QuizCollaboratorService, private etudiantService: EtudiantCollaboratorService, private reponseEtudiantService: ReponseEtudiantCollaboratorService, private questionService: QuestionCollaboratorService, private reponseService: ReponseCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.reponseEtudiantsElement.reponse = new ReponseDto();
        this.reponseService.findAll().subscribe((data) => this.reponses = data);
        this.reponseEtudiantsElement.question = new QuestionDto();
        this.questionService.findAll().subscribe((data) => this.questions = data);
        this.etudiantService.findAll().subscribe((data) => {this.etudiants = data; this._etudiantsFilter = {...this.etudiants}});
        this.quizService.findAll().subscribe((data) => {this.quizs = data; this._quizsFilter = {...this.quizs}});
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
                this.item = new QuizEtudiantDto();
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



    validateReponseEtudiants(){
        this.errorMessages = new Array();
        this.validateReponseEtudiantsRef();
    }


    public  setValidation(value: boolean){
        this.validQuizEtudiantRef = value;
        this.validReponseEtudiantsRef = value;
    }

    public addReponseEtudiants() {
        if( this.item.reponseEtudiants == null )
            this.item.reponseEtudiants = new Array<ReponseEtudiantDto>();
       this.validateReponseEtudiants();
       if (this.errorMessages.length === 0) {
              this.item.reponseEtudiants.push({... this.reponseEtudiantsElement});
              this.reponseEtudiantsElement = new ReponseEtudiantDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletereponseEtudiants(p: ReponseEtudiantDto) {
        this.item.reponseEtudiants.forEach((element, index) => {
            if (element === p) { this.item.reponseEtudiants.splice(index, 1); }
        });
    }

    public editreponseEtudiants(p: ReponseEtudiantDto) {
        this.reponseEtudiantsElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
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

    public validateReponseEtudiantsRef(){
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

    get reponseEtudiantsElement(): ReponseEtudiantDto {
        if( this._reponseEtudiantsElement == null )
            this._reponseEtudiantsElement = new ReponseEtudiantDto();
        return this._reponseEtudiantsElement;
    }

    set reponseEtudiantsElement(value: ReponseEtudiantDto) {
        this._reponseEtudiantsElement = value;
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

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
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
