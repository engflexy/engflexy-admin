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




import {HomeWorkQuestionAdminService} from 'src/app/shared/service/admin/homework/HomeWorkQuestionAdmin.service';
import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCriteria} from 'src/app/shared/criteria/homework/HomeWorkQuestionCriteria.model';


import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseAdminService} from 'src/app/shared/service/admin/homework/HoweWorkQSTReponseAdmin.service';
import {TypeDeQuestionDto} from 'src/app/shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionAdminService} from 'src/app/shared/service/admin/quizref/TypeDeQuestionAdmin.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkAdminService} from 'src/app/shared/service/admin/homework/HomeWorkAdmin.service';

@Component({
  selector: 'app-home-work-question-edit-admin',
  templateUrl: './home-work-question-edit-admin.component.html'
})
export class HomeWorkQuestionEditAdminComponent implements OnInit {

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


    private _howeWorkQSTReponsesElement = new HoweWorkQSTReponseDto();

    private _validHomeWorkQuestionRef = true;
    private _validHomeWorkQuestionLibelle = true;

    private _validTypeDeQuestionRef = true;
    private _validTypeDeQuestionLib = true;
    private _validHoweWorkQSTReponsesRef = true;
    private _validHoweWorkQSTReponsesLib = true;
    private _validHomeWorkLibelle = true;



    constructor(private service: HomeWorkQuestionAdminService , private howeWorkQSTReponseService: HoweWorkQSTReponseAdminService, private typeDeQuestionService: TypeDeQuestionAdminService, private homeWorkService: HomeWorkAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {

        this.typeDeQuestionService.findAll().subscribe((data) => this.typeDeQuestions = data);
        this.homeWorkService.findAll().subscribe((data) => this.homeWorks = data);
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
            this.item = new HomeWorkQuestionDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateHoweWorkQSTReponses(){
        this.errorMessages = new Array();
        this.validateHoweWorkQSTReponsesRef();
        this.validateHoweWorkQSTReponsesLib();
    }

    public setValidation(value: boolean){
        this.validHomeWorkQuestionRef = value;
        this.validHomeWorkQuestionLibelle = value;
        this.validHoweWorkQSTReponsesRef = value;
        this.validHoweWorkQSTReponsesLib = value;
    }

   public addHoweWorkQSTReponses() {
        if( this.item.howeWorkQSTReponses == null )
            this.item.howeWorkQSTReponses = new Array<HoweWorkQSTReponseDto>();
       this.validateHoweWorkQSTReponses();
       if (this.errorMessages.length === 0) {
            if(this.howeWorkQSTReponsesElement.id == null){
                this.item.howeWorkQSTReponses.push(this.howeWorkQSTReponsesElement);
            }else{
                const index = this.item.howeWorkQSTReponses.findIndex(e => e.id == this.howeWorkQSTReponsesElement.id);
                this.item.howeWorkQSTReponses[index] = this.howeWorkQSTReponsesElement;
            }
          this.howeWorkQSTReponsesElement = new HoweWorkQSTReponseDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteHoweWorkQSTReponses(p: HoweWorkQSTReponseDto) {
        this.item.howeWorkQSTReponses.forEach((element, index) => {
            if (element === p) { this.item.howeWorkQSTReponses.splice(index, 1); }
        });
    }

    public editHoweWorkQSTReponses(p: HoweWorkQSTReponseDto) {
        this.howeWorkQSTReponsesElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateHomeWorkQuestionRef();
        this.validateHomeWorkQuestionLibelle();
    }

    public validateHomeWorkQuestionRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
            this.errorMessages.push('Ref non valide');
            this.validHomeWorkQuestionRef = false;
        } else {
            this.validHomeWorkQuestionRef = true;
        }
    }

    public validateHomeWorkQuestionLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validHomeWorkQuestionLibelle = false;
        } else {
            this.validHomeWorkQuestionLibelle = true;
        }
    }



    private validateHoweWorkQSTReponsesRef(){
        if (this.howeWorkQSTReponsesElement.ref == null) {
        this.errorMessages.push('Ref de la howeWorkQSTReponse est  invalide');
            this.validHoweWorkQSTReponsesRef = false;
        } else {
            this.validHoweWorkQSTReponsesRef = true;
        }
    }
    private validateHoweWorkQSTReponsesLib(){
        if (this.howeWorkQSTReponsesElement.lib == null) {
        this.errorMessages.push('Lib de la howeWorkQSTReponse est  invalide');
            this.validHoweWorkQSTReponsesLib = false;
        } else {
            this.validHoweWorkQSTReponsesLib = true;
        }
    }

   public async openCreateHomeWork(homeWork: string) {
        const isPermistted = await this.roleService.isPermitted('HomeWork', 'edit');
        if (isPermistted) {
             this.homeWork = new HomeWorkDto();
             this.createHomeWorkDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

    get typeDeQuestion(): TypeDeQuestionDto {
        return this.typeDeQuestionService.item;
    }
    set typeDeQuestion(value: TypeDeQuestionDto) {
        this.typeDeQuestionService.item = value;
    }
    get typeDeQuestions(): Array<TypeDeQuestionDto> {
        return this.typeDeQuestionService.items;
    }
    set typeDeQuestions(value: Array<TypeDeQuestionDto>) {
        this.typeDeQuestionService.items = value;
    }
    get createTypeDeQuestionDialog(): boolean {
        return this.typeDeQuestionService.createDialog;
    }
    set createTypeDeQuestionDialog(value: boolean) {
        this.typeDeQuestionService.createDialog= value;
    }
    get homeWork(): HomeWorkDto {
        return this.homeWorkService.item;
    }
    set homeWork(value: HomeWorkDto) {
        this.homeWorkService.item = value;
    }
    get homeWorks(): Array<HomeWorkDto> {
        return this.homeWorkService.items;
    }
    set homeWorks(value: Array<HomeWorkDto>) {
        this.homeWorkService.items = value;
    }
    get createHomeWorkDialog(): boolean {
        return this.homeWorkService.createDialog;
    }
    set createHomeWorkDialog(value: boolean) {
        this.homeWorkService.createDialog= value;
    }

    get howeWorkQSTReponsesElement(): HoweWorkQSTReponseDto {
        if( this._howeWorkQSTReponsesElement == null )
            this._howeWorkQSTReponsesElement = new HoweWorkQSTReponseDto();
         return this._howeWorkQSTReponsesElement;
    }

    set howeWorkQSTReponsesElement(value: HoweWorkQSTReponseDto) {
        this._howeWorkQSTReponsesElement = value;
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

    get validTypeDeQuestionRef(): boolean {
        return this._validTypeDeQuestionRef;
    }
    set validTypeDeQuestionRef(value: boolean) {
        this._validTypeDeQuestionRef = value;
    }
    get validTypeDeQuestionLib(): boolean {
        return this._validTypeDeQuestionLib;
    }
    set validTypeDeQuestionLib(value: boolean) {
        this._validTypeDeQuestionLib = value;
    }
    get validHoweWorkQSTReponsesRef(): boolean {
        return this._validHoweWorkQSTReponsesRef;
    }
    set validHoweWorkQSTReponsesRef(value: boolean) {
        this._validHoweWorkQSTReponsesRef = value;
    }
    get validHoweWorkQSTReponsesLib(): boolean {
        return this._validHoweWorkQSTReponsesLib;
    }
    set validHoweWorkQSTReponsesLib(value: boolean) {
        this._validHoweWorkQSTReponsesLib = value;
    }
    get validHomeWorkLibelle(): boolean {
        return this._validHomeWorkLibelle;
    }
    set validHomeWorkLibelle(value: boolean) {
        this._validHomeWorkLibelle = value;
    }

	get items(): Array<HomeWorkQuestionDto> {
        return this.service.items;
    }

    set items(value: Array<HomeWorkQuestionDto>) {
        this.service.items = value;
    }

    get item(): HomeWorkQuestionDto {
        return this.service.item;
    }

    set item(value: HomeWorkQuestionDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): HomeWorkQuestionCriteria {
        return this.service.criteria;
    }

    set criteria(value: HomeWorkQuestionCriteria) {
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
