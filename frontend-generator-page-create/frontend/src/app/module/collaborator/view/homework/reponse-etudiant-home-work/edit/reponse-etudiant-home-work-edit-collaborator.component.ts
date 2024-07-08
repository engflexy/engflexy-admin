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




import {ReponseEtudiantHomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/ReponseEtudiantHomeWorkCollaborator.service';
import {ReponseEtudiantHomeWorkDto} from 'src/app/shared/model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkCriteria} from 'src/app/shared/criteria/homework/ReponseEtudiantHomeWorkCriteria.model';


import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCollaboratorService} from 'src/app/shared/service/collaborator/homework/HoweWorkQSTReponseCollaborator.service';
import {HomeWorkEtudiantDto} from 'src/app/shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkEtudiantCollaborator.service';
import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';

@Component({
  selector: 'app-reponse-etudiant-home-work-edit-collaborator',
  templateUrl: './reponse-etudiant-home-work-edit-collaborator.component.html'
})
export class ReponseEtudiantHomeWorkEditCollaboratorComponent implements OnInit {

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




    private _validHoweWorkQSTReponseRef = true;
    private _validHoweWorkQSTReponseLib = true;
    private _validHomeWorkQuestionRef = true;
    private _validHomeWorkQuestionLibelle = true;



    constructor(private service: ReponseEtudiantHomeWorkCollaboratorService , private howeWorkQSTReponseService: HoweWorkQSTReponseCollaboratorService, private homeWorkEtudiantService: HomeWorkEtudiantCollaboratorService, private homeWorkQuestionService: HomeWorkQuestionCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.howeWorkQSTReponseService.findAll().subscribe((data) => this.howeWorkQSTReponses = data);
        this.homeWorkEtudiantService.findAll().subscribe((data) => this.homeWorkEtudiants = data);
        this.homeWorkQuestionService.findAll().subscribe((data) => this.homeWorkQuestions = data);
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
            this.item = new ReponseEtudiantHomeWorkDto();
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




   public async openCreateHomeWorkEtudiant(homeWorkEtudiant: string) {
        const isPermistted = await this.roleService.isPermitted('HomeWorkEtudiant', 'edit');
        if (isPermistted) {
             this.homeWorkEtudiant = new HomeWorkEtudiantDto();
             this.createHomeWorkEtudiantDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }
   public async openCreateHoweWorkQSTReponse(howeWorkQSTReponse: string) {
        const isPermistted = await this.roleService.isPermitted('HoweWorkQSTReponse', 'edit');
        if (isPermistted) {
             this.howeWorkQSTReponse = new HoweWorkQSTReponseDto();
             this.createHoweWorkQSTReponseDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }
   public async openCreateHomeWorkQuestion(homeWorkQuestion: string) {
        const isPermistted = await this.roleService.isPermitted('HomeWorkQuestion', 'edit');
        if (isPermistted) {
             this.homeWorkQuestion = new HomeWorkQuestionDto();
             this.createHomeWorkQuestionDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

    get homeWorkEtudiant(): HomeWorkEtudiantDto {
        return this.homeWorkEtudiantService.item;
    }
    set homeWorkEtudiant(value: HomeWorkEtudiantDto) {
        this.homeWorkEtudiantService.item = value;
    }
    get homeWorkEtudiants(): Array<HomeWorkEtudiantDto> {
        return this.homeWorkEtudiantService.items;
    }
    set homeWorkEtudiants(value: Array<HomeWorkEtudiantDto>) {
        this.homeWorkEtudiantService.items = value;
    }
    get createHomeWorkEtudiantDialog(): boolean {
        return this.homeWorkEtudiantService.createDialog;
    }
    set createHomeWorkEtudiantDialog(value: boolean) {
        this.homeWorkEtudiantService.createDialog= value;
    }
    get howeWorkQSTReponse(): HoweWorkQSTReponseDto {
        return this.howeWorkQSTReponseService.item;
    }
    set howeWorkQSTReponse(value: HoweWorkQSTReponseDto) {
        this.howeWorkQSTReponseService.item = value;
    }
    get howeWorkQSTReponses(): Array<HoweWorkQSTReponseDto> {
        return this.howeWorkQSTReponseService.items;
    }
    set howeWorkQSTReponses(value: Array<HoweWorkQSTReponseDto>) {
        this.howeWorkQSTReponseService.items = value;
    }
    get createHoweWorkQSTReponseDialog(): boolean {
        return this.howeWorkQSTReponseService.createDialog;
    }
    set createHoweWorkQSTReponseDialog(value: boolean) {
        this.howeWorkQSTReponseService.createDialog= value;
    }
    get homeWorkQuestion(): HomeWorkQuestionDto {
        return this.homeWorkQuestionService.item;
    }
    set homeWorkQuestion(value: HomeWorkQuestionDto) {
        this.homeWorkQuestionService.item = value;
    }
    get homeWorkQuestions(): Array<HomeWorkQuestionDto> {
        return this.homeWorkQuestionService.items;
    }
    set homeWorkQuestions(value: Array<HomeWorkQuestionDto>) {
        this.homeWorkQuestionService.items = value;
    }
    get createHomeWorkQuestionDialog(): boolean {
        return this.homeWorkQuestionService.createDialog;
    }
    set createHomeWorkQuestionDialog(value: boolean) {
        this.homeWorkQuestionService.createDialog= value;
    }



    get validHoweWorkQSTReponseRef(): boolean {
        return this._validHoweWorkQSTReponseRef;
    }
    set validHoweWorkQSTReponseRef(value: boolean) {
        this._validHoweWorkQSTReponseRef = value;
    }
    get validHoweWorkQSTReponseLib(): boolean {
        return this._validHoweWorkQSTReponseLib;
    }
    set validHoweWorkQSTReponseLib(value: boolean) {
        this._validHoweWorkQSTReponseLib = value;
    }
    get validHomeWorkQuestionRef(): boolean {
        return this._validHomeWorkQuestionRef;
    }
    set validHomeWorkQuestionRef(value: boolean) {
        this._validHomeWorkQuestionRef = value;
    }
    get validHomeWorkQuestionLibelle(): boolean {
        return this._validHomeWorkQuestionLibelle;
    }
    set validHomeWorkQuestionLibelle(value: boolean) {
        this._validHomeWorkQuestionLibelle = value;
    }

	get items(): Array<ReponseEtudiantHomeWorkDto> {
        return this.service.items;
    }

    set items(value: Array<ReponseEtudiantHomeWorkDto>) {
        this.service.items = value;
    }

    get item(): ReponseEtudiantHomeWorkDto {
        return this.service.item;
    }

    set item(value: ReponseEtudiantHomeWorkDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): ReponseEtudiantHomeWorkCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReponseEtudiantHomeWorkCriteria) {
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
