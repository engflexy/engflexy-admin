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



import {FreeTrialDetailAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialDetailAdmin.service';
import {FreeTrialDetailDto} from '../../../../shared/model/freetrial/FreeTrialDetail.model';
import {FreeTrialDetailCriteria} from '../../../../shared/criteria/freetrial/FreeTrialDetailCriteria.model';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from '../../../../shared/service/admin/inscription/EtudiantAdmin.service';
import {FreeTrialDto} from '../../../../shared/model/freetrial/FreeTrial.model';
import {FreeTrialAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialAdmin.service';

@Component({
  selector: 'app-free-trial-detail-create-admin',
  templateUrl: './free-trial-detail-create-admin.component.html',
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
export class FreeTrialDetailCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _freeTrialsFilter:  FreeTrialDto[];
  _etudiantsFilter:  EtudiantDto[];



    private _validFreeTrialReference = true;

	constructor(private alert: FuseAlertService, private service: FreeTrialDetailAdminService , private etudiantService: EtudiantAdminService, private freeTrialService: FreeTrialAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.freeTrialService.findAll().subscribe((data) => {this.freeTrials = data; this._freeTrialsFilter = {...this.freeTrials}});
        this.etudiantService.findAll().subscribe((data) => {this.etudiants = data; this._etudiantsFilter = {...this.etudiants}});
    }

  displayFreeTrial(item: FreeTrialDto): string {
	return item && item.reference ? item.reference : "";

  }

  filterFreeTrial(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._freeTrialsFilter = this.freeTrials.filter(s =>
			s.reference?.toLowerCase()?.includes(value)
		)
	} else {
		this._freeTrialsFilter = this.freeTrials
	}
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
                this.item = new FreeTrialDetailDto();
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
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
    }



    public async openCreateFreeTrial(freeTrial: string) {
    const isPermistted = await this.roleService.isPermitted('FreeTrial', 'add');
    if(isPermistted) {
         this.freeTrial = new FreeTrialDto();
         this.createFreeTrialDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get freeTrial(): FreeTrialDto {
        return this.freeTrialService.item;
    }
    set freeTrial(value: FreeTrialDto) {
        this.freeTrialService.item = value;
    }
    get freeTrials(): Array<FreeTrialDto> {
        return this.freeTrialService.items;
    }
    set freeTrials(value: Array<FreeTrialDto>) {
        this.freeTrialService.items = value;
    }
    get createFreeTrialDialog(): boolean {
        return this.freeTrialService.createDialog;
    }
    set createFreeTrialDialog(value: boolean) {
        this.freeTrialService.createDialog= value;
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




    get validFreeTrialReference(): boolean {
        return this._validFreeTrialReference;
    }
    set validFreeTrialReference(value: boolean) {
        this._validFreeTrialReference = value;
    }


    get items(): Array<FreeTrialDetailDto> {
        return this.service.items;
    }

    set items(value: Array<FreeTrialDetailDto>) {
        this.service.items = value;
    }

    get item(): FreeTrialDetailDto {
        return this.service.item;
    }

    set item(value: FreeTrialDetailDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): FreeTrialDetailCriteria {
        return this.service.criteria;
    }

    set criteria(value: FreeTrialDetailCriteria) {
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
