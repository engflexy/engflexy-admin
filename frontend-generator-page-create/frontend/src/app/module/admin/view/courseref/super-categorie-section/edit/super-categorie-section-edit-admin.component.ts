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




import {SuperCategorieSectionAdminService} from 'src/app/shared/service/admin/courseref/SuperCategorieSectionAdmin.service';
import {SuperCategorieSectionDto} from 'src/app/shared/model/courseref/SuperCategorieSection.model';
import {SuperCategorieSectionCriteria} from 'src/app/shared/criteria/courseref/SuperCategorieSectionCriteria.model';


import {CategorieSectionDto} from 'src/app/shared/model/courseref/CategorieSection.model';
import {CategorieSectionAdminService} from 'src/app/shared/service/admin/courseref/CategorieSectionAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';

@Component({
  selector: 'app-super-categorie-section-edit-admin',
  templateUrl: './super-categorie-section-edit-admin.component.html'
})
export class SuperCategorieSectionEditAdminComponent implements OnInit {

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


    private _categorieSectionsElement = new CategorieSectionDto();

    private _validSuperCategorieSectionCode = true;
    private _validSuperCategorieSectionLibelle = true;

    private _validCategorieSectionsCode = true;



    constructor(private service: SuperCategorieSectionAdminService , private categorieSectionService: CategorieSectionAdminService, @Inject(PLATFORM_ID) private platformId?) {
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
            this.item = new SuperCategorieSectionDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateCategorieSections(){
        this.errorMessages = new Array();
        this.validateCategorieSectionsCode();
    }

    public setValidation(value: boolean){
        this.validSuperCategorieSectionCode = value;
        this.validSuperCategorieSectionLibelle = value;
        this.validCategorieSectionsCode = value;
    }

   public addCategorieSections() {
        if( this.item.categorieSections == null )
            this.item.categorieSections = new Array<CategorieSectionDto>();
       this.validateCategorieSections();
       if (this.errorMessages.length === 0) {
            if(this.categorieSectionsElement.id == null){
                this.item.categorieSections.push(this.categorieSectionsElement);
            }else{
                const index = this.item.categorieSections.findIndex(e => e.id == this.categorieSectionsElement.id);
                this.item.categorieSections[index] = this.categorieSectionsElement;
            }
          this.categorieSectionsElement = new CategorieSectionDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteCategorieSections(p: CategorieSectionDto) {
        this.item.categorieSections.forEach((element, index) => {
            if (element === p) { this.item.categorieSections.splice(index, 1); }
        });
    }

    public editCategorieSections(p: CategorieSectionDto) {
        this.categorieSectionsElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateSuperCategorieSectionCode();
        this.validateSuperCategorieSectionLibelle();
    }

    public validateSuperCategorieSectionCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validSuperCategorieSectionCode = false;
        } else {
            this.validSuperCategorieSectionCode = true;
        }
    }

    public validateSuperCategorieSectionLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validSuperCategorieSectionLibelle = false;
        } else {
            this.validSuperCategorieSectionLibelle = true;
        }
    }



    private validateCategorieSectionsCode(){
        if (this.categorieSectionsElement.code == null) {
        this.errorMessages.push('Code de la categorieSection est  invalide');
            this.validCategorieSectionsCode = false;
        } else {
            this.validCategorieSectionsCode = true;
        }
    }



    get categorieSectionsElement(): CategorieSectionDto {
        if( this._categorieSectionsElement == null )
            this._categorieSectionsElement = new CategorieSectionDto();
         return this._categorieSectionsElement;
    }

    set categorieSectionsElement(value: CategorieSectionDto) {
        this._categorieSectionsElement = value;
    }

    get validSuperCategorieSectionCode(): boolean {
        return this._validSuperCategorieSectionCode;
    }
    set validSuperCategorieSectionCode(value: boolean) {
        this._validSuperCategorieSectionCode = value;
    }
    get validSuperCategorieSectionLibelle(): boolean {
        return this._validSuperCategorieSectionLibelle;
    }
    set validSuperCategorieSectionLibelle(value: boolean) {
        this._validSuperCategorieSectionLibelle = value;
    }

    get validCategorieSectionsCode(): boolean {
        return this._validCategorieSectionsCode;
    }
    set validCategorieSectionsCode(value: boolean) {
        this._validCategorieSectionsCode = value;
    }

	get items(): Array<SuperCategorieSectionDto> {
        return this.service.items;
    }

    set items(value: Array<SuperCategorieSectionDto>) {
        this.service.items = value;
    }

    get item(): SuperCategorieSectionDto {
        return this.service.item;
    }

    set item(value: SuperCategorieSectionDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): SuperCategorieSectionCriteria {
        return this.service.criteria;
    }

    set criteria(value: SuperCategorieSectionCriteria) {
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
