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



import {VocabularyQuizAdminService} from '../../../../shared/service/admin/vocab/VocabularyQuizAdmin.service';
import {VocabularyQuizDto} from '../../../../shared/model/vocab/VocabularyQuiz.model';
import {VocabularyQuizCriteria} from '../../../../shared/criteria/vocab/VocabularyQuizCriteria.model';
import {VocabularyDto} from '../../../../shared/model/vocab/Vocabulary.model';
import {VocabularyAdminService} from '../../../../shared/service/admin/vocab/VocabularyAdmin.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionAdminService} from '../../../../shared/service/admin/course/SectionAdmin.service';

@Component({
  selector: 'app-vocabulary-quiz-create-admin',
  templateUrl: './vocabulary-quiz-create-admin.component.html',
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
export class VocabularyQuizCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _sectionsFilter:  SectionDto[];

    private _vocabularysElement = new VocabularyDto();


   private _validVocabularyQuizLibelle = true;
    private _validSectionCode = true;
    private _validSectionLibelle = true;

	constructor(private alert: FuseAlertService, private service: VocabularyQuizAdminService , private vocabularyService: VocabularyAdminService, private sectionService: SectionAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.vocabularysElement.section = new SectionDto();
        this.sectionService.findAll().subscribe((data) => this.sections = data);
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
                this.item = new VocabularyQuizDto();
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



    validateVocabularys(){
        this.errorMessages = new Array();
    }


    public  setValidation(value: boolean){
        this.validVocabularyQuizLibelle = value;
    }

    public addVocabularys() {
        if( this.item.vocabularys == null )
            this.item.vocabularys = new Array<VocabularyDto>();
       this.validateVocabularys();
       if (this.errorMessages.length === 0) {
              this.item.vocabularys.push({... this.vocabularysElement});
              this.vocabularysElement = new VocabularyDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletevocabularys(p: VocabularyDto) {
        this.item.vocabularys.forEach((element, index) => {
            if (element === p) { this.item.vocabularys.splice(index, 1); }
        });
    }

    public editvocabularys(p: VocabularyDto) {
        this.vocabularysElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateVocabularyQuizLibelle();
    }

    public validateVocabularyQuizLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validVocabularyQuizLibelle = false;
        } else {
            this.validVocabularyQuizLibelle = true;
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



    get validVocabularyQuizLibelle(): boolean {
        return this._validVocabularyQuizLibelle;
    }

    set validVocabularyQuizLibelle(value: boolean) {
         this._validVocabularyQuizLibelle = value;
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

    get vocabularysElement(): VocabularyDto {
        if( this._vocabularysElement == null )
            this._vocabularysElement = new VocabularyDto();
        return this._vocabularysElement;
    }

    set vocabularysElement(value: VocabularyDto) {
        this._vocabularysElement = value;
    }

    get items(): Array<VocabularyQuizDto> {
        return this.service.items;
    }

    set items(value: Array<VocabularyQuizDto>) {
        this.service.items = value;
    }

    get item(): VocabularyQuizDto {
        return this.service.item;
    }

    set item(value: VocabularyQuizDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): VocabularyQuizCriteria {
        return this.service.criteria;
    }

    set criteria(value: VocabularyQuizCriteria) {
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
