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




import {HomeWorkEtudiantAdminService} from 'src/app/shared/service/admin/homework/HomeWorkEtudiantAdmin.service';
import {HomeWorkEtudiantDto} from 'src/app/shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCriteria} from 'src/app/shared/criteria/homework/HomeWorkEtudiantCriteria.model';


import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseAdminService} from 'src/app/shared/service/admin/homework/HoweWorkQSTReponseAdmin.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {ReponseEtudiantHomeWorkDto} from 'src/app/shared/model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkAdminService} from 'src/app/shared/service/admin/homework/ReponseEtudiantHomeWorkAdmin.service';
import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionAdminService} from 'src/app/shared/service/admin/homework/HomeWorkQuestionAdmin.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkAdminService} from 'src/app/shared/service/admin/homework/HomeWorkAdmin.service';

@Component({
  selector: 'app-home-work-etudiant-edit-admin',
  templateUrl: './home-work-etudiant-edit-admin.component.html'
})
export class HomeWorkEtudiantEditAdminComponent implements OnInit {

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


    private _reponseEtudiantHomeWorksElement = new ReponseEtudiantHomeWorkDto();


    private _validHomeWorkLibelle = true;



    constructor(private service: HomeWorkEtudiantAdminService , private howeWorkQSTReponseService: HoweWorkQSTReponseAdminService, private etudiantService: EtudiantAdminService, private reponseEtudiantHomeWorkService: ReponseEtudiantHomeWorkAdminService, private homeWorkQuestionService: HomeWorkQuestionAdminService, private homeWorkService: HomeWorkAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.reponseEtudiantHomeWorksElement.howeWorkQSTReponse = new HoweWorkQSTReponseDto();
        this.howeWorkQSTReponseService.findAll().subscribe((data) => this.howeWorkQSTReponses = data);
        this.reponseEtudiantHomeWorksElement.homeWorkQuestion = new HomeWorkQuestionDto();
        this.homeWorkQuestionService.findAll().subscribe((data) => this.homeWorkQuestions = data);

        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
        this.homeWorkService.findAll().subscribe((data) => this.homeWorks = data);
    }

    public prepareEdit() {
        this.item.dateHomeWork = this.service.format(this.item.dateHomeWork);
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
            this.item = new HomeWorkEtudiantDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateReponseEtudiantHomeWorks(){
        this.errorMessages = new Array();
    }

    public setValidation(value: boolean){
    }

   public addReponseEtudiantHomeWorks() {
        if( this.item.reponseEtudiantHomeWorks == null )
            this.item.reponseEtudiantHomeWorks = new Array<ReponseEtudiantHomeWorkDto>();
       this.validateReponseEtudiantHomeWorks();
       if (this.errorMessages.length === 0) {
            if(this.reponseEtudiantHomeWorksElement.id == null){
                this.item.reponseEtudiantHomeWorks.push(this.reponseEtudiantHomeWorksElement);
            }else{
                const index = this.item.reponseEtudiantHomeWorks.findIndex(e => e.id == this.reponseEtudiantHomeWorksElement.id);
                this.item.reponseEtudiantHomeWorks[index] = this.reponseEtudiantHomeWorksElement;
            }
          this.reponseEtudiantHomeWorksElement = new ReponseEtudiantHomeWorkDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteReponseEtudiantHomeWorks(p: ReponseEtudiantHomeWorkDto) {
        this.item.reponseEtudiantHomeWorks.forEach((element, index) => {
            if (element === p) { this.item.reponseEtudiantHomeWorks.splice(index, 1); }
        });
    }

    public editReponseEtudiantHomeWorks(p: ReponseEtudiantHomeWorkDto) {
        this.reponseEtudiantHomeWorksElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
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

    get etudiant(): EtudiantDto {
        return this.etudiantService.item;
    }
    set etudiant(value: EtudiantDto) {
        this.etudiantService.item = value;
    }
    get etudiants(): Array<EtudiantDto> {
        return this.etudiantService.items;
    }
    set etudiants(value: Array<EtudiantDto>) {
        this.etudiantService.items = value;
    }
    get createEtudiantDialog(): boolean {
        return this.etudiantService.createDialog;
    }
    set createEtudiantDialog(value: boolean) {
        this.etudiantService.createDialog= value;
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

    get reponseEtudiantHomeWorksElement(): ReponseEtudiantHomeWorkDto {
        if( this._reponseEtudiantHomeWorksElement == null )
            this._reponseEtudiantHomeWorksElement = new ReponseEtudiantHomeWorkDto();
         return this._reponseEtudiantHomeWorksElement;
    }

    set reponseEtudiantHomeWorksElement(value: ReponseEtudiantHomeWorkDto) {
        this._reponseEtudiantHomeWorksElement = value;
    }


    get validHomeWorkLibelle(): boolean {
        return this._validHomeWorkLibelle;
    }
    set validHomeWorkLibelle(value: boolean) {
        this._validHomeWorkLibelle = value;
    }

	get items(): Array<HomeWorkEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<HomeWorkEtudiantDto>) {
        this.service.items = value;
    }

    get item(): HomeWorkEtudiantDto {
        return this.service.item;
    }

    set item(value: HomeWorkEtudiantDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): HomeWorkEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: HomeWorkEtudiantCriteria) {
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
