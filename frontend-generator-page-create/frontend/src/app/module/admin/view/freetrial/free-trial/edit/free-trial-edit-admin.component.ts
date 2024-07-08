import {Component, OnInit, Input} from '@angular/core';
import {ConfirmationService, MessageService} from 'primeng/api';
import {FileTempDto} from 'src/app/zynerator/dto/FileTempDto.model';
import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';

import {environment} from 'src/environments/environment';

import {RoleService} from 'src/app/zynerator/security/shared/service/Role.service';
import {StringUtilService} from 'src/app/zynerator/util/StringUtil.service';
import {ServiceLocator} from 'src/app/zynerator/service/ServiceLocator';




import {FreeTrialAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialAdmin.service';
import {FreeTrialDto} from 'src/app/shared/model/freetrial/FreeTrial.model';
import {FreeTrialCriteria} from 'src/app/shared/criteria/freetrial/FreeTrialCriteria.model';


import {FreeTrialTeacherEmailTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialTeacherEmailTemplate.model';
import {FreeTrialTeacherEmailTemplateAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialTeacherEmailTemplateAdmin.service';
import {FreeTrialTeacherWhatsTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialTeacherWhatsTemplate.model';
import {FreeTrialTeacherWhatsTemplateAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialTeacherWhatsTemplateAdmin.service';
import {StatutFreeTrialDto} from 'src/app/shared/model/freetrial/StatutFreeTrial.model';
import {StatutFreeTrialAdminService} from 'src/app/shared/service/admin/freetrial/StatutFreeTrialAdmin.service';
import {FreeTrialConfigurationDto} from 'src/app/shared/model/freetrial/FreeTrialConfiguration.model';
import {FreeTrialConfigurationAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialConfigurationAdmin.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {FreeTrialStudentEmailTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialStudentEmailTemplate.model';
import {FreeTrialStudentEmailTemplateAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialStudentEmailTemplateAdmin.service';
import {FreeTrialDetailDto} from 'src/app/shared/model/freetrial/FreeTrialDetail.model';
import {FreeTrialDetailAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialDetailAdmin.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfAdminService} from 'src/app/shared/service/admin/prof/ProfAdmin.service';
import {NiveauEtudeDto} from 'src/app/shared/model/inscriptionref/NiveauEtude.model';
import {NiveauEtudeAdminService} from 'src/app/shared/service/admin/inscriptionref/NiveauEtudeAdmin.service';
import {FreeTrialStudentWhatsTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialStudentWhatsTemplate.model';
import {FreeTrialStudentWhatsTemplateAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialStudentWhatsTemplateAdmin.service';

@Component({
  selector: 'app-free-trial-edit-admin',
  templateUrl: './free-trial-edit-admin.component.html'
})
export class FreeTrialEditAdminComponent implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();


    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;
    private _file: any;
    private _files: any;


    private _freeTrialDetailsElement = new FreeTrialDetailDto();

    private _validFreeTrialReference = true;

    private _validProfRef = true;
    private _validNiveauEtudeLibelle = true;
    private _validNiveauEtudeCode = true;
    private _validStatutFreeTrialLibelle = true;
    private _validStatutFreeTrialCode = true;



    constructor(private service: FreeTrialAdminService , private freeTrialTeacherEmailTemplateService: FreeTrialTeacherEmailTemplateAdminService, private freeTrialTeacherWhatsTemplateService: FreeTrialTeacherWhatsTemplateAdminService, private statutFreeTrialService: StatutFreeTrialAdminService, private freeTrialConfigurationService: FreeTrialConfigurationAdminService, private etudiantService: EtudiantAdminService, private freeTrialStudentEmailTemplateService: FreeTrialStudentEmailTemplateAdminService, private freeTrialDetailService: FreeTrialDetailAdminService, private profService: ProfAdminService, private niveauEtudeService: NiveauEtudeAdminService, private freeTrialStudentWhatsTemplateService: FreeTrialStudentWhatsTemplateAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.freeTrialDetailsElement.etudiant = new EtudiantDto();
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);

        this.profService.findAll().subscribe((data) => this.profs = data);
        this.niveauEtudeService.findAll().subscribe((data) => this.niveauEtudes = data);
        this.freeTrialStudentWhatsTemplateService.findAll().subscribe((data) => this.freeTrialStudentWhatsTemplates = data);
        this.freeTrialStudentEmailTemplateService.findAll().subscribe((data) => this.freeTrialStudentEmailTemplates = data);
        this.freeTrialTeacherEmailTemplateService.findAll().subscribe((data) => this.freeTrialTeacherEmailTemplates = data);
        this.freeTrialTeacherWhatsTemplateService.findAll().subscribe((data) => this.freeTrialTeacherWhatsTemplates = data);
        this.freeTrialConfigurationService.findAll().subscribe((data) => this.freeTrialConfigurations = data);
        this.statutFreeTrialService.findAll().subscribe((data) => this.statutFreeTrials = data);
    }

    public prepareEdit() {
        this.item.dateFreeTrial = this.service.format(this.item.dateFreeTrial);
        this.item.emailTeacherSendingDate = this.service.format(this.item.emailTeacherSendingDate);
        this.item.whatsTeacherSendingDate = this.service.format(this.item.whatsTeacherSendingDate);
        this.item.dateFreeTrialPremierRappel = this.service.format(this.item.dateFreeTrialPremierRappel);
        this.item.dateFreeTrialPremierDeuxiemeRappel = this.service.format(this.item.dateFreeTrialPremierDeuxiemeRappel);
    }



 public edit(): void {
        this.submitted = true;
        this.prepareEdit();
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.editWithShowOption(false);
        } else {
            this.messageService.add({
                severity: 'error',
                summary: 'Erreurs',
                detail: 'Merci de corrigé les erreurs sur le formulaire'
            });
        }
    }

    public editWithShowOption(showList: boolean) {
        this.service.edit().subscribe(religion=>{
            const myIndex = this.items.findIndex(e => e.id === this.item.id);
            this.items[myIndex] = religion;
            this.editDialog = false;
            this.submitted = false;
            this.item = new FreeTrialDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateFreeTrialDetails(){
        this.errorMessages = new Array();
    }

    public setValidation(value: boolean){
        this.validFreeTrialReference = value;
    }

   public addFreeTrialDetails() {
        if( this.item.freeTrialDetails == null )
            this.item.freeTrialDetails = new Array<FreeTrialDetailDto>();
       this.validateFreeTrialDetails();
       if (this.errorMessages.length === 0) {
            if(this.freeTrialDetailsElement.id == null){
                this.item.freeTrialDetails.push(this.freeTrialDetailsElement);
            }else{
                const index = this.item.freeTrialDetails.findIndex(e => e.id == this.freeTrialDetailsElement.id);
                this.item.freeTrialDetails[index] = this.freeTrialDetailsElement;
            }
          this.freeTrialDetailsElement = new FreeTrialDetailDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteFreeTrialDetails(p: FreeTrialDetailDto) {
        this.item.freeTrialDetails.forEach((element, index) => {
            if (element === p) { this.item.freeTrialDetails.splice(index, 1); }
        });
    }

    public editFreeTrialDetails(p: FreeTrialDetailDto) {
        this.freeTrialDetailsElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
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
        const isPermistted = await this.roleService.isPermitted('FreeTrialTeacherWhatsTemplate', 'edit');
        if (isPermistted) {
             this.freeTrialTeacherWhatsTemplate = new FreeTrialTeacherWhatsTemplateDto();
             this.createFreeTrialTeacherWhatsTemplateDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }
   public async openCreateFreeTrialStudentEmailTemplate(freeTrialStudentEmailTemplate: string) {
        const isPermistted = await this.roleService.isPermitted('FreeTrialStudentEmailTemplate', 'edit');
        if (isPermistted) {
             this.freeTrialStudentEmailTemplate = new FreeTrialStudentEmailTemplateDto();
             this.createFreeTrialStudentEmailTemplateDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }
   public async openCreateFreeTrialConfiguration(freeTrialConfiguration: string) {
        const isPermistted = await this.roleService.isPermitted('FreeTrialConfiguration', 'edit');
        if (isPermistted) {
             this.freeTrialConfiguration = new FreeTrialConfigurationDto();
             this.createFreeTrialConfigurationDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }
   public async openCreateFreeTrialStudentWhatsTemplate(freeTrialStudentWhatsTemplate: string) {
        const isPermistted = await this.roleService.isPermitted('FreeTrialStudentWhatsTemplate', 'edit');
        if (isPermistted) {
             this.freeTrialStudentWhatsTemplate = new FreeTrialStudentWhatsTemplateDto();
             this.createFreeTrialStudentWhatsTemplateDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }
   public async openCreateStatutFreeTrial(statutFreeTrial: string) {
        const isPermistted = await this.roleService.isPermitted('StatutFreeTrial', 'edit');
        if (isPermistted) {
             this.statutFreeTrial = new StatutFreeTrialDto();
             this.createStatutFreeTrialDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }
   public async openCreateFreeTrialTeacherEmailTemplate(freeTrialTeacherEmailTemplate: string) {
        const isPermistted = await this.roleService.isPermitted('FreeTrialTeacherEmailTemplate', 'edit');
        if (isPermistted) {
             this.freeTrialTeacherEmailTemplate = new FreeTrialTeacherEmailTemplateDto();
             this.createFreeTrialTeacherEmailTemplateDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
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

    get freeTrialDetailsElement(): FreeTrialDetailDto {
        if( this._freeTrialDetailsElement == null )
            this._freeTrialDetailsElement = new FreeTrialDetailDto();
         return this._freeTrialDetailsElement;
    }

    set freeTrialDetailsElement(value: FreeTrialDetailDto) {
        this._freeTrialDetailsElement = value;
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

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
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
