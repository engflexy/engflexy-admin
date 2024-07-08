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



import {ExerciceCollaboratorService} from '../../../../shared/service/collaborator/course/ExerciceCollaborator.service';
import {ExerciceDto} from '../../../../shared/model/course/Exercice.model';
import {ExerciceCriteria} from '../../../../shared/criteria/course/ExerciceCriteria.model';
import {ContentTypeDto} from '../../../../shared/model/courseref/ContentType.model';
import {ContentTypeCollaboratorService} from '../../../../shared/service/collaborator/courseref/ContentTypeCollaborator.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionCollaboratorService} from '../../../../shared/service/collaborator/course/SectionCollaborator.service';

@Component({
  selector: 'app-exercice-create-collaborator',
  templateUrl: './exercice-create-collaborator.component.html',
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
export class ExerciceCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _contentTypesFilter:  ContentTypeDto[];
  _sectionsFilter:  SectionDto[];



   private _validExerciceLibelle = true;
    private _validContentTypeCode = true;
    private _validContentTypeLibelle = true;
    private _validSectionCode = true;
    private _validSectionLibelle = true;

	constructor(private alert: FuseAlertService, private service: ExerciceCollaboratorService , private contentTypeService: ContentTypeCollaboratorService, private sectionService: SectionCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.contentTypeService.findAll().subscribe((data) => {this.contentTypes = data; this._contentTypesFilter = {...this.contentTypes}});
        this.sectionService.findAll().subscribe((data) => {this.sections = data; this._sectionsFilter = {...this.sections}});
    }

  displayContentType(item: ContentTypeDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterContentType(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._contentTypesFilter = this.contentTypes.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._contentTypesFilter = this.contentTypes
	}
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
                this.item = new ExerciceDto();
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
        this.validExerciceLibelle = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateExerciceLibelle();
    }

    public validateExerciceLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validExerciceLibelle = false;
        } else {
            this.validExerciceLibelle = true;
        }
    }


    public async openCreateSection(section: string) {
    const isPermistted = await this.roleService.isPermitted('Section', 'add');
    if(isPermistted) {
         this.section = new SectionDto();
         this.createSectionDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
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



    get validExerciceLibelle(): boolean {
        return this._validExerciceLibelle;
    }

    set validExerciceLibelle(value: boolean) {
         this._validExerciceLibelle = value;
    }

    get validContentTypeCode(): boolean {
        return this._validContentTypeCode;
    }
    set validContentTypeCode(value: boolean) {
        this._validContentTypeCode = value;
    }
    get validContentTypeLibelle(): boolean {
        return this._validContentTypeLibelle;
    }
    set validContentTypeLibelle(value: boolean) {
        this._validContentTypeLibelle = value;
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


    get items(): Array<ExerciceDto> {
        return this.service.items;
    }

    set items(value: Array<ExerciceDto>) {
        this.service.items = value;
    }

    get item(): ExerciceDto {
        return this.service.item;
    }

    set item(value: ExerciceDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): ExerciceCriteria {
        return this.service.criteria;
    }

    set criteria(value: ExerciceCriteria) {
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
