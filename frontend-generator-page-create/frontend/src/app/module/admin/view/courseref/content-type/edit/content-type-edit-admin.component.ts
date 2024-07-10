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




import {ContentTypeAdminService} from 'src/app/shared/service/admin/courseref/ContentTypeAdmin.service';
import {ContentTypeDto} from 'src/app/shared/model/courseref/ContentType.model';
import {ContentTypeCriteria} from 'src/app/shared/criteria/courseref/ContentTypeCriteria.model';



@Component({
  selector: 'app-content-type-edit-admin',
  templateUrl: './content-type-edit-admin.component.html'
})
export class ContentTypeEditAdminComponent implements OnInit {

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



    private _validContentTypeCode = true;
    private _validContentTypeLibelle = true;




    constructor(private service: ContentTypeAdminService , @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
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
            this.item = new ContentTypeDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validContentTypeCode = value;
        this.validContentTypeLibelle = value;
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateContentTypeCode();
        this.validateContentTypeLibelle();
    }

    public validateContentTypeCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validContentTypeCode = false;
        } else {
            this.validContentTypeCode = true;
        }
    }

    public validateContentTypeLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validContentTypeLibelle = false;
        } else {
            this.validContentTypeLibelle = true;
        }
    }







    get validContentTypeCode(): boolean {
        return this._validContentTypeCode;
    }
    set validContentTypeCode(value: boolean) {
        this._validContentTypeCode = value;
    }
    get validContentTypeLibelle(): boolean {
        return this._validContentTypeLibelle;
    }
    set validContentTypeLibelle(value: boolean) {
        this._validContentTypeLibelle = value;
    }


	get items(): Array<ContentTypeDto> {
        return this.service.items;
    }

    set items(value: Array<ContentTypeDto>) {
        this.service.items = value;
    }

    get item(): ContentTypeDto {
        return this.service.item;
    }

    set item(value: ContentTypeDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): ContentTypeCriteria {
        return this.service.criteria;
    }

    set criteria(value: ContentTypeCriteria) {
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
