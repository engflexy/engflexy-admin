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



import {VocabularyAdminService} from '../../../../shared/service/admin/vocab/VocabularyAdmin.service';
import {VocabularyDto} from '../../../../shared/model/vocab/Vocabulary.model';
import {VocabularyCriteria} from '../../../../shared/criteria/vocab/VocabularyCriteria.model';
import {VocabularyQuizDto} from '../../../../shared/model/vocab/VocabularyQuiz.model';
import {VocabularyQuizAdminService} from '../../../../shared/service/admin/vocab/VocabularyQuizAdmin.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionAdminService} from '../../../../shared/service/admin/course/SectionAdmin.service';

@Component({
  selector: 'app-vocabulary-create-admin',
  templateUrl: './vocabulary-create-admin.component.html',
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
export class VocabularyCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _sectionsFilter:  SectionDto[];
  _vocabularyQuizsFilter:  VocabularyQuizDto[];



    private _validSectionCode = true;
    private _validSectionLibelle = true;
    private _validVocabularyQuizLibelle = true;

	constructor(private alert: FuseAlertService, private service: VocabularyAdminService , private vocabularyQuizService: VocabularyQuizAdminService, private sectionService: SectionAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.sectionService.findAll().subscribe((data) => {this.sections = data; this._sectionsFilter = {...this.sections}});
        this.vocabularyQuizService.findAll().subscribe((data) => {this.vocabularyQuizs = data; this._vocabularyQuizsFilter = {...this.vocabularyQuizs}});
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
  displayVocabularyQuiz(item: VocabularyQuizDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterVocabularyQuiz(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._vocabularyQuizsFilter = this.vocabularyQuizs.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._vocabularyQuizsFilter = this.vocabularyQuizs
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
                this.item = new VocabularyDto();
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
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
    }



    public async openCreateVocabularyQuiz(vocabularyQuiz: string) {
    const isPermistted = await this.roleService.isPermitted('VocabularyQuiz', 'add');
    if(isPermistted) {
         this.vocabularyQuiz = new VocabularyQuizDto();
         this.createVocabularyQuizDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get vocabularyQuiz(): VocabularyQuizDto {
        return this.vocabularyQuizService.item;
    }
    set vocabularyQuiz(value: VocabularyQuizDto) {
        this.vocabularyQuizService.item = value;
    }
    get vocabularyQuizs(): Array<VocabularyQuizDto> {
        return this.vocabularyQuizService.items;
    }
    set vocabularyQuizs(value: Array<VocabularyQuizDto>) {
        this.vocabularyQuizService.items = value;
    }
    get createVocabularyQuizDialog(): boolean {
        return this.vocabularyQuizService.createDialog;
    }
    set createVocabularyQuizDialog(value: boolean) {
        this.vocabularyQuizService.createDialog= value;
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
    get validVocabularyQuizLibelle(): boolean {
        return this._validVocabularyQuizLibelle;
    }
    set validVocabularyQuizLibelle(value: boolean) {
        this._validVocabularyQuizLibelle = value;
    }


    get items(): Array<VocabularyDto> {
        return this.service.items;
    }

    set items(value: Array<VocabularyDto>) {
        this.service.items = value;
    }

    get item(): VocabularyDto {
        return this.service.item;
    }

    set item(value: VocabularyDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): VocabularyCriteria {
        return this.service.criteria;
    }

    set criteria(value: VocabularyCriteria) {
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
