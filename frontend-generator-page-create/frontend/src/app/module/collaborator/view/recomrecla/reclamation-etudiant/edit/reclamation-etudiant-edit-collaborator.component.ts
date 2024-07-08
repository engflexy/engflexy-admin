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




import {ReclamationEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/recomrecla/ReclamationEtudiantCollaborator.service';
import {ReclamationEtudiantDto} from 'src/app/shared/model/recomrecla/ReclamationEtudiant.model';
import {ReclamationEtudiantCriteria} from 'src/app/shared/criteria/recomrecla/ReclamationEtudiantCriteria.model';


import {TypeReclamationEtudiantDto} from 'src/app/shared/model/recomrecla/TypeReclamationEtudiant.model';
import {TypeReclamationEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/recomrecla/TypeReclamationEtudiantCollaborator.service';

@Component({
  selector: 'app-reclamation-etudiant-edit-collaborator',
  templateUrl: './reclamation-etudiant-edit-collaborator.component.html'
})
export class ReclamationEtudiantEditCollaboratorComponent implements OnInit {

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



    private _validReclamationEtudiantReference = true;

    private _validTypeReclamationEtudiantCode = true;
    private _validTypeReclamationEtudiantLibelle = true;



    constructor(private service: ReclamationEtudiantCollaboratorService , private typeReclamationEtudiantService: TypeReclamationEtudiantCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.typeReclamationEtudiantService.findAll().subscribe((data) => this.typeReclamationEtudiants = data);
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
            this.item = new ReclamationEtudiantDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validReclamationEtudiantReference = value;
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateReclamationEtudiantReference();
    }

    public validateReclamationEtudiantReference(){
        if (this.stringUtilService.isEmpty(this.item.reference)) {
            this.errorMessages.push('Reference non valide');
            this.validReclamationEtudiantReference = false;
        } else {
            this.validReclamationEtudiantReference = true;
        }
    }




   public async openCreateTypeReclamationEtudiant(typeReclamationEtudiant: string) {
        const isPermistted = await this.roleService.isPermitted('TypeReclamationEtudiant', 'edit');
        if (isPermistted) {
             this.typeReclamationEtudiant = new TypeReclamationEtudiantDto();
             this.createTypeReclamationEtudiantDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

    get typeReclamationEtudiant(): TypeReclamationEtudiantDto {
        return this.typeReclamationEtudiantService.item;
    }
    set typeReclamationEtudiant(value: TypeReclamationEtudiantDto) {
        this.typeReclamationEtudiantService.item = value;
    }
    get typeReclamationEtudiants(): Array<TypeReclamationEtudiantDto> {
        return this.typeReclamationEtudiantService.items;
    }
    set typeReclamationEtudiants(value: Array<TypeReclamationEtudiantDto>) {
        this.typeReclamationEtudiantService.items = value;
    }
    get createTypeReclamationEtudiantDialog(): boolean {
        return this.typeReclamationEtudiantService.createDialog;
    }
    set createTypeReclamationEtudiantDialog(value: boolean) {
        this.typeReclamationEtudiantService.createDialog= value;
    }


    get validReclamationEtudiantReference(): boolean {
        return this._validReclamationEtudiantReference;
    }
    set validReclamationEtudiantReference(value: boolean) {
        this._validReclamationEtudiantReference = value;
    }

    get validTypeReclamationEtudiantCode(): boolean {
        return this._validTypeReclamationEtudiantCode;
    }
    set validTypeReclamationEtudiantCode(value: boolean) {
        this._validTypeReclamationEtudiantCode = value;
    }
    get validTypeReclamationEtudiantLibelle(): boolean {
        return this._validTypeReclamationEtudiantLibelle;
    }
    set validTypeReclamationEtudiantLibelle(value: boolean) {
        this._validTypeReclamationEtudiantLibelle = value;
    }

	get items(): Array<ReclamationEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<ReclamationEtudiantDto>) {
        this.service.items = value;
    }

    get item(): ReclamationEtudiantDto {
        return this.service.item;
    }

    set item(value: ReclamationEtudiantDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): ReclamationEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReclamationEtudiantCriteria) {
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
