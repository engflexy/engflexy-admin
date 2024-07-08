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




import {FreeTrialDetailAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialDetailAdmin.service';
import {FreeTrialDetailDto} from 'src/app/shared/model/freetrial/FreeTrialDetail.model';
import {FreeTrialDetailCriteria} from 'src/app/shared/criteria/freetrial/FreeTrialDetailCriteria.model';


import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {FreeTrialDto} from 'src/app/shared/model/freetrial/FreeTrial.model';
import {FreeTrialAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialAdmin.service';

@Component({
  selector: 'app-free-trial-detail-edit-admin',
  templateUrl: './free-trial-detail-edit-admin.component.html'
})
export class FreeTrialDetailEditAdminComponent implements OnInit {

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




    private _validFreeTrialReference = true;



    constructor(private service: FreeTrialDetailAdminService , private etudiantService: EtudiantAdminService, private freeTrialService: FreeTrialAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.freeTrialService.findAll().subscribe((data) => this.freeTrials = data);
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
    }

    public prepareEdit() {
        this.item.dateEnvoiwhatsUpMessage = this.service.format(this.item.dateEnvoiwhatsUpMessage);
        this.item.dateEnvoiEmailMessage = this.service.format(this.item.dateEnvoiEmailMessage);
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
            this.item = new FreeTrialDetailDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
    }




   public async openCreateFreeTrial(freeTrial: string) {
        const isPermistted = await this.roleService.isPermitted('FreeTrial', 'edit');
        if (isPermistted) {
             this.freeTrial = new FreeTrialDto();
             this.createFreeTrialDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
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

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
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
