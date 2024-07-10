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




import {NewsAdminService} from 'src/app/shared/service/admin/common/NewsAdmin.service';
import {NewsDto} from 'src/app/shared/model/common/News.model';
import {NewsCriteria} from 'src/app/shared/criteria/common/NewsCriteria.model';


import {CollaboratorDto} from 'src/app/shared/model/vocab/Collaborator.model';
import {CollaboratorAdminService} from 'src/app/shared/service/admin/vocab/CollaboratorAdmin.service';

@Component({
  selector: 'app-news-edit-admin',
  templateUrl: './news-edit-admin.component.html'
})
export class NewsEditAdminComponent implements OnInit {

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



    private _validNewsRef = true;




    constructor(private service: NewsAdminService , private collaboratorService: CollaboratorAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.collaboratorService.findAll().subscribe((data) => this.collaborators = data);
    }

    public prepareEdit() {
        this.item.dateNews = this.service.format(this.item.dateNews);
        this.item.dateDebut = this.service.format(this.item.dateDebut);
        this.item.dateFin = this.service.format(this.item.dateFin);
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
            this.item = new NewsDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validNewsRef = value;
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateNewsRef();
    }

    public validateNewsRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
            this.errorMessages.push('Ref non valide');
            this.validNewsRef = false;
        } else {
            this.validNewsRef = true;
        }
    }





    get collaborator(): CollaboratorDto {
        return this.collaboratorService.item;
    }
    set collaborator(value: CollaboratorDto) {
        this.collaboratorService.item = value;
    }
    get collaborators(): Array<CollaboratorDto> {
        return this.collaboratorService.items;
    }
    set collaborators(value: Array<CollaboratorDto>) {
        this.collaboratorService.items = value;
    }
    get createCollaboratorDialog(): boolean {
        return this.collaboratorService.createDialog;
    }
    set createCollaboratorDialog(value: boolean) {
        this.collaboratorService.createDialog= value;
    }


    get validNewsRef(): boolean {
        return this._validNewsRef;
    }
    set validNewsRef(value: boolean) {
        this._validNewsRef = value;
    }


	get items(): Array<NewsDto> {
        return this.service.items;
    }

    set items(value: Array<NewsDto>) {
        this.service.items = value;
    }

    get item(): NewsDto {
        return this.service.item;
    }

    set item(value: NewsDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): NewsCriteria {
        return this.service.criteria;
    }

    set criteria(value: NewsCriteria) {
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
