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



import {CollaboratorAdminService} from '../../../../shared/service/admin/vocab/CollaboratorAdmin.service';
import {CollaboratorDto} from '../../../../shared/model/vocab/Collaborator.model';
import {CollaboratorCriteria} from '../../../../shared/criteria/vocab/CollaboratorCriteria.model';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursAdminService} from '../../../../shared/service/admin/course/ParcoursAdmin.service';
import {CoursDto} from '../../../../shared/model/course/Cours.model';
import {CoursAdminService} from '../../../../shared/service/admin/course/CoursAdmin.service';

@Component({
  selector: 'app-collaborator-create-admin',
  templateUrl: './collaborator-create-admin.component.html',
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
export class CollaboratorCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;


    private _parcourssElement = new ParcoursDto();


    private _validParcourssCode = true;
    private _validParcourssLibelle = true;

	constructor(private alert: FuseAlertService, private service: CollaboratorAdminService , private parcoursService: ParcoursAdminService, @Inject(PLATFORM_ID) private platformId? ) {

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
                this.item = new CollaboratorDto();
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



    validateParcourss(){
        this.errorMessages = new Array();
        this.validateParcourssCode();
        this.validateParcourssLibelle();
    }


    public  setValidation(value: boolean){
        this.validParcourssCode = value;
        this.validParcourssLibelle = value;
    }

    public addParcourss() {
        if( this.item.parcourss == null )
            this.item.parcourss = new Array<ParcoursDto>();
       this.validateParcourss();
       if (this.errorMessages.length === 0) {
              this.item.parcourss.push({... this.parcourssElement});
              this.parcourssElement = new ParcoursDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deleteparcourss(p: ParcoursDto) {
        this.item.parcourss.forEach((element, index) => {
            if (element === p) { this.item.parcourss.splice(index, 1); }
        });
    }

    public editparcourss(p: ParcoursDto) {
        this.parcourssElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
    }


    public validateParcourssCode(){
        if (this.parcourssElement.code == null) {
            this.errorMessages.push('Code de la parcours est  invalide');
            this.validParcourssCode = false;
        } else {
            this.validParcourssCode = true;
        }
    }
    public validateParcourssLibelle(){
        if (this.parcourssElement.libelle == null) {
            this.errorMessages.push('Libelle de la parcours est  invalide');
            this.validParcourssLibelle = false;
        } else {
            this.validParcourssLibelle = true;
        }
    }






    get validParcourssCode(): boolean {
        return this._validParcourssCode;
    }
    set validParcourssCode(value: boolean) {
        this._validParcourssCode = value;
    }
    get validParcourssLibelle(): boolean {
        return this._validParcourssLibelle;
    }
    set validParcourssLibelle(value: boolean) {
        this._validParcourssLibelle = value;
    }

    get parcourssElement(): ParcoursDto {
        if( this._parcourssElement == null )
            this._parcourssElement = new ParcoursDto();
        return this._parcourssElement;
    }

    set parcourssElement(value: ParcoursDto) {
        this._parcourssElement = value;
    }

    get items(): Array<CollaboratorDto> {
        return this.service.items;
    }

    set items(value: Array<CollaboratorDto>) {
        this.service.items = value;
    }

    get item(): CollaboratorDto {
        return this.service.item;
    }

    set item(value: CollaboratorDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): CollaboratorCriteria {
        return this.service.criteria;
    }

    set criteria(value: CollaboratorCriteria) {
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
