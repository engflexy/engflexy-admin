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



import {SectionCollaboratorService} from '../../../../shared/service/collaborator/course/SectionCollaborator.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionCriteria} from '../../../../shared/criteria/course/SectionCriteria.model';
import {QuizDto} from '../../../../shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from '../../../../shared/service/collaborator/quiz/QuizCollaborator.service';
import {QuizEtudiantDto} from '../../../../shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCollaboratorService} from '../../../../shared/service/collaborator/quizetudiant/QuizEtudiantCollaborator.service';
import {ContentTypeDto} from '../../../../shared/model/courseref/ContentType.model';
import {ContentTypeCollaboratorService} from '../../../../shared/service/collaborator/courseref/ContentTypeCollaborator.service';
import {QuestionDto} from '../../../../shared/model/quiz/Question.model';
import {QuestionCollaboratorService} from '../../../../shared/service/collaborator/quiz/QuestionCollaborator.service';
import {ExerciceDto} from '../../../../shared/model/course/Exercice.model';
import {ExerciceCollaboratorService} from '../../../../shared/service/collaborator/course/ExerciceCollaborator.service';

@Component({
  selector: 'app-section-create-collaborator',
  templateUrl: './section-create-collaborator.component.html',
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
export class SectionCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;


    private _quizsElement = new QuizDto();
    private _exercicesElement = new ExerciceDto();


   private _validSectionCode = true;
   private _validSectionLibelle = true;
    private _validQuizsRef = true;
    private _validQuizsLib = true;
    private _validExercicesLibelle = true;

	constructor(private alert: FuseAlertService, private service: SectionCollaboratorService , private quizService: QuizCollaboratorService, private contentTypeService: ContentTypeCollaboratorService, private exerciceService: ExerciceCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.exercicesElement.contentType = new ContentTypeDto();
        this.contentTypeService.findAll().subscribe((data) => this.contentTypes = data);
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
                this.item = new SectionDto();
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



    validateQuizs(){
        this.errorMessages = new Array();
        this.validateQuizsRef();
        this.validateQuizsLib();
    }
    validateExercices(){
        this.errorMessages = new Array();
        this.validateExercicesLibelle();
    }


    public  setValidation(value: boolean){
        this.validSectionCode = value;
        this.validSectionLibelle = value;
        this.validQuizsRef = value;
        this.validQuizsLib = value;
        this.validExercicesLibelle = value;
    }

    public addQuizs() {
        if( this.item.quizs == null )
            this.item.quizs = new Array<QuizDto>();
       this.validateQuizs();
       if (this.errorMessages.length === 0) {
              this.item.quizs.push({... this.quizsElement});
              this.quizsElement = new QuizDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletequizs(p: QuizDto) {
        this.item.quizs.forEach((element, index) => {
            if (element === p) { this.item.quizs.splice(index, 1); }
        });
    }

    public editquizs(p: QuizDto) {
        this.quizsElement = {... p};
        this.activeTab = 0;
    }
    public addExercices() {
        if( this.item.exercices == null )
            this.item.exercices = new Array<ExerciceDto>();
       this.validateExercices();
       if (this.errorMessages.length === 0) {
              this.item.exercices.push({... this.exercicesElement});
              this.exercicesElement = new ExerciceDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deleteexercices(p: ExerciceDto) {
        this.item.exercices.forEach((element, index) => {
            if (element === p) { this.item.exercices.splice(index, 1); }
        });
    }

    public editexercices(p: ExerciceDto) {
        this.exercicesElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateSectionCode();
        this.validateSectionLibelle();
    }

    public validateSectionCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validSectionCode = false;
        } else {
            this.validSectionCode = true;
        }
    }
    public validateSectionLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validSectionLibelle = false;
        } else {
            this.validSectionLibelle = true;
        }
    }

    public validateQuizsRef(){
        if (this.quizsElement.ref == null) {
            this.errorMessages.push('Ref de la quiz est  invalide');
            this.validQuizsRef = false;
        } else {
            this.validQuizsRef = true;
        }
    }
    public validateQuizsLib(){
        if (this.quizsElement.lib == null) {
            this.errorMessages.push('Lib de la quiz est  invalide');
            this.validQuizsLib = false;
        } else {
            this.validQuizsLib = true;
        }
    }
    public validateExercicesLibelle(){
        if (this.exercicesElement.libelle == null) {
            this.errorMessages.push('Libelle de la exercice est  invalide');
            this.validExercicesLibelle = false;
        } else {
            this.validExercicesLibelle = true;
        }
    }


    get contentType(): ContentTypeDto {
        return this.contentTypeService.item;
    }
    set contentType(value: ContentTypeDto) {
        this.contentTypeService.item = value;
    }
    get contentTypes(): Array<ContentTypeDto> {
        return this.contentTypeService.items;
    }
    set contentTypes(value: Array<ContentTypeDto>) {
        this.contentTypeService.items = value;
    }
    get createContentTypeDialog(): boolean {
        return this.contentTypeService.createDialog;
    }
    set createContentTypeDialog(value: boolean) {
        this.contentTypeService.createDialog= value;
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

    get validQuizsRef(): boolean {
        return this._validQuizsRef;
    }
    set validQuizsRef(value: boolean) {
        this._validQuizsRef = value;
    }
    get validQuizsLib(): boolean {
        return this._validQuizsLib;
    }
    set validQuizsLib(value: boolean) {
        this._validQuizsLib = value;
    }
    get validExercicesLibelle(): boolean {
        return this._validExercicesLibelle;
    }
    set validExercicesLibelle(value: boolean) {
        this._validExercicesLibelle = value;
    }

    get quizsElement(): QuizDto {
        if( this._quizsElement == null )
            this._quizsElement = new QuizDto();
        return this._quizsElement;
    }

    set quizsElement(value: QuizDto) {
        this._quizsElement = value;
    }
    get exercicesElement(): ExerciceDto {
        if( this._exercicesElement == null )
            this._exercicesElement = new ExerciceDto();
        return this._exercicesElement;
    }

    set exercicesElement(value: ExerciceDto) {
        this._exercicesElement = value;
    }

    get items(): Array<SectionDto> {
        return this.service.items;
    }

    set items(value: Array<SectionDto>) {
        this.service.items = value;
    }

    get item(): SectionDto {
        return this.service.item;
    }

    set item(value: SectionDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): SectionCriteria {
        return this.service.criteria;
    }

    set criteria(value: SectionCriteria) {
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
