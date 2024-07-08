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




import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCriteria} from 'src/app/shared/criteria/course/SectionCriteria.model';


import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizAdminService} from 'src/app/shared/service/admin/quiz/QuizAdmin.service';
import {QuizEtudiantDto} from 'src/app/shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantAdminService} from 'src/app/shared/service/admin/quizetudiant/QuizEtudiantAdmin.service';
import {ContentTypeDto} from 'src/app/shared/model/courseref/ContentType.model';
import {ContentTypeAdminService} from 'src/app/shared/service/admin/courseref/ContentTypeAdmin.service';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionAdminService} from 'src/app/shared/service/admin/quiz/QuestionAdmin.service';
import {ExerciceDto} from 'src/app/shared/model/course/Exercice.model';
import {ExerciceAdminService} from 'src/app/shared/service/admin/course/ExerciceAdmin.service';

@Component({
  selector: 'app-section-edit-admin',
  templateUrl: './section-edit-admin.component.html'
})
export class SectionEditAdminComponent implements OnInit {

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


    private _quizsElement = new QuizDto();
    private _exercicesElement = new ExerciceDto();

    private _validSectionCode = true;
    private _validSectionLibelle = true;

    private _validQuizsRef = true;
    private _validQuizsLib = true;
    private _validExercicesLibelle = true;



    constructor(private service: SectionAdminService , private quizService: QuizAdminService, private contentTypeService: ContentTypeAdminService, private exerciceService: ExerciceAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {

        this.exercicesElement.contentType = new ContentTypeDto();
        this.contentTypeService.findAll().subscribe((data) => this.contentTypes = data);

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
            this.item = new SectionDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateQuizs(){
        this.errorMessages = new Array();
        this.validateQuizsRef();
        this.validateQuizsLib();
    }

    public validateExercices(){
        this.errorMessages = new Array();
        this.validateExercicesLibelle();
    }

    public setValidation(value: boolean){
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
            if(this.quizsElement.id == null){
                this.item.quizs.push(this.quizsElement);
            }else{
                const index = this.item.quizs.findIndex(e => e.id == this.quizsElement.id);
                this.item.quizs[index] = this.quizsElement;
            }
          this.quizsElement = new QuizDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteQuizs(p: QuizDto) {
        this.item.quizs.forEach((element, index) => {
            if (element === p) { this.item.quizs.splice(index, 1); }
        });
    }

    public editQuizs(p: QuizDto) {
        this.quizsElement = {... p};
        this.activeTab = 0;
    }


   public addExercices() {
        if( this.item.exercices == null )
            this.item.exercices = new Array<ExerciceDto>();
       this.validateExercices();
       if (this.errorMessages.length === 0) {
            if(this.exercicesElement.id == null){
                this.item.exercices.push(this.exercicesElement);
            }else{
                const index = this.item.exercices.findIndex(e => e.id == this.exercicesElement.id);
                this.item.exercices[index] = this.exercicesElement;
            }
          this.exercicesElement = new ExerciceDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteExercices(p: ExerciceDto) {
        this.item.exercices.forEach((element, index) => {
            if (element === p) { this.item.exercices.splice(index, 1); }
        });
    }

    public editExercices(p: ExerciceDto) {
        this.exercicesElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
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



    private validateQuizsRef(){
        if (this.quizsElement.ref == null) {
        this.errorMessages.push('Ref de la quiz est  invalide');
            this.validQuizsRef = false;
        } else {
            this.validQuizsRef = true;
        }
    }
    private validateQuizsLib(){
        if (this.quizsElement.lib == null) {
        this.errorMessages.push('Lib de la quiz est  invalide');
            this.validQuizsLib = false;
        } else {
            this.validQuizsLib = true;
        }
    }
    private validateExercicesLibelle(){
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

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
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
