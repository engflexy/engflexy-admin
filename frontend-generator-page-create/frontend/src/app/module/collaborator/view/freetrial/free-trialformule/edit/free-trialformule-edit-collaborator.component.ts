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




import {FreeTrialformuleCollaboratorService} from 'src/app/shared/service/collaborator/freetrial/FreeTrialformuleCollaborator.service';
import {FreeTrialformuleDto} from 'src/app/shared/model/freetrial/FreeTrialformule.model';
import {FreeTrialformuleCriteria} from 'src/app/shared/criteria/freetrial/FreeTrialformuleCriteria.model';


import {InscriptionDto} from 'src/app/shared/model/grpe/Inscription.model';
import {InscriptionCollaboratorService} from 'src/app/shared/service/collaborator/grpe/InscriptionCollaborator.service';

@Component({
  selector: 'app-free-trialformule-edit-collaborator',
  templateUrl: './free-trialformule-edit-collaborator.component.html'
})
export class FreeTrialformuleEditCollaboratorComponent implements OnInit {

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



    private _validFreeTrialformuleCode = true;

    private _validInscriptionNumeroInscription = true;
    private _validInscriptionEtudiant = true;
    private _validInscriptionEtatInscription = true;
    private _validInscriptionParcours = true;
    private _validInscriptionGroupeEtude = true;
    private _validInscriptionGroupeType = true;
    private _validInscriptionStatutSocial = true;
    private _validInscriptionInteretEtudiant = true;
    private _validInscriptionNiveauEtude = true;
    private _validInscriptionFonction = true;
    private _validInscriptionQuiz = true;



    constructor(private service: FreeTrialformuleCollaboratorService , private inscriptionService: InscriptionCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.inscriptionService.findAll().subscribe((data) => this.inscriptions = data);
    }

    public prepareEdit() {
        this.item.dateConfirmation = this.service.format(this.item.dateConfirmation);
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
            this.item = new FreeTrialformuleDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validFreeTrialformuleCode = value;
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateFreeTrialformuleCode();
    }

    public validateFreeTrialformuleCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validFreeTrialformuleCode = false;
        } else {
            this.validFreeTrialformuleCode = true;
        }
    }





    get inscription(): InscriptionDto {
        return this.inscriptionService.item;
    }
    set inscription(value: InscriptionDto) {
        this.inscriptionService.item = value;
    }
    get inscriptions(): Array<InscriptionDto> {
        return this.inscriptionService.items;
    }
    set inscriptions(value: Array<InscriptionDto>) {
        this.inscriptionService.items = value;
    }
    get createInscriptionDialog(): boolean {
        return this.inscriptionService.createDialog;
    }
    set createInscriptionDialog(value: boolean) {
        this.inscriptionService.createDialog= value;
    }


    get validFreeTrialformuleCode(): boolean {
        return this._validFreeTrialformuleCode;
    }
    set validFreeTrialformuleCode(value: boolean) {
        this._validFreeTrialformuleCode = value;
    }

    get validInscriptionNumeroInscription(): boolean {
        return this._validInscriptionNumeroInscription;
    }
    set validInscriptionNumeroInscription(value: boolean) {
        this._validInscriptionNumeroInscription = value;
    }
    get validInscriptionEtudiant(): boolean {
        return this._validInscriptionEtudiant;
    }
    set validInscriptionEtudiant(value: boolean) {
        this._validInscriptionEtudiant = value;
    }
    get validInscriptionEtatInscription(): boolean {
        return this._validInscriptionEtatInscription;
    }
    set validInscriptionEtatInscription(value: boolean) {
        this._validInscriptionEtatInscription = value;
    }
    get validInscriptionParcours(): boolean {
        return this._validInscriptionParcours;
    }
    set validInscriptionParcours(value: boolean) {
        this._validInscriptionParcours = value;
    }
    get validInscriptionGroupeEtude(): boolean {
        return this._validInscriptionGroupeEtude;
    }
    set validInscriptionGroupeEtude(value: boolean) {
        this._validInscriptionGroupeEtude = value;
    }
    get validInscriptionGroupeType(): boolean {
        return this._validInscriptionGroupeType;
    }
    set validInscriptionGroupeType(value: boolean) {
        this._validInscriptionGroupeType = value;
    }
    get validInscriptionStatutSocial(): boolean {
        return this._validInscriptionStatutSocial;
    }
    set validInscriptionStatutSocial(value: boolean) {
        this._validInscriptionStatutSocial = value;
    }
    get validInscriptionInteretEtudiant(): boolean {
        return this._validInscriptionInteretEtudiant;
    }
    set validInscriptionInteretEtudiant(value: boolean) {
        this._validInscriptionInteretEtudiant = value;
    }
    get validInscriptionNiveauEtude(): boolean {
        return this._validInscriptionNiveauEtude;
    }
    set validInscriptionNiveauEtude(value: boolean) {
        this._validInscriptionNiveauEtude = value;
    }
    get validInscriptionFonction(): boolean {
        return this._validInscriptionFonction;
    }
    set validInscriptionFonction(value: boolean) {
        this._validInscriptionFonction = value;
    }
    get validInscriptionQuiz(): boolean {
        return this._validInscriptionQuiz;
    }
    set validInscriptionQuiz(value: boolean) {
        this._validInscriptionQuiz = value;
    }

	get items(): Array<FreeTrialformuleDto> {
        return this.service.items;
    }

    set items(value: Array<FreeTrialformuleDto>) {
        this.service.items = value;
    }

    get item(): FreeTrialformuleDto {
        return this.service.item;
    }

    set item(value: FreeTrialformuleDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): FreeTrialformuleCriteria {
        return this.service.criteria;
    }

    set criteria(value: FreeTrialformuleCriteria) {
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
