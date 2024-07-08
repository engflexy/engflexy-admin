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




import {HomeWorkAdminService} from 'src/app/shared/service/admin/homework/HomeWorkAdmin.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkCriteria} from 'src/app/shared/criteria/homework/HomeWorkCriteria.model';


import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseAdminService} from 'src/app/shared/service/admin/homework/HoweWorkQSTReponseAdmin.service';
import {TypeDeQuestionDto} from 'src/app/shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionAdminService} from 'src/app/shared/service/admin/quizref/TypeDeQuestionAdmin.service';
import {HomeWorkEtudiantDto} from 'src/app/shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantAdminService} from 'src/app/shared/service/admin/homework/HomeWorkEtudiantAdmin.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {ReponseEtudiantHomeWorkDto} from 'src/app/shared/model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkAdminService} from 'src/app/shared/service/admin/homework/ReponseEtudiantHomeWorkAdmin.service';
import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionAdminService} from 'src/app/shared/service/admin/homework/HomeWorkQuestionAdmin.service';
import {TypeHomeWorkDto} from 'src/app/shared/model/homework/TypeHomeWork.model';
import {TypeHomeWorkAdminService} from 'src/app/shared/service/admin/homework/TypeHomeWorkAdmin.service';
import {CoursDto} from 'src/app/shared/model/course/Cours.model';
import {CoursAdminService} from 'src/app/shared/service/admin/course/CoursAdmin.service';

@Component({
  selector: 'app-home-work-edit-admin',
  templateUrl: './home-work-edit-admin.component.html'
})
export class HomeWorkEditAdminComponent implements OnInit {

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


    private _homeWorkQuestionsElement = new HomeWorkQuestionDto();
    private _homeWorkEtudiantsElement = new HomeWorkEtudiantDto();

    private _validHomeWorkLibelle = true;

    private _validHomeWorkQuestionsRef = true;
    private _validHomeWorkQuestionsLibelle = true;
    private _validCoursCode = true;
    private _validCoursLibelle = true;
    private _validTypeHomeWorkCode = true;
    private _validTypeHomeWorkLib = true;



    constructor(private service: HomeWorkAdminService , private typeDeQuestionService: TypeDeQuestionAdminService, private homeWorkEtudiantService: HomeWorkEtudiantAdminService, private etudiantService: EtudiantAdminService, private homeWorkQuestionService: HomeWorkQuestionAdminService, private typeHomeWorkService: TypeHomeWorkAdminService, private coursService: CoursAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.homeWorkQuestionsElement.typeDeQuestion = new TypeDeQuestionDto();
        this.typeDeQuestionService.findAll().subscribe((data) => this.typeDeQuestions = data);

        this.homeWorkEtudiantsElement.etudiant = new EtudiantDto();
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);

        this.coursService.findAll().subscribe((data) => this.courss = data);
        this.typeHomeWorkService.findAll().subscribe((data) => this.typeHomeWorks = data);
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
            this.item = new HomeWorkDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateHomeWorkQuestions(){
        this.errorMessages = new Array();
        this.validateHomeWorkQuestionsRef();
        this.validateHomeWorkQuestionsLibelle();
    }

    public validateHomeWorkEtudiants(){
        this.errorMessages = new Array();
    }

    public setValidation(value: boolean){
        this.validHomeWorkLibelle = value;
        this.validHomeWorkQuestionsRef = value;
        this.validHomeWorkQuestionsLibelle = value;
    }

   public addHomeWorkQuestions() {
        if( this.item.homeWorkQuestions == null )
            this.item.homeWorkQuestions = new Array<HomeWorkQuestionDto>();
       this.validateHomeWorkQuestions();
       if (this.errorMessages.length === 0) {
            if(this.homeWorkQuestionsElement.id == null){
                this.item.homeWorkQuestions.push(this.homeWorkQuestionsElement);
            }else{
                const index = this.item.homeWorkQuestions.findIndex(e => e.id == this.homeWorkQuestionsElement.id);
                this.item.homeWorkQuestions[index] = this.homeWorkQuestionsElement;
            }
          this.homeWorkQuestionsElement = new HomeWorkQuestionDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteHomeWorkQuestions(p: HomeWorkQuestionDto) {
        this.item.homeWorkQuestions.forEach((element, index) => {
            if (element === p) { this.item.homeWorkQuestions.splice(index, 1); }
        });
    }

    public editHomeWorkQuestions(p: HomeWorkQuestionDto) {
        this.homeWorkQuestionsElement = {... p};
        this.activeTab = 0;
    }


   public addHomeWorkEtudiants() {
        if( this.item.homeWorkEtudiants == null )
            this.item.homeWorkEtudiants = new Array<HomeWorkEtudiantDto>();
       this.validateHomeWorkEtudiants();
       if (this.errorMessages.length === 0) {
            if(this.homeWorkEtudiantsElement.id == null){
                this.item.homeWorkEtudiants.push(this.homeWorkEtudiantsElement);
            }else{
                const index = this.item.homeWorkEtudiants.findIndex(e => e.id == this.homeWorkEtudiantsElement.id);
                this.item.homeWorkEtudiants[index] = this.homeWorkEtudiantsElement;
            }
          this.homeWorkEtudiantsElement = new HomeWorkEtudiantDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteHomeWorkEtudiants(p: HomeWorkEtudiantDto) {
        this.item.homeWorkEtudiants.forEach((element, index) => {
            if (element === p) { this.item.homeWorkEtudiants.splice(index, 1); }
        });
    }

    public editHomeWorkEtudiants(p: HomeWorkEtudiantDto) {
        this.homeWorkEtudiantsElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateHomeWorkLibelle();
    }

    public validateHomeWorkLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validHomeWorkLibelle = false;
        } else {
            this.validHomeWorkLibelle = true;
        }
    }



    private validateHomeWorkQuestionsRef(){
        if (this.homeWorkQuestionsElement.ref == null) {
        this.errorMessages.push('Ref de la homeWorkQuestion est  invalide');
            this.validHomeWorkQuestionsRef = false;
        } else {
            this.validHomeWorkQuestionsRef = true;
        }
    }
    private validateHomeWorkQuestionsLibelle(){
        if (this.homeWorkQuestionsElement.libelle == null) {
        this.errorMessages.push('Libelle de la homeWorkQuestion est  invalide');
            this.validHomeWorkQuestionsLibelle = false;
        } else {
            this.validHomeWorkQuestionsLibelle = true;
        }
    }

   public async openCreateTypeHomeWork(typeHomeWork: string) {
        const isPermistted = await this.roleService.isPermitted('TypeHomeWork', 'edit');
        if (isPermistted) {
             this.typeHomeWork = new TypeHomeWorkDto();
             this.createTypeHomeWorkDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

    get typeHomeWork(): TypeHomeWorkDto {
        return this.typeHomeWorkService.item;
    }
    set typeHomeWork(value: TypeHomeWorkDto) {
        this.typeHomeWorkService.item = value;
    }
    get typeHomeWorks(): Array<TypeHomeWorkDto> {
        return this.typeHomeWorkService.items;
    }
    set typeHomeWorks(value: Array<TypeHomeWorkDto>) {
        this.typeHomeWorkService.items = value;
    }
    get createTypeHomeWorkDialog(): boolean {
        return this.typeHomeWorkService.createDialog;
    }
    set createTypeHomeWorkDialog(value: boolean) {
        this.typeHomeWorkService.createDialog= value;
    }
    get cours(): CoursDto {
        return this.coursService.item;
    }
    set cours(value: CoursDto) {
        this.coursService.item = value;
    }
    get courss(): Array<CoursDto> {
        return this.coursService.items;
    }
    set courss(value: Array<CoursDto>) {
        this.coursService.items = value;
    }
    get createCoursDialog(): boolean {
        return this.coursService.createDialog;
    }
    set createCoursDialog(value: boolean) {
        this.coursService.createDialog= value;
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

    get homeWorkQuestionsElement(): HomeWorkQuestionDto {
        if( this._homeWorkQuestionsElement == null )
            this._homeWorkQuestionsElement = new HomeWorkQuestionDto();
         return this._homeWorkQuestionsElement;
    }

    set homeWorkQuestionsElement(value: HomeWorkQuestionDto) {
        this._homeWorkQuestionsElement = value;
    }
    get homeWorkEtudiantsElement(): HomeWorkEtudiantDto {
        if( this._homeWorkEtudiantsElement == null )
            this._homeWorkEtudiantsElement = new HomeWorkEtudiantDto();
         return this._homeWorkEtudiantsElement;
    }

    set homeWorkEtudiantsElement(value: HomeWorkEtudiantDto) {
        this._homeWorkEtudiantsElement = value;
    }

    get validHomeWorkLibelle(): boolean {
        return this._validHomeWorkLibelle;
    }
    set validHomeWorkLibelle(value: boolean) {
        this._validHomeWorkLibelle = value;
    }

    get validHomeWorkQuestionsRef(): boolean {
        return this._validHomeWorkQuestionsRef;
    }
    set validHomeWorkQuestionsRef(value: boolean) {
        this._validHomeWorkQuestionsRef = value;
    }
    get validHomeWorkQuestionsLibelle(): boolean {
        return this._validHomeWorkQuestionsLibelle;
    }
    set validHomeWorkQuestionsLibelle(value: boolean) {
        this._validHomeWorkQuestionsLibelle = value;
    }
    get validCoursCode(): boolean {
        return this._validCoursCode;
    }
    set validCoursCode(value: boolean) {
        this._validCoursCode = value;
    }
    get validCoursLibelle(): boolean {
        return this._validCoursLibelle;
    }
    set validCoursLibelle(value: boolean) {
        this._validCoursLibelle = value;
    }
    get validTypeHomeWorkCode(): boolean {
        return this._validTypeHomeWorkCode;
    }
    set validTypeHomeWorkCode(value: boolean) {
        this._validTypeHomeWorkCode = value;
    }
    get validTypeHomeWorkLib(): boolean {
        return this._validTypeHomeWorkLib;
    }
    set validTypeHomeWorkLib(value: boolean) {
        this._validTypeHomeWorkLib = value;
    }

	get items(): Array<HomeWorkDto> {
        return this.service.items;
    }

    set items(value: Array<HomeWorkDto>) {
        this.service.items = value;
    }

    get item(): HomeWorkDto {
        return this.service.item;
    }

    set item(value: HomeWorkDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): HomeWorkCriteria {
        return this.service.criteria;
    }

    set criteria(value: HomeWorkCriteria) {
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
