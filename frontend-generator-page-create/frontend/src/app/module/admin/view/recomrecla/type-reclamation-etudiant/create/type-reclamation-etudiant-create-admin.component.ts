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



import {TypeReclamationEtudiantAdminService} from '../../../../shared/service/admin/recomrecla/TypeReclamationEtudiantAdmin.service';
import {TypeReclamationEtudiantDto} from '../../../../shared/model/recomrecla/TypeReclamationEtudiant.model';
import {TypeReclamationEtudiantCriteria} from '../../../../shared/criteria/recomrecla/TypeReclamationEtudiantCriteria.model';

@Component({
  selector: 'app-type-reclamation-etudiant-create-admin',
  templateUrl: './type-reclamation-etudiant-create-admin.component.html',
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
export class TypeReclamationEtudiantCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;




   private _validTypeReclamationEtudiantCode = true;
   private _validTypeReclamationEtudiantLibelle = true;

	constructor(private alert: FuseAlertService, private service: TypeReclamationEtudiantAdminService , @Inject(PLATFORM_ID) private platformId? ) {

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
                this.item = new TypeReclamationEtudiantDto();
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
        this.validTypeReclamationEtudiantCode = value;
        this.validTypeReclamationEtudiantLibelle = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateTypeReclamationEtudiantCode();
        this.validateTypeReclamationEtudiantLibelle();
    }

    public validateTypeReclamationEtudiantCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validTypeReclamationEtudiantCode = false;
        } else {
            this.validTypeReclamationEtudiantCode = true;
        }
    }
    public validateTypeReclamationEtudiantLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validTypeReclamationEtudiantLibelle = false;
        } else {
            this.validTypeReclamationEtudiantLibelle = true;
        }
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



    get items(): Array<TypeReclamationEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<TypeReclamationEtudiantDto>) {
        this.service.items = value;
    }

    get item(): TypeReclamationEtudiantDto {
        return this.service.item;
    }

    set item(value: TypeReclamationEtudiantDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): TypeReclamationEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: TypeReclamationEtudiantCriteria) {
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
