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



import {ReponseCollaboratorService} from '../../../../shared/service/collaborator/quiz/ReponseCollaborator.service';
import {ReponseDto} from '../../../../shared/model/quiz/Reponse.model';
import {ReponseCriteria} from '../../../../shared/criteria/quiz/ReponseCriteria.model';
import {QuestionDto} from '../../../../shared/model/quiz/Question.model';
import {QuestionCollaboratorService} from '../../../../shared/service/collaborator/quiz/QuestionCollaborator.service';

@Component({
  selector: 'app-reponse-create-collaborator',
  templateUrl: './reponse-create-collaborator.component.html',
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
export class ReponseCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _questionsFilter:  QuestionDto[];



   private _validReponseRef = true;
   private _validReponseLib = true;
    private _validQuestionRef = true;

	constructor(private alert: FuseAlertService, private service: ReponseCollaboratorService , private questionService: QuestionCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.questionService.findAll().subscribe((data) => {this.questions = data; this._questionsFilter = {...this.questions}});
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
                this.item = new ReponseDto();
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
        this.validReponseRef = value;
        this.validReponseLib = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateReponseRef();
        this.validateReponseLib();
    }

    public validateReponseRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
        this.errorMessages.push('Ref non valide');
        this.validReponseRef = false;
        } else {
            this.validReponseRef = true;
        }
    }
    public validateReponseLib(){
        if (this.stringUtilService.isEmpty(this.item.lib)) {
        this.errorMessages.push('Lib non valide');
        this.validReponseLib = false;
        } else {
            this.validReponseLib = true;
        }
    }


    public async openCreateQuestion(question: string) {
    const isPermistted = await this.roleService.isPermitted('Question', 'add');
    if(isPermistted) {
         this.question = new QuestionDto();
         this.createQuestionDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
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

    get validQuestionRef(): boolean {
        return this._validQuestionRef;
    }
    set validQuestionRef(value: boolean) {
        this._validQuestionRef = value;
    }


    get items(): Array<ReponseDto> {
        return this.service.items;
    }

    set items(value: Array<ReponseDto>) {
        this.service.items = value;
    }

    get item(): ReponseDto {
        return this.service.item;
    }

    set item(value: ReponseDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): ReponseCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReponseCriteria) {
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
