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




import {FaqEtudiantAdminService} from 'src/app/shared/service/admin/faq/FaqEtudiantAdmin.service';
import {FaqEtudiantDto} from 'src/app/shared/model/faq/FaqEtudiant.model';
import {FaqEtudiantCriteria} from 'src/app/shared/criteria/faq/FaqEtudiantCriteria.model';


import {FaqTypeDto} from 'src/app/shared/model/faq/FaqType.model';
import {FaqTypeAdminService} from 'src/app/shared/service/admin/faq/FaqTypeAdmin.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';

@Component({
  selector: 'app-faq-etudiant-edit-admin',
  templateUrl: './faq-etudiant-edit-admin.component.html'
})
export class FaqEtudiantEditAdminComponent implements OnInit {

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



    private _validFaqEtudiantLibelle = true;

    private _validFaqTypeLibelle = true;



    constructor(private service: FaqEtudiantAdminService , private faqTypeService: FaqTypeAdminService, private etudiantService: EtudiantAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
        this.faqTypeService.findAll().subscribe((data) => this.faqTypes = data);
    }

    public prepareEdit() {
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
            this.item = new FaqEtudiantDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validFaqEtudiantLibelle = value;
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateFaqEtudiantLibelle();
    }

    public validateFaqEtudiantLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validFaqEtudiantLibelle = false;
        } else {
            this.validFaqEtudiantLibelle = true;
        }
    }




   public async openCreateFaqType(faqType: string) {
        const isPermistted = await this.roleService.isPermitted('FaqType', 'edit');
        if (isPermistted) {
             this.faqType = new FaqTypeDto();
             this.createFaqTypeDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
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
    get faqType(): FaqTypeDto {
        return this.faqTypeService.item;
    }
    set faqType(value: FaqTypeDto) {
        this.faqTypeService.item = value;
    }
    get faqTypes(): Array<FaqTypeDto> {
        return this.faqTypeService.items;
    }
    set faqTypes(value: Array<FaqTypeDto>) {
        this.faqTypeService.items = value;
    }
    get createFaqTypeDialog(): boolean {
        return this.faqTypeService.createDialog;
    }
    set createFaqTypeDialog(value: boolean) {
        this.faqTypeService.createDialog= value;
    }


    get validFaqEtudiantLibelle(): boolean {
        return this._validFaqEtudiantLibelle;
    }
    set validFaqEtudiantLibelle(value: boolean) {
        this._validFaqEtudiantLibelle = value;
    }

    get validFaqTypeLibelle(): boolean {
        return this._validFaqTypeLibelle;
    }
    set validFaqTypeLibelle(value: boolean) {
        this._validFaqTypeLibelle = value;
    }

	get items(): Array<FaqEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<FaqEtudiantDto>) {
        this.service.items = value;
    }

    get item(): FaqEtudiantDto {
        return this.service.item;
    }

    set item(value: FaqEtudiantDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): FaqEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: FaqEtudiantCriteria) {
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
