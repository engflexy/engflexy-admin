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



import {ReclamationProfAdminService} from '../../../../shared/service/admin/recomrecla/ReclamationProfAdmin.service';
import {ReclamationProfDto} from '../../../../shared/model/recomrecla/ReclamationProf.model';
import {ReclamationProfCriteria} from '../../../../shared/criteria/recomrecla/ReclamationProfCriteria.model';
import {TypeReclamationProfDto} from '../../../../shared/model/recomrecla/TypeReclamationProf.model';
import {TypeReclamationProfAdminService} from '../../../../shared/service/admin/recomrecla/TypeReclamationProfAdmin.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfAdminService} from '../../../../shared/service/admin/prof/ProfAdmin.service';

@Component({
  selector: 'app-reclamation-prof-create-admin',
  templateUrl: './reclamation-prof-create-admin.component.html',
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
export class ReclamationProfCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _profsFilter:  ProfDto[];
  _typeReclamationProfsFilter:  TypeReclamationProfDto[];



   private _validReclamationProfReference = true;
    private _validProfRef = true;
    private _validTypeReclamationProfCode = true;
    private _validTypeReclamationProfLibelle = true;

	constructor(private alert: FuseAlertService, private service: ReclamationProfAdminService , private typeReclamationProfService: TypeReclamationProfAdminService, private profService: ProfAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.profService.findAll().subscribe((data) => {this.profs = data; this._profsFilter = {...this.profs}});
        this.typeReclamationProfService.findAll().subscribe((data) => {this.typeReclamationProfs = data; this._typeReclamationProfsFilter = {...this.typeReclamationProfs}});
    }

  displayProf(item: ProfDto): string {
	return item && item.ref ? item.ref : "";

  }

  filterProf(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._profsFilter = this.profs.filter(s =>
			s.ref?.toLowerCase()?.includes(value)
		)
	} else {
		this._profsFilter = this.profs
	}
 }
  displayTypeReclamationProf(item: TypeReclamationProfDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterTypeReclamationProf(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._typeReclamationProfsFilter = this.typeReclamationProfs.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._typeReclamationProfsFilter = this.typeReclamationProfs
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
                this.item = new ReclamationProfDto();
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
        this.validReclamationProfReference = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateReclamationProfReference();
    }

    public validateReclamationProfReference(){
        if (this.stringUtilService.isEmpty(this.item.reference)) {
        this.errorMessages.push('Reference non valide');
        this.validReclamationProfReference = false;
        } else {
            this.validReclamationProfReference = true;
        }
    }


    public async openCreateTypeReclamationProf(typeReclamationProf: string) {
    const isPermistted = await this.roleService.isPermitted('TypeReclamationProf', 'add');
    if(isPermistted) {
         this.typeReclamationProf = new TypeReclamationProfDto();
         this.createTypeReclamationProfDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get typeReclamationProf(): TypeReclamationProfDto {
        return this.typeReclamationProfService.item;
    }
    set typeReclamationProf(value: TypeReclamationProfDto) {
        this.typeReclamationProfService.item = value;
    }
    get typeReclamationProfs(): Array<TypeReclamationProfDto> {
        return this.typeReclamationProfService.items;
    }
    set typeReclamationProfs(value: Array<TypeReclamationProfDto>) {
        this.typeReclamationProfService.items = value;
    }
    get createTypeReclamationProfDialog(): boolean {
        return this.typeReclamationProfService.createDialog;
    }
    set createTypeReclamationProfDialog(value: boolean) {
        this.typeReclamationProfService.createDialog= value;
    }
    get prof(): ProfDto {
        return this.profService.item;
    }
    set prof(value: ProfDto) {
        this.profService.item = value;
    }
    get profs(): Array<ProfDto> {
        return this.profService.items;
    }
    set profs(value: Array<ProfDto>) {
        this.profService.items = value;
    }
    get createProfDialog(): boolean {
        return this.profService.createDialog;
    }
    set createProfDialog(value: boolean) {
        this.profService.createDialog= value;
    }



    get validReclamationProfReference(): boolean {
        return this._validReclamationProfReference;
    }

    set validReclamationProfReference(value: boolean) {
         this._validReclamationProfReference = value;
    }

    get validProfRef(): boolean {
        return this._validProfRef;
    }
    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }
    get validTypeReclamationProfCode(): boolean {
        return this._validTypeReclamationProfCode;
    }
    set validTypeReclamationProfCode(value: boolean) {
        this._validTypeReclamationProfCode = value;
    }
    get validTypeReclamationProfLibelle(): boolean {
        return this._validTypeReclamationProfLibelle;
    }
    set validTypeReclamationProfLibelle(value: boolean) {
        this._validTypeReclamationProfLibelle = value;
    }


    get items(): Array<ReclamationProfDto> {
        return this.service.items;
    }

    set items(value: Array<ReclamationProfDto>) {
        this.service.items = value;
    }

    get item(): ReclamationProfDto {
        return this.service.item;
    }

    set item(value: ReclamationProfDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): ReclamationProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReclamationProfCriteria) {
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
