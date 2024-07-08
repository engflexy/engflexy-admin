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



import {SuperCategorieSectionCollaboratorService} from '../../../../shared/service/collaborator/courseref/SuperCategorieSectionCollaborator.service';
import {SuperCategorieSectionDto} from '../../../../shared/model/courseref/SuperCategorieSection.model';
import {SuperCategorieSectionCriteria} from '../../../../shared/criteria/courseref/SuperCategorieSectionCriteria.model';
import {CategorieSectionDto} from '../../../../shared/model/courseref/CategorieSection.model';
import {CategorieSectionCollaboratorService} from '../../../../shared/service/collaborator/courseref/CategorieSectionCollaborator.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionCollaboratorService} from '../../../../shared/service/collaborator/course/SectionCollaborator.service';

@Component({
  selector: 'app-super-categorie-section-create-collaborator',
  templateUrl: './super-categorie-section-create-collaborator.component.html',
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
export class SuperCategorieSectionCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;


    private _categorieSectionsElement = new CategorieSectionDto();


   private _validSuperCategorieSectionCode = true;
   private _validSuperCategorieSectionLibelle = true;
    private _validCategorieSectionsCode = true;

	constructor(private alert: FuseAlertService, private service: SuperCategorieSectionCollaboratorService , private categorieSectionService: CategorieSectionCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
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
                this.item = new SuperCategorieSectionDto();
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



    validateCategorieSections(){
        this.errorMessages = new Array();
        this.validateCategorieSectionsCode();
    }


    public  setValidation(value: boolean){
        this.validSuperCategorieSectionCode = value;
        this.validSuperCategorieSectionLibelle = value;
        this.validCategorieSectionsCode = value;
    }

    public addCategorieSections() {
        if( this.item.categorieSections == null )
            this.item.categorieSections = new Array<CategorieSectionDto>();
       this.validateCategorieSections();
       if (this.errorMessages.length === 0) {
              this.item.categorieSections.push({... this.categorieSectionsElement});
              this.categorieSectionsElement = new CategorieSectionDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletecategorieSections(p: CategorieSectionDto) {
        this.item.categorieSections.forEach((element, index) => {
            if (element === p) { this.item.categorieSections.splice(index, 1); }
        });
    }

    public editcategorieSections(p: CategorieSectionDto) {
        this.categorieSectionsElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateSuperCategorieSectionCode();
        this.validateSuperCategorieSectionLibelle();
    }

    public validateSuperCategorieSectionCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validSuperCategorieSectionCode = false;
        } else {
            this.validSuperCategorieSectionCode = true;
        }
    }
    public validateSuperCategorieSectionLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validSuperCategorieSectionLibelle = false;
        } else {
            this.validSuperCategorieSectionLibelle = true;
        }
    }

    public validateCategorieSectionsCode(){
        if (this.categorieSectionsElement.code == null) {
            this.errorMessages.push('Code de la categorieSection est  invalide');
            this.validCategorieSectionsCode = false;
        } else {
            this.validCategorieSectionsCode = true;
        }
    }





    get validSuperCategorieSectionCode(): boolean {
        return this._validSuperCategorieSectionCode;
    }

    set validSuperCategorieSectionCode(value: boolean) {
         this._validSuperCategorieSectionCode = value;
    }
    get validSuperCategorieSectionLibelle(): boolean {
        return this._validSuperCategorieSectionLibelle;
    }

    set validSuperCategorieSectionLibelle(value: boolean) {
         this._validSuperCategorieSectionLibelle = value;
    }

    get validCategorieSectionsCode(): boolean {
        return this._validCategorieSectionsCode;
    }
    set validCategorieSectionsCode(value: boolean) {
        this._validCategorieSectionsCode = value;
    }

    get categorieSectionsElement(): CategorieSectionDto {
        if( this._categorieSectionsElement == null )
            this._categorieSectionsElement = new CategorieSectionDto();
        return this._categorieSectionsElement;
    }

    set categorieSectionsElement(value: CategorieSectionDto) {
        this._categorieSectionsElement = value;
    }

    get items(): Array<SuperCategorieSectionDto> {
        return this.service.items;
    }

    set items(value: Array<SuperCategorieSectionDto>) {
        this.service.items = value;
    }

    get item(): SuperCategorieSectionDto {
        return this.service.item;
    }

    set item(value: SuperCategorieSectionDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): SuperCategorieSectionCriteria {
        return this.service.criteria;
    }

    set criteria(value: SuperCategorieSectionCriteria) {
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
