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




import {HoweWorkQSTReponseCollaboratorService} from 'src/app/shared/service/collaborator/homework/HoweWorkQSTReponseCollaborator.service';
import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCriteria} from 'src/app/shared/criteria/homework/HoweWorkQSTReponseCriteria.model';


import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';

@Component({
  selector: 'app-howe-work-q-s-t-reponse-edit-collaborator',
  templateUrl: './howe-work-q-s-t-reponse-edit-collaborator.component.html'
})
export class HoweWorkQSTReponseEditCollaboratorComponent implements OnInit {

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



    constructor(private service: HoweWorkQSTReponseCollaboratorService , private homeWorkQuestionService: HomeWorkQuestionCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
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
            this.item = new HoweWorkQSTReponseDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validHoweWorkQSTReponseRef = value;
        this.validHoweWorkQSTReponseLib = value;
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateHoweWorkQSTReponseRef();
        this.validateHoweWorkQSTReponseLib();
    }

    public validateHoweWorkQSTReponseRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
            this.errorMessages.push('Ref non valide');
            this.validHoweWorkQSTReponseRef = false;
        } else {
            this.validHoweWorkQSTReponseRef = true;
        }
    }

    public validateHoweWorkQSTReponseLib(){
        if (this.stringUtilService.isEmpty(this.item.lib)) {
            this.errorMessages.push('Lib non valide');
            this.validHoweWorkQSTReponseLib = false;
        } else {
            this.validHoweWorkQSTReponseLib = true;
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

	get items(): Array<HoweWorkQSTReponseDto> {
        return this.service.items;
    }

    set items(value: Array<HoweWorkQSTReponseDto>) {
        this.service.items = value;
    }

    get item(): HoweWorkQSTReponseDto {
        return this.service.item;
    }

    set item(value: HoweWorkQSTReponseDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): HoweWorkQSTReponseCriteria {
        return this.service.criteria;
    }

    set criteria(value: HoweWorkQSTReponseCriteria) {
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
