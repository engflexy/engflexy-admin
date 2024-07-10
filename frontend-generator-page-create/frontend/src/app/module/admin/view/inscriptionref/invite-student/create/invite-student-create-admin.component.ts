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



import {InviteStudentAdminService} from '../../../../shared/service/admin/inscriptionref/InviteStudentAdmin.service';
import {InviteStudentDto} from '../../../../shared/model/inscriptionref/InviteStudent.model';
import {InviteStudentCriteria} from '../../../../shared/criteria/inscriptionref/InviteStudentCriteria.model';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from '../../../../shared/service/admin/inscription/EtudiantAdmin.service';

@Component({
  selector: 'app-invite-student-create-admin',
  templateUrl: './invite-student-create-admin.component.html',
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
export class InviteStudentCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _etudiantsFilter:  EtudiantDto[];



   private _validInviteStudentCode = true;

	constructor(private alert: FuseAlertService, private service: InviteStudentAdminService , private etudiantService: EtudiantAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.etudiantService.findAll().subscribe((data) => {this.etudiants = data; this._etudiantsFilter = {...this.etudiants}});
    }

  displayEtudiant(item: EtudiantDto): string {
	return item && item.id ? item.id : "";

  }

  filterEtudiant(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._etudiantsFilter = this.etudiants.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._etudiantsFilter = this.etudiants
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
                this.item = new InviteStudentDto();
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
        this.validInviteStudentCode = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateInviteStudentCode();
    }

    public validateInviteStudentCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validInviteStudentCode = false;
        } else {
            this.validInviteStudentCode = true;
        }
    }



    get etudiant(): EtudiantDto {
        return this.etudiantService.item;
    }
    set etudiant(value: EtudiantDto) {
        this.etudiantService.item = value;
    }
    get etudiants(): Array<EtudiantDto> {
        return this.etudiantService.items;
    }
    set etudiants(value: Array<EtudiantDto>) {
        this.etudiantService.items = value;
    }
    get createEtudiantDialog(): boolean {
        return this.etudiantService.createDialog;
    }
    set createEtudiantDialog(value: boolean) {
        this.etudiantService.createDialog= value;
    }



    get validInviteStudentCode(): boolean {
        return this._validInviteStudentCode;
    }

    set validInviteStudentCode(value: boolean) {
         this._validInviteStudentCode = value;
    }



    get items(): Array<InviteStudentDto> {
        return this.service.items;
    }

    set items(value: Array<InviteStudentDto>) {
        this.service.items = value;
    }

    get item(): InviteStudentDto {
        return this.service.item;
    }

    set item(value: InviteStudentDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): InviteStudentCriteria {
        return this.service.criteria;
    }

    set criteria(value: InviteStudentCriteria) {
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
