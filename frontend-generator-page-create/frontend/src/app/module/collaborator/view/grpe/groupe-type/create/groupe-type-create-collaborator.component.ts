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



import {GroupeTypeCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeTypeCollaborator.service';
import {GroupeTypeDto} from '../../../../shared/model/grpe/GroupeType.model';
import {GroupeTypeCriteria} from '../../../../shared/criteria/grpe/GroupeTypeCriteria.model';

@Component({
  selector: 'app-groupe-type-create-collaborator',
  templateUrl: './groupe-type-create-collaborator.component.html',
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
export class GroupeTypeCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;




   private _validGroupeTypeCode = true;
   private _validGroupeTypeLibelle = true;

	constructor(private alert: FuseAlertService, private service: GroupeTypeCollaboratorService , @Inject(PLATFORM_ID) private platformId? ) {

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
                this.item = new GroupeTypeDto();
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
        this.validGroupeTypeCode = value;
        this.validGroupeTypeLibelle = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateGroupeTypeCode();
        this.validateGroupeTypeLibelle();
    }

    public validateGroupeTypeCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validGroupeTypeCode = false;
        } else {
            this.validGroupeTypeCode = true;
        }
    }
    public validateGroupeTypeLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validGroupeTypeLibelle = false;
        } else {
            this.validGroupeTypeLibelle = true;
        }
    }






    get validGroupeTypeCode(): boolean {
        return this._validGroupeTypeCode;
    }

    set validGroupeTypeCode(value: boolean) {
         this._validGroupeTypeCode = value;
    }
    get validGroupeTypeLibelle(): boolean {
        return this._validGroupeTypeLibelle;
    }

    set validGroupeTypeLibelle(value: boolean) {
         this._validGroupeTypeLibelle = value;
    }



    get items(): Array<GroupeTypeDto> {
        return this.service.items;
    }

    set items(value: Array<GroupeTypeDto>) {
        this.service.items = value;
    }

    get item(): GroupeTypeDto {
        return this.service.item;
    }

    set item(value: GroupeTypeDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): GroupeTypeCriteria {
        return this.service.criteria;
    }

    set criteria(value: GroupeTypeCriteria) {
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
