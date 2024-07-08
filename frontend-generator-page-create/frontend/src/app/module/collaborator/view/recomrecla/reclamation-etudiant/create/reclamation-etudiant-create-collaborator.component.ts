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



import {ReclamationEtudiantCollaboratorService} from '../../../../shared/service/collaborator/recomrecla/ReclamationEtudiantCollaborator.service';
import {ReclamationEtudiantDto} from '../../../../shared/model/recomrecla/ReclamationEtudiant.model';
import {ReclamationEtudiantCriteria} from '../../../../shared/criteria/recomrecla/ReclamationEtudiantCriteria.model';
import {TypeReclamationEtudiantDto} from '../../../../shared/model/recomrecla/TypeReclamationEtudiant.model';
import {TypeReclamationEtudiantCollaboratorService} from '../../../../shared/service/collaborator/recomrecla/TypeReclamationEtudiantCollaborator.service';

@Component({
  selector: 'app-reclamation-etudiant-create-collaborator',
  templateUrl: './reclamation-etudiant-create-collaborator.component.html',
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
export class ReclamationEtudiantCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _typeReclamationEtudiantsFilter:  TypeReclamationEtudiantDto[];



   private _validReclamationEtudiantReference = true;
    private _validTypeReclamationEtudiantCode = true;
    private _validTypeReclamationEtudiantLibelle = true;

	constructor(private alert: FuseAlertService, private service: ReclamationEtudiantCollaboratorService , private typeReclamationEtudiantService: TypeReclamationEtudiantCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.typeReclamationEtudiantService.findAll().subscribe((data) => {this.typeReclamationEtudiants = data; this._typeReclamationEtudiantsFilter = {...this.typeReclamationEtudiants}});
    }

  displayTypeReclamationEtudiant(item: TypeReclamationEtudiantDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterTypeReclamationEtudiant(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._typeReclamationEtudiantsFilter = this.typeReclamationEtudiants.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._typeReclamationEtudiantsFilter = this.typeReclamationEtudiants
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
                this.item = new ReclamationEtudiantDto();
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
        this.validReclamationEtudiantReference = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateReclamationEtudiantReference();
    }

    public validateReclamationEtudiantReference(){
        if (this.stringUtilService.isEmpty(this.item.reference)) {
        this.errorMessages.push('Reference non valide');
        this.validReclamationEtudiantReference = false;
        } else {
            this.validReclamationEtudiantReference = true;
        }
    }


    public async openCreateTypeReclamationEtudiant(typeReclamationEtudiant: string) {
    const isPermistted = await this.roleService.isPermitted('TypeReclamationEtudiant', 'add');
    if(isPermistted) {
         this.typeReclamationEtudiant = new TypeReclamationEtudiantDto();
         this.createTypeReclamationEtudiantDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get typeReclamationEtudiant(): TypeReclamationEtudiantDto {
        return this.typeReclamationEtudiantService.item;
    }
    set typeReclamationEtudiant(value: TypeReclamationEtudiantDto) {
        this.typeReclamationEtudiantService.item = value;
    }
    get typeReclamationEtudiants(): Array<TypeReclamationEtudiantDto> {
        return this.typeReclamationEtudiantService.items;
    }
    set typeReclamationEtudiants(value: Array<TypeReclamationEtudiantDto>) {
        this.typeReclamationEtudiantService.items = value;
    }
    get createTypeReclamationEtudiantDialog(): boolean {
        return this.typeReclamationEtudiantService.createDialog;
    }
    set createTypeReclamationEtudiantDialog(value: boolean) {
        this.typeReclamationEtudiantService.createDialog= value;
    }



    get validReclamationEtudiantReference(): boolean {
        return this._validReclamationEtudiantReference;
    }

    set validReclamationEtudiantReference(value: boolean) {
         this._validReclamationEtudiantReference = value;
    }

    get validTypeReclamationEtudiantCode(): boolean {
        return this._validTypeReclamationEtudiantCode;
    }
    set validTypeReclamationEtudiantCode(value: boolean) {
        this._validTypeReclamationEtudiantCode = value;
    }
    get validTypeReclamationEtudiantLibelle(): boolean {
        return this._validTypeReclamationEtudiantLibelle;
    }
    set validTypeReclamationEtudiantLibelle(value: boolean) {
        this._validTypeReclamationEtudiantLibelle = value;
    }


    get items(): Array<ReclamationEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<ReclamationEtudiantDto>) {
        this.service.items = value;
    }

    get item(): ReclamationEtudiantDto {
        return this.service.item;
    }

    set item(value: ReclamationEtudiantDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): ReclamationEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReclamationEtudiantCriteria) {
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
