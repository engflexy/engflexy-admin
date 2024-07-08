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



import {FreeTrialformuleAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialformuleAdmin.service';
import {FreeTrialformuleDto} from '../../../../shared/model/freetrial/FreeTrialformule.model';
import {FreeTrialformuleCriteria} from '../../../../shared/criteria/freetrial/FreeTrialformuleCriteria.model';
import {InscriptionDto} from '../../../../shared/model/grpe/Inscription.model';
import {InscriptionAdminService} from '../../../../shared/service/admin/grpe/InscriptionAdmin.service';

@Component({
  selector: 'app-free-trialformule-create-admin',
  templateUrl: './free-trialformule-create-admin.component.html',
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
export class FreeTrialformuleCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _inscriptionsFilter:  InscriptionDto[];



   private _validFreeTrialformuleCode = true;
    private _validInscriptionNumeroInscription = true;
    private _validInscriptionEtudiant = true;
    private _validInscriptionEtatInscription = true;
    private _validInscriptionParcours = true;
    private _validInscriptionGroupeEtude = true;
    private _validInscriptionGroupeType = true;
    private _validInscriptionStatutSocial = true;
    private _validInscriptionInteretEtudiant = true;
    private _validInscriptionNiveauEtude = true;
    private _validInscriptionFonction = true;
    private _validInscriptionQuiz = true;

	constructor(private alert: FuseAlertService, private service: FreeTrialformuleAdminService , private inscriptionService: InscriptionAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.inscriptionService.findAll().subscribe((data) => {this.inscriptions = data; this._inscriptionsFilter = {...this.inscriptions}});
    }

  displayInscription(item: InscriptionDto): string {
	return item && item.id ? item.id : "";

  }

  filterInscription(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._inscriptionsFilter = this.inscriptions.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._inscriptionsFilter = this.inscriptions
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
                this.item = new FreeTrialformuleDto();
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
        this.validFreeTrialformuleCode = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateFreeTrialformuleCode();
    }

    public validateFreeTrialformuleCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validFreeTrialformuleCode = false;
        } else {
            this.validFreeTrialformuleCode = true;
        }
    }



    get inscription(): InscriptionDto {
        return this.inscriptionService.item;
    }
    set inscription(value: InscriptionDto) {
        this.inscriptionService.item = value;
    }
    get inscriptions(): Array<InscriptionDto> {
        return this.inscriptionService.items;
    }
    set inscriptions(value: Array<InscriptionDto>) {
        this.inscriptionService.items = value;
    }
    get createInscriptionDialog(): boolean {
        return this.inscriptionService.createDialog;
    }
    set createInscriptionDialog(value: boolean) {
        this.inscriptionService.createDialog= value;
    }



    get validFreeTrialformuleCode(): boolean {
        return this._validFreeTrialformuleCode;
    }

    set validFreeTrialformuleCode(value: boolean) {
         this._validFreeTrialformuleCode = value;
    }

    get validInscriptionNumeroInscription(): boolean {
        return this._validInscriptionNumeroInscription;
    }
    set validInscriptionNumeroInscription(value: boolean) {
        this._validInscriptionNumeroInscription = value;
    }
    get validInscriptionEtudiant(): boolean {
        return this._validInscriptionEtudiant;
    }
    set validInscriptionEtudiant(value: boolean) {
        this._validInscriptionEtudiant = value;
    }
    get validInscriptionEtatInscription(): boolean {
        return this._validInscriptionEtatInscription;
    }
    set validInscriptionEtatInscription(value: boolean) {
        this._validInscriptionEtatInscription = value;
    }
    get validInscriptionParcours(): boolean {
        return this._validInscriptionParcours;
    }
    set validInscriptionParcours(value: boolean) {
        this._validInscriptionParcours = value;
    }
    get validInscriptionGroupeEtude(): boolean {
        return this._validInscriptionGroupeEtude;
    }
    set validInscriptionGroupeEtude(value: boolean) {
        this._validInscriptionGroupeEtude = value;
    }
    get validInscriptionGroupeType(): boolean {
        return this._validInscriptionGroupeType;
    }
    set validInscriptionGroupeType(value: boolean) {
        this._validInscriptionGroupeType = value;
    }
    get validInscriptionStatutSocial(): boolean {
        return this._validInscriptionStatutSocial;
    }
    set validInscriptionStatutSocial(value: boolean) {
        this._validInscriptionStatutSocial = value;
    }
    get validInscriptionInteretEtudiant(): boolean {
        return this._validInscriptionInteretEtudiant;
    }
    set validInscriptionInteretEtudiant(value: boolean) {
        this._validInscriptionInteretEtudiant = value;
    }
    get validInscriptionNiveauEtude(): boolean {
        return this._validInscriptionNiveauEtude;
    }
    set validInscriptionNiveauEtude(value: boolean) {
        this._validInscriptionNiveauEtude = value;
    }
    get validInscriptionFonction(): boolean {
        return this._validInscriptionFonction;
    }
    set validInscriptionFonction(value: boolean) {
        this._validInscriptionFonction = value;
    }
    get validInscriptionQuiz(): boolean {
        return this._validInscriptionQuiz;
    }
    set validInscriptionQuiz(value: boolean) {
        this._validInscriptionQuiz = value;
    }


    get items(): Array<FreeTrialformuleDto> {
        return this.service.items;
    }

    set items(value: Array<FreeTrialformuleDto>) {
        this.service.items = value;
    }

    get item(): FreeTrialformuleDto {
        return this.service.item;
    }

    set item(value: FreeTrialformuleDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): FreeTrialformuleCriteria {
        return this.service.criteria;
    }

    set criteria(value: FreeTrialformuleCriteria) {
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
