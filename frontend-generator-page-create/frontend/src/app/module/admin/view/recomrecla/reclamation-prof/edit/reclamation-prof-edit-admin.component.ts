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




import {ReclamationProfAdminService} from 'src/app/shared/service/admin/recomrecla/ReclamationProfAdmin.service';
import {ReclamationProfDto} from 'src/app/shared/model/recomrecla/ReclamationProf.model';
import {ReclamationProfCriteria} from 'src/app/shared/criteria/recomrecla/ReclamationProfCriteria.model';


import {TypeReclamationProfDto} from 'src/app/shared/model/recomrecla/TypeReclamationProf.model';
import {TypeReclamationProfAdminService} from 'src/app/shared/service/admin/recomrecla/TypeReclamationProfAdmin.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfAdminService} from 'src/app/shared/service/admin/prof/ProfAdmin.service';

@Component({
  selector: 'app-reclamation-prof-edit-admin',
  templateUrl: './reclamation-prof-edit-admin.component.html'
})
export class ReclamationProfEditAdminComponent implements OnInit {

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



    private _validReclamationProfReference = true;

    private _validProfRef = true;
    private _validTypeReclamationProfCode = true;
    private _validTypeReclamationProfLibelle = true;



    constructor(private service: ReclamationProfAdminService , private typeReclamationProfService: TypeReclamationProfAdminService, private profService: ProfAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.profService.findAll().subscribe((data) => this.profs = data);
        this.typeReclamationProfService.findAll().subscribe((data) => this.typeReclamationProfs = data);
    }

    public prepareEdit() {
        this.item.dateReclamation = this.service.format(this.item.dateReclamation);
        this.item.dateTraitement = this.service.format(this.item.dateTraitement);
        this.item.dateReponse = this.service.format(this.item.dateReponse);
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
            this.item = new ReclamationProfDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validReclamationProfReference = value;
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateReclamationProfReference();
    }

    public validateReclamationProfReference(){
        if (this.stringUtilService.isEmpty(this.item.reference)) {
            this.errorMessages.push('Reference non valide');
            this.validReclamationProfReference = false;
        } else {
            this.validReclamationProfReference = true;
        }
    }




   public async openCreateTypeReclamationProf(typeReclamationProf: string) {
        const isPermistted = await this.roleService.isPermitted('TypeReclamationProf', 'edit');
        if (isPermistted) {
             this.typeReclamationProf = new TypeReclamationProfDto();
             this.createTypeReclamationProfDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

    get typeReclamationProf(): TypeReclamationProfDto {
        return this.typeReclamationProfService.item;
    }
    set typeReclamationProf(value: TypeReclamationProfDto) {
        this.typeReclamationProfService.item = value;
    }
    get typeReclamationProfs(): Array<TypeReclamationProfDto> {
        return this.typeReclamationProfService.items;
    }
    set typeReclamationProfs(value: Array<TypeReclamationProfDto>) {
        this.typeReclamationProfService.items = value;
    }
    get createTypeReclamationProfDialog(): boolean {
        return this.typeReclamationProfService.createDialog;
    }
    set createTypeReclamationProfDialog(value: boolean) {
        this.typeReclamationProfService.createDialog= value;
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


    get validReclamationProfReference(): boolean {
        return this._validReclamationProfReference;
    }
    set validReclamationProfReference(value: boolean) {
        this._validReclamationProfReference = value;
    }

    get validProfRef(): boolean {
        return this._validProfRef;
    }
    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }
    get validTypeReclamationProfCode(): boolean {
        return this._validTypeReclamationProfCode;
    }
    set validTypeReclamationProfCode(value: boolean) {
        this._validTypeReclamationProfCode = value;
    }
    get validTypeReclamationProfLibelle(): boolean {
        return this._validTypeReclamationProfLibelle;
    }
    set validTypeReclamationProfLibelle(value: boolean) {
        this._validTypeReclamationProfLibelle = value;
    }

	get items(): Array<ReclamationProfDto> {
        return this.service.items;
    }

    set items(value: Array<ReclamationProfDto>) {
        this.service.items = value;
    }

    get item(): ReclamationProfDto {
        return this.service.item;
    }

    set item(value: ReclamationProfDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): ReclamationProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReclamationProfCriteria) {
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
