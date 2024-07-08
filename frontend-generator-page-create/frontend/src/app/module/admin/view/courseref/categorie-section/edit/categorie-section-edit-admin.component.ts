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




import {CategorieSectionAdminService} from 'src/app/shared/service/admin/courseref/CategorieSectionAdmin.service';
import {CategorieSectionDto} from 'src/app/shared/model/courseref/CategorieSection.model';
import {CategorieSectionCriteria} from 'src/app/shared/criteria/courseref/CategorieSectionCriteria.model';


import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizAdminService} from 'src/app/shared/service/admin/quiz/QuizAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';
import {ExerciceDto} from 'src/app/shared/model/course/Exercice.model';
import {ExerciceAdminService} from 'src/app/shared/service/admin/course/ExerciceAdmin.service';
import {SuperCategorieSectionDto} from 'src/app/shared/model/courseref/SuperCategorieSection.model';
import {SuperCategorieSectionAdminService} from 'src/app/shared/service/admin/courseref/SuperCategorieSectionAdmin.service';

@Component({
  selector: 'app-categorie-section-edit-admin',
  templateUrl: './categorie-section-edit-admin.component.html'
})
export class CategorieSectionEditAdminComponent implements OnInit {

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


    private _sectionsElement = new SectionDto();

    private _validCategorieSectionCode = true;

    private _validSuperCategorieSectionCode = true;
    private _validSuperCategorieSectionLibelle = true;
    private _validSectionsCode = true;
    private _validSectionsLibelle = true;



    constructor(private service: CategorieSectionAdminService , private sectionService: SectionAdminService, private superCategorieSectionService: SuperCategorieSectionAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {

        this.superCategorieSectionService.findAll().subscribe((data) => this.superCategorieSections = data);
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
            this.item = new CategorieSectionDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateSections(){
        this.errorMessages = new Array();
        this.validateSectionsCode();
        this.validateSectionsLibelle();
    }

    public setValidation(value: boolean){
        this.validCategorieSectionCode = value;
        this.validSectionsCode = value;
        this.validSectionsLibelle = value;
    }

   public addSections() {
        if( this.item.sections == null )
            this.item.sections = new Array<SectionDto>();
       this.validateSections();
       if (this.errorMessages.length === 0) {
            if(this.sectionsElement.id == null){
                this.item.sections.push(this.sectionsElement);
            }else{
                const index = this.item.sections.findIndex(e => e.id == this.sectionsElement.id);
                this.item.sections[index] = this.sectionsElement;
            }
          this.sectionsElement = new SectionDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteSections(p: SectionDto) {
        this.item.sections.forEach((element, index) => {
            if (element === p) { this.item.sections.splice(index, 1); }
        });
    }

    public editSections(p: SectionDto) {
        this.sectionsElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateCategorieSectionCode();
    }

    public validateCategorieSectionCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validCategorieSectionCode = false;
        } else {
            this.validCategorieSectionCode = true;
        }
    }



    private validateSectionsCode(){
        if (this.sectionsElement.code == null) {
        this.errorMessages.push('Code de la section est  invalide');
            this.validSectionsCode = false;
        } else {
            this.validSectionsCode = true;
        }
    }
    private validateSectionsLibelle(){
        if (this.sectionsElement.libelle == null) {
        this.errorMessages.push('Libelle de la section est  invalide');
            this.validSectionsLibelle = false;
        } else {
            this.validSectionsLibelle = true;
        }
    }

   public async openCreateSuperCategorieSection(superCategorieSection: string) {
        const isPermistted = await this.roleService.isPermitted('SuperCategorieSection', 'edit');
        if (isPermistted) {
             this.superCategorieSection = new SuperCategorieSectionDto();
             this.createSuperCategorieSectionDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

    get superCategorieSection(): SuperCategorieSectionDto {
        return this.superCategorieSectionService.item;
    }
    set superCategorieSection(value: SuperCategorieSectionDto) {
        this.superCategorieSectionService.item = value;
    }
    get superCategorieSections(): Array<SuperCategorieSectionDto> {
        return this.superCategorieSectionService.items;
    }
    set superCategorieSections(value: Array<SuperCategorieSectionDto>) {
        this.superCategorieSectionService.items = value;
    }
    get createSuperCategorieSectionDialog(): boolean {
        return this.superCategorieSectionService.createDialog;
    }
    set createSuperCategorieSectionDialog(value: boolean) {
        this.superCategorieSectionService.createDialog= value;
    }

    get sectionsElement(): SectionDto {
        if( this._sectionsElement == null )
            this._sectionsElement = new SectionDto();
         return this._sectionsElement;
    }

    set sectionsElement(value: SectionDto) {
        this._sectionsElement = value;
    }

    get validCategorieSectionCode(): boolean {
        return this._validCategorieSectionCode;
    }
    set validCategorieSectionCode(value: boolean) {
        this._validCategorieSectionCode = value;
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
    get validSectionsCode(): boolean {
        return this._validSectionsCode;
    }
    set validSectionsCode(value: boolean) {
        this._validSectionsCode = value;
    }
    get validSectionsLibelle(): boolean {
        return this._validSectionsLibelle;
    }
    set validSectionsLibelle(value: boolean) {
        this._validSectionsLibelle = value;
    }

	get items(): Array<CategorieSectionDto> {
        return this.service.items;
    }

    set items(value: Array<CategorieSectionDto>) {
        this.service.items = value;
    }

    get item(): CategorieSectionDto {
        return this.service.item;
    }

    set item(value: CategorieSectionDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): CategorieSectionCriteria {
        return this.service.criteria;
    }

    set criteria(value: CategorieSectionCriteria) {
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
