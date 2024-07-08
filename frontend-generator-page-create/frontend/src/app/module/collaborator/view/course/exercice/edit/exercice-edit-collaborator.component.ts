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




import {ExerciceCollaboratorService} from 'src/app/shared/service/collaborator/course/ExerciceCollaborator.service';
import {ExerciceDto} from 'src/app/shared/model/course/Exercice.model';
import {ExerciceCriteria} from 'src/app/shared/criteria/course/ExerciceCriteria.model';


import {ContentTypeDto} from 'src/app/shared/model/courseref/ContentType.model';
import {ContentTypeCollaboratorService} from 'src/app/shared/service/collaborator/courseref/ContentTypeCollaborator.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCollaboratorService} from 'src/app/shared/service/collaborator/course/SectionCollaborator.service';

@Component({
  selector: 'app-exercice-edit-collaborator',
  templateUrl: './exercice-edit-collaborator.component.html'
})
export class ExerciceEditCollaboratorComponent implements OnInit {

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



    private _validExerciceLibelle = true;

    private _validContentTypeCode = true;
    private _validContentTypeLibelle = true;
    private _validSectionCode = true;
    private _validSectionLibelle = true;



    constructor(private service: ExerciceCollaboratorService , private contentTypeService: ContentTypeCollaboratorService, private sectionService: SectionCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.contentTypeService.findAll().subscribe((data) => this.contentTypes = data);
        this.sectionService.findAll().subscribe((data) => this.sections = data);
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
            this.item = new ExerciceDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validExerciceLibelle = value;
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateExerciceLibelle();
    }

    public validateExerciceLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validExerciceLibelle = false;
        } else {
            this.validExerciceLibelle = true;
        }
    }




   public async openCreateSection(section: string) {
        const isPermistted = await this.roleService.isPermitted('Section', 'edit');
        if (isPermistted) {
             this.section = new SectionDto();
             this.createSectionDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

    get contentType(): ContentTypeDto {
        return this.contentTypeService.item;
    }
    set contentType(value: ContentTypeDto) {
        this.contentTypeService.item = value;
    }
    get contentTypes(): Array<ContentTypeDto> {
        return this.contentTypeService.items;
    }
    set contentTypes(value: Array<ContentTypeDto>) {
        this.contentTypeService.items = value;
    }
    get createContentTypeDialog(): boolean {
        return this.contentTypeService.createDialog;
    }
    set createContentTypeDialog(value: boolean) {
        this.contentTypeService.createDialog= value;
    }
    get section(): SectionDto {
        return this.sectionService.item;
    }
    set section(value: SectionDto) {
        this.sectionService.item = value;
    }
    get sections(): Array<SectionDto> {
        return this.sectionService.items;
    }
    set sections(value: Array<SectionDto>) {
        this.sectionService.items = value;
    }
    get createSectionDialog(): boolean {
        return this.sectionService.createDialog;
    }
    set createSectionDialog(value: boolean) {
        this.sectionService.createDialog= value;
    }


    get validExerciceLibelle(): boolean {
        return this._validExerciceLibelle;
    }
    set validExerciceLibelle(value: boolean) {
        this._validExerciceLibelle = value;
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
    get validSectionCode(): boolean {
        return this._validSectionCode;
    }
    set validSectionCode(value: boolean) {
        this._validSectionCode = value;
    }
    get validSectionLibelle(): boolean {
        return this._validSectionLibelle;
    }
    set validSectionLibelle(value: boolean) {
        this._validSectionLibelle = value;
    }

	get items(): Array<ExerciceDto> {
        return this.service.items;
    }

    set items(value: Array<ExerciceDto>) {
        this.service.items = value;
    }

    get item(): ExerciceDto {
        return this.service.item;
    }

    set item(value: ExerciceDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): ExerciceCriteria {
        return this.service.criteria;
    }

    set criteria(value: ExerciceCriteria) {
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
