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



import {TypeCollaboratorCollaboratorService} from '../../../../shared/service/collaborator/prof/TypeCollaboratorCollaborator.service';
import {TypeCollaboratorDto} from '../../../../shared/model/prof/TypeCollaborator.model';
import {TypeCollaboratorCriteria} from '../../../../shared/criteria/prof/TypeCollaboratorCriteria.model';

@Component({
  selector: 'app-type-collaborator-create-collaborator',
  templateUrl: './type-collaborator-create-collaborator.component.html',
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
export class TypeCollaboratorCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;




   private _validTypeCollaboratorLibelle = true;
   private _validTypeCollaboratorCode = true;

	constructor(private alert: FuseAlertService, private service: TypeCollaboratorCollaboratorService , @Inject(PLATFORM_ID) private platformId? ) {

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
                this.item = new TypeCollaboratorDto();
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
        this.validTypeCollaboratorLibelle = value;
        this.validTypeCollaboratorCode = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateTypeCollaboratorLibelle();
        this.validateTypeCollaboratorCode();
    }

    public validateTypeCollaboratorLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validTypeCollaboratorLibelle = false;
        } else {
            this.validTypeCollaboratorLibelle = true;
        }
    }
    public validateTypeCollaboratorCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validTypeCollaboratorCode = false;
        } else {
            this.validTypeCollaboratorCode = true;
        }
    }






    get validTypeCollaboratorLibelle(): boolean {
        return this._validTypeCollaboratorLibelle;
    }

    set validTypeCollaboratorLibelle(value: boolean) {
         this._validTypeCollaboratorLibelle = value;
    }
    get validTypeCollaboratorCode(): boolean {
        return this._validTypeCollaboratorCode;
    }

    set validTypeCollaboratorCode(value: boolean) {
         this._validTypeCollaboratorCode = value;
    }



    get items(): Array<TypeCollaboratorDto> {
        return this.service.items;
    }

    set items(value: Array<TypeCollaboratorDto>) {
        this.service.items = value;
    }

    get item(): TypeCollaboratorDto {
        return this.service.item;
    }

    set item(value: TypeCollaboratorDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): TypeCollaboratorCriteria {
        return this.service.criteria;
    }

    set criteria(value: TypeCollaboratorCriteria) {
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