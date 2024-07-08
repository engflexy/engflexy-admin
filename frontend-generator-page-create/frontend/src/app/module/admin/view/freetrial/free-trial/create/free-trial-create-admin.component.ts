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



import {FreeTrialAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialAdmin.service';
import {FreeTrialDto} from '../../../../shared/model/freetrial/FreeTrial.model';
import {FreeTrialCriteria} from '../../../../shared/criteria/freetrial/FreeTrialCriteria.model';
import {FreeTrialTeacherEmailTemplateDto} from '../../../../shared/model/freetrial/FreeTrialTeacherEmailTemplate.model';
import {FreeTrialTeacherEmailTemplateAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialTeacherEmailTemplateAdmin.service';
import {FreeTrialTeacherWhatsTemplateDto} from '../../../../shared/model/freetrial/FreeTrialTeacherWhatsTemplate.model';
import {FreeTrialTeacherWhatsTemplateAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialTeacherWhatsTemplateAdmin.service';
import {StatutFreeTrialDto} from '../../../../shared/model/freetrial/StatutFreeTrial.model';
import {StatutFreeTrialAdminService} from '../../../../shared/service/admin/freetrial/StatutFreeTrialAdmin.service';
import {FreeTrialConfigurationDto} from '../../../../shared/model/freetrial/FreeTrialConfiguration.model';
import {FreeTrialConfigurationAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialConfigurationAdmin.service';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from '../../../../shared/service/admin/inscription/EtudiantAdmin.service';
import {FreeTrialStudentEmailTemplateDto} from '../../../../shared/model/freetrial/FreeTrialStudentEmailTemplate.model';
import {FreeTrialStudentEmailTemplateAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialStudentEmailTemplateAdmin.service';
import {FreeTrialDetailDto} from '../../../../shared/model/freetrial/FreeTrialDetail.model';
import {FreeTrialDetailAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialDetailAdmin.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfAdminService} from '../../../../shared/service/admin/prof/ProfAdmin.service';
import {NiveauEtudeDto} from '../../../../shared/model/inscriptionref/NiveauEtude.model';
import {NiveauEtudeAdminService} from '../../../../shared/service/admin/inscriptionref/NiveauEtudeAdmin.service';
import {FreeTrialStudentWhatsTemplateDto} from '../../../../shared/model/freetrial/FreeTrialStudentWhatsTemplate.model';
import {FreeTrialStudentWhatsTemplateAdminService} from '../../../../shared/service/admin/freetrial/FreeTrialStudentWhatsTemplateAdmin.service';

@Component({
  selector: 'app-free-trial-create-admin',
  templateUrl: './free-trial-create-admin.component.html',
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
export class FreeTrialCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _profsFilter:  ProfDto[];
  _niveauEtudesFilter:  NiveauEtudeDto[];
  _freeTrialStudentWhatsTemplatesFilter:  FreeTrialStudentWhatsTemplateDto[];
  _freeTrialStudentEmailTemplatesFilter:  FreeTrialStudentEmailTemplateDto[];
  _freeTrialTeacherEmailTemplatesFilter:  FreeTrialTeacherEmailTemplateDto[];
  _freeTrialTeacherWhatsTemplatesFilter:  FreeTrialTeacherWhatsTemplateDto[];
  _freeTrialConfigurationsFilter:  FreeTrialConfigurationDto[];
  _statutFreeTrialsFilter:  StatutFreeTrialDto[];

    private _freeTrialDetailsElement = new FreeTrialDetailDto();


   private _validFreeTrialReference = true;
    private _validProfRef = true;
    private _validNiveauEtudeLibelle = true;
    private _validNiveauEtudeCode = true;
    private _validStatutFreeTrialLibelle = true;
    private _validStatutFreeTrialCode = true;

	constructor(private alert: FuseAlertService, private service: FreeTrialAdminService , private freeTrialTeacherEmailTemplateService: FreeTrialTeacherEmailTemplateAdminService, private freeTrialTeacherWhatsTemplateService: FreeTrialTeacherWhatsTemplateAdminService, private statutFreeTrialService: StatutFreeTrialAdminService, private freeTrialConfigurationService: FreeTrialConfigurationAdminService, private etudiantService: EtudiantAdminService, private freeTrialStudentEmailTemplateService: FreeTrialStudentEmailTemplateAdminService, private freeTrialDetailService: FreeTrialDetailAdminService, private profService: ProfAdminService, private niveauEtudeService: NiveauEtudeAdminService, private freeTrialStudentWhatsTemplateService: FreeTrialStudentWhatsTemplateAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.freeTrialDetailsElement.etudiant = new EtudiantDto();
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
        this.profService.findAll().subscribe((data) => {this.profs = data; this._profsFilter = {...this.profs}});
        this.niveauEtudeService.findAll().subscribe((data) => {this.niveauEtudes = data; this._niveauEtudesFilter = {...this.niveauEtudes}});
        this.freeTrialStudentWhatsTemplateService.findAll().subscribe((data) => {this.freeTrialStudentWhatsTemplates = data; this._freeTrialStudentWhatsTemplatesFilter = {...this.freeTrialStudentWhatsTemplates}});
        this.freeTrialStudentEmailTemplateService.findAll().subscribe((data) => {this.freeTrialStudentEmailTemplates = data; this._freeTrialStudentEmailTemplatesFilter = {...this.freeTrialStudentEmailTemplates}});
        this.freeTrialTeacherEmailTemplateService.findAll().subscribe((data) => {this.freeTrialTeacherEmailTemplates = data; this._freeTrialTeacherEmailTemplatesFilter = {...this.freeTrialTeacherEmailTemplates}});
        this.freeTrialTeacherWhatsTemplateService.findAll().subscribe((data) => {this.freeTrialTeacherWhatsTemplates = data; this._freeTrialTeacherWhatsTemplatesFilter = {...this.freeTrialTeacherWhatsTemplates}});
        this.freeTrialConfigurationService.findAll().subscribe((data) => {this.freeTrialConfigurations = data; this._freeTrialConfigurationsFilter = {...this.freeTrialConfigurations}});
        this.statutFreeTrialService.findAll().subscribe((data) => {this.statutFreeTrials = data; this._statutFreeTrialsFilter = {...this.statutFreeTrials}});
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
  displayNiveauEtude(item: NiveauEtudeDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterNiveauEtude(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._niveauEtudesFilter = this.niveauEtudes.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._niveauEtudesFilter = this.niveauEtudes
	}
 }
  displayFreeTrialStudentWhatsTemplate(item: FreeTrialStudentWhatsTemplateDto): string {
	return item && item.id ? item.id : "";

  }

  filterFreeTrialStudentWhatsTemplate(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._freeTrialStudentWhatsTemplatesFilter = this.freeTrialStudentWhatsTemplates.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._freeTrialStudentWhatsTemplatesFilter = this.freeTrialStudentWhatsTemplates
	}
 }
  displayFreeTrialStudentEmailTemplate(item: FreeTrialStudentEmailTemplateDto): string {
	return item && item.id ? item.id : "";

  }

  filterFreeTrialStudentEmailTemplate(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._freeTrialStudentEmailTemplatesFilter = this.freeTrialStudentEmailTemplates.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._freeTrialStudentEmailTemplatesFilter = this.freeTrialStudentEmailTemplates
	}
 }
  displayFreeTrialTeacherEmailTemplate(item: FreeTrialTeacherEmailTemplateDto): string {
	return item && item.id ? item.id : "";

  }

  filterFreeTrialTeacherEmailTemplate(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._freeTrialTeacherEmailTemplatesFilter = this.freeTrialTeacherEmailTemplates.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._freeTrialTeacherEmailTemplatesFilter = this.freeTrialTeacherEmailTemplates
	}
 }
  displayFreeTrialTeacherWhatsTemplate(item: FreeTrialTeacherWhatsTemplateDto): string {
	return item && item.id ? item.id : "";

  }

  filterFreeTrialTeacherWhatsTemplate(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._freeTrialTeacherWhatsTemplatesFilter = this.freeTrialTeacherWhatsTemplates.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._freeTrialTeacherWhatsTemplatesFilter = this.freeTrialTeacherWhatsTemplates
	}
 }
  displayFreeTrialConfiguration(item: FreeTrialConfigurationDto): string {
	return item && item.id ? item.id : "";

  }

  filterFreeTrialConfiguration(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._freeTrialConfigurationsFilter = this.freeTrialConfigurations.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._freeTrialConfigurationsFilter = this.freeTrialConfigurations
	}
 }
  displayStatutFreeTrial(item: StatutFreeTrialDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterStatutFreeTrial(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._statutFreeTrialsFilter = this.statutFreeTrials.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._statutFreeTrialsFilter = this.statutFreeTrials
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
                this.item = new FreeTrialDto();
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



    validateFreeTrialDetails(){
        this.errorMessages = new Array();
    }


    public  setValidation(value: boolean){
        this.validFreeTrialReference = value;
    }

    public addFreeTrialDetails() {
        if( this.item.freeTrialDetails == null )
            this.item.freeTrialDetails = new Array<FreeTrialDetailDto>();
       this.validateFreeTrialDetails();
       if (this.errorMessages.length === 0) {
              this.item.freeTrialDetails.push({... this.freeTrialDetailsElement});
              this.freeTrialDetailsElement = new FreeTrialDetailDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletefreeTrialDetails(p: FreeTrialDetailDto) {
        this.item.freeTrialDetails.forEach((element, index) => {
            if (element === p) { this.item.freeTrialDetails.splice(index, 1); }
        });
    }

    public editfreeTrialDetails(p: FreeTrialDetailDto) {
        this.freeTrialDetailsElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateFreeTrialReference();
    }

    public validateFreeTrialReference(){
        if (this.stringUtilService.isEmpty(this.item.reference)) {
        this.errorMessages.push('Reference non valide');
        this.validFreeTrialReference = false;
        } else {
            this.validFreeTrialReference = true;
        }
    }


    public async openCreateFreeTrialTeacherWhatsTemplate(freeTrialTeacherWhatsTemplate: string) {
    const isPermistted = await this.roleService.isPermitted('FreeTrialTeacherWhatsTemplate', 'add');
    if(isPermistted) {
         this.freeTrialTeacherWhatsTemplate = new FreeTrialTeacherWhatsTemplateDto();
         this.createFreeTrialTeacherWhatsTemplateDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }
    public async openCreateFreeTrialStudentEmailTemplate(freeTrialStudentEmailTemplate: string) {
    const isPermistted = await this.roleService.isPermitted('FreeTrialStudentEmailTemplate', 'add');
    if(isPermistted) {
         this.freeTrialStudentEmailTemplate = new FreeTrialStudentEmailTemplateDto();
         this.createFreeTrialStudentEmailTemplateDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }
    public async openCreateFreeTrialConfiguration(freeTrialConfiguration: string) {
    const isPermistted = await this.roleService.isPermitted('FreeTrialConfiguration', 'add');
    if(isPermistted) {
         this.freeTrialConfiguration = new FreeTrialConfigurationDto();
         this.createFreeTrialConfigurationDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }
    public async openCreateFreeTrialStudentWhatsTemplate(freeTrialStudentWhatsTemplate: string) {
    const isPermistted = await this.roleService.isPermitted('FreeTrialStudentWhatsTemplate', 'add');
    if(isPermistted) {
         this.freeTrialStudentWhatsTemplate = new FreeTrialStudentWhatsTemplateDto();
         this.createFreeTrialStudentWhatsTemplateDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }
    public async openCreateStatutFreeTrial(statutFreeTrial: string) {
    const isPermistted = await this.roleService.isPermitted('StatutFreeTrial', 'add');
    if(isPermistted) {
         this.statutFreeTrial = new StatutFreeTrialDto();
         this.createStatutFreeTrialDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }
    public async openCreateFreeTrialTeacherEmailTemplate(freeTrialTeacherEmailTemplate: string) {
    const isPermistted = await this.roleService.isPermitted('FreeTrialTeacherEmailTemplate', 'add');
    if(isPermistted) {
         this.freeTrialTeacherEmailTemplate = new FreeTrialTeacherEmailTemplateDto();
         this.createFreeTrialTeacherEmailTemplateDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get freeTrialTeacherWhatsTemplate(): FreeTrialTeacherWhatsTemplateDto {
        return this.freeTrialTeacherWhatsTemplateService.item;
    }
    set freeTrialTeacherWhatsTemplate(value: FreeTrialTeacherWhatsTemplateDto) {
        this.freeTrialTeacherWhatsTemplateService.item = value;
    }
    get freeTrialTeacherWhatsTemplates(): Array<FreeTrialTeacherWhatsTemplateDto> {
        return this.freeTrialTeacherWhatsTemplateService.items;
    }
    set freeTrialTeacherWhatsTemplates(value: Array<FreeTrialTeacherWhatsTemplateDto>) {
        this.freeTrialTeacherWhatsTemplateService.items = value;
    }
    get createFreeTrialTeacherWhatsTemplateDialog(): boolean {
        return this.freeTrialTeacherWhatsTemplateService.createDialog;
    }
    set createFreeTrialTeacherWhatsTemplateDialog(value: boolean) {
        this.freeTrialTeacherWhatsTemplateService.createDialog= value;
    }
    get freeTrialStudentEmailTemplate(): FreeTrialStudentEmailTemplateDto {
        return this.freeTrialStudentEmailTemplateService.item;
    }
    set freeTrialStudentEmailTemplate(value: FreeTrialStudentEmailTemplateDto) {
        this.freeTrialStudentEmailTemplateService.item = value;
    }
    get freeTrialStudentEmailTemplates(): Array<FreeTrialStudentEmailTemplateDto> {
        return this.freeTrialStudentEmailTemplateService.items;
    }
    set freeTrialStudentEmailTemplates(value: Array<FreeTrialStudentEmailTemplateDto>) {
        this.freeTrialStudentEmailTemplateService.items = value;
    }
    get createFreeTrialStudentEmailTemplateDialog(): boolean {
        return this.freeTrialStudentEmailTemplateService.createDialog;
    }
    set createFreeTrialStudentEmailTemplateDialog(value: boolean) {
        this.freeTrialStudentEmailTemplateService.createDialog= value;
    }
    get freeTrialConfiguration(): FreeTrialConfigurationDto {
        return this.freeTrialConfigurationService.item;
    }
    set freeTrialConfiguration(value: FreeTrialConfigurationDto) {
        this.freeTrialConfigurationService.item = value;
    }
    get freeTrialConfigurations(): Array<FreeTrialConfigurationDto> {
        return this.freeTrialConfigurationService.items;
    }
    set freeTrialConfigurations(value: Array<FreeTrialConfigurationDto>) {
        this.freeTrialConfigurationService.items = value;
    }
    get createFreeTrialConfigurationDialog(): boolean {
        return this.freeTrialConfigurationService.createDialog;
    }
    set createFreeTrialConfigurationDialog(value: boolean) {
        this.freeTrialConfigurationService.createDialog= value;
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
    get niveauEtude(): NiveauEtudeDto {
        return this.niveauEtudeService.item;
    }
    set niveauEtude(value: NiveauEtudeDto) {
        this.niveauEtudeService.item = value;
    }
    get niveauEtudes(): Array<NiveauEtudeDto> {
        return this.niveauEtudeService.items;
    }
    set niveauEtudes(value: Array<NiveauEtudeDto>) {
        this.niveauEtudeService.items = value;
    }
    get createNiveauEtudeDialog(): boolean {
        return this.niveauEtudeService.createDialog;
    }
    set createNiveauEtudeDialog(value: boolean) {
        this.niveauEtudeService.createDialog= value;
    }
    get freeTrialStudentWhatsTemplate(): FreeTrialStudentWhatsTemplateDto {
        return this.freeTrialStudentWhatsTemplateService.item;
    }
    set freeTrialStudentWhatsTemplate(value: FreeTrialStudentWhatsTemplateDto) {
        this.freeTrialStudentWhatsTemplateService.item = value;
    }
    get freeTrialStudentWhatsTemplates(): Array<FreeTrialStudentWhatsTemplateDto> {
        return this.freeTrialStudentWhatsTemplateService.items;
    }
    set freeTrialStudentWhatsTemplates(value: Array<FreeTrialStudentWhatsTemplateDto>) {
        this.freeTrialStudentWhatsTemplateService.items = value;
    }
    get createFreeTrialStudentWhatsTemplateDialog(): boolean {
        return this.freeTrialStudentWhatsTemplateService.createDialog;
    }
    set createFreeTrialStudentWhatsTemplateDialog(value: boolean) {
        this.freeTrialStudentWhatsTemplateService.createDialog= value;
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
    get statutFreeTrial(): StatutFreeTrialDto {
        return this.statutFreeTrialService.item;
    }
    set statutFreeTrial(value: StatutFreeTrialDto) {
        this.statutFreeTrialService.item = value;
    }
    get statutFreeTrials(): Array<StatutFreeTrialDto> {
        return this.statutFreeTrialService.items;
    }
    set statutFreeTrials(value: Array<StatutFreeTrialDto>) {
        this.statutFreeTrialService.items = value;
    }
    get createStatutFreeTrialDialog(): boolean {
        return this.statutFreeTrialService.createDialog;
    }
    set createStatutFreeTrialDialog(value: boolean) {
        this.statutFreeTrialService.createDialog= value;
    }
    get freeTrialTeacherEmailTemplate(): FreeTrialTeacherEmailTemplateDto {
        return this.freeTrialTeacherEmailTemplateService.item;
    }
    set freeTrialTeacherEmailTemplate(value: FreeTrialTeacherEmailTemplateDto) {
        this.freeTrialTeacherEmailTemplateService.item = value;
    }
    get freeTrialTeacherEmailTemplates(): Array<FreeTrialTeacherEmailTemplateDto> {
        return this.freeTrialTeacherEmailTemplateService.items;
    }
    set freeTrialTeacherEmailTemplates(value: Array<FreeTrialTeacherEmailTemplateDto>) {
        this.freeTrialTeacherEmailTemplateService.items = value;
    }
    get createFreeTrialTeacherEmailTemplateDialog(): boolean {
        return this.freeTrialTeacherEmailTemplateService.createDialog;
    }
    set createFreeTrialTeacherEmailTemplateDialog(value: boolean) {
        this.freeTrialTeacherEmailTemplateService.createDialog= value;
    }



    get validFreeTrialReference(): boolean {
        return this._validFreeTrialReference;
    }

    set validFreeTrialReference(value: boolean) {
         this._validFreeTrialReference = value;
    }

    get validProfRef(): boolean {
        return this._validProfRef;
    }
    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }
    get validNiveauEtudeLibelle(): boolean {
        return this._validNiveauEtudeLibelle;
    }
    set validNiveauEtudeLibelle(value: boolean) {
        this._validNiveauEtudeLibelle = value;
    }
    get validNiveauEtudeCode(): boolean {
        return this._validNiveauEtudeCode;
    }
    set validNiveauEtudeCode(value: boolean) {
        this._validNiveauEtudeCode = value;
    }
    get validStatutFreeTrialLibelle(): boolean {
        return this._validStatutFreeTrialLibelle;
    }
    set validStatutFreeTrialLibelle(value: boolean) {
        this._validStatutFreeTrialLibelle = value;
    }
    get validStatutFreeTrialCode(): boolean {
        return this._validStatutFreeTrialCode;
    }
    set validStatutFreeTrialCode(value: boolean) {
        this._validStatutFreeTrialCode = value;
    }

    get freeTrialDetailsElement(): FreeTrialDetailDto {
        if( this._freeTrialDetailsElement == null )
            this._freeTrialDetailsElement = new FreeTrialDetailDto();
        return this._freeTrialDetailsElement;
    }

    set freeTrialDetailsElement(value: FreeTrialDetailDto) {
        this._freeTrialDetailsElement = value;
    }

    get items(): Array<FreeTrialDto> {
        return this.service.items;
    }

    set items(value: Array<FreeTrialDto>) {
        this.service.items = value;
    }

    get item(): FreeTrialDto {
        return this.service.item;
    }

    set item(value: FreeTrialDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): FreeTrialCriteria {
        return this.service.criteria;
    }

    set criteria(value: FreeTrialCriteria) {
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
