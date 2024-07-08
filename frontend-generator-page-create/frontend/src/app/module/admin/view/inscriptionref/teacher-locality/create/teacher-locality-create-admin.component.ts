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



import {TeacherLocalityAdminService} from '../../../../shared/service/admin/inscriptionref/TeacherLocalityAdmin.service';
import {TeacherLocalityDto} from '../../../../shared/model/inscriptionref/TeacherLocality.model';
import {TeacherLocalityCriteria} from '../../../../shared/criteria/inscriptionref/TeacherLocalityCriteria.model';

@Component({
  selector: 'app-teacher-locality-create-admin',
  templateUrl: './teacher-locality-create-admin.component.html',
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
export class TeacherLocalityCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;




   private _validTeacherLocalityCode = true;
   private _validTeacherLocalityLibelle = true;

	constructor(private alert: FuseAlertService, private service: TeacherLocalityAdminService , @Inject(PLATFORM_ID) private platformId? ) {

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
                this.item = new TeacherLocalityDto();
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
        this.validTeacherLocalityCode = value;
        this.validTeacherLocalityLibelle = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateTeacherLocalityCode();
        this.validateTeacherLocalityLibelle();
    }

    public validateTeacherLocalityCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validTeacherLocalityCode = false;
        } else {
            this.validTeacherLocalityCode = true;
        }
    }
    public validateTeacherLocalityLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validTeacherLocalityLibelle = false;
        } else {
            this.validTeacherLocalityLibelle = true;
        }
    }






    get validTeacherLocalityCode(): boolean {
        return this._validTeacherLocalityCode;
    }

    set validTeacherLocalityCode(value: boolean) {
         this._validTeacherLocalityCode = value;
    }
    get validTeacherLocalityLibelle(): boolean {
        return this._validTeacherLocalityLibelle;
    }

    set validTeacherLocalityLibelle(value: boolean) {
         this._validTeacherLocalityLibelle = value;
    }



    get items(): Array<TeacherLocalityDto> {
        return this.service.items;
    }

    set items(value: Array<TeacherLocalityDto>) {
        this.service.items = value;
    }

    get item(): TeacherLocalityDto {
        return this.service.item;
    }

    set item(value: TeacherLocalityDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): TeacherLocalityCriteria {
        return this.service.criteria;
    }

    set criteria(value: TeacherLocalityCriteria) {
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
