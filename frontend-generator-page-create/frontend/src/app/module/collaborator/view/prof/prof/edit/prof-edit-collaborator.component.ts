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




import {ProfCollaboratorService} from 'src/app/shared/service/collaborator/prof/ProfCollaborator.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfCriteria} from 'src/app/shared/criteria/prof/ProfCriteria.model';


import {CollaboratorDto} from 'src/app/shared/model/vocab/Collaborator.model';
import {CollaboratorCollaboratorService} from 'src/app/shared/service/collaborator/vocab/CollaboratorCollaborator.service';
import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from 'src/app/shared/service/collaborator/course/ParcoursCollaborator.service';
import {TypeTeacherDto} from 'src/app/shared/model/prof/TypeTeacher.model';
import {TypeTeacherCollaboratorService} from 'src/app/shared/service/collaborator/prof/TypeTeacherCollaborator.service';
import {RecommendTeacherDto} from 'src/app/shared/model/recomrecla/RecommendTeacher.model';
import {RecommendTeacherCollaboratorService} from 'src/app/shared/service/collaborator/recomrecla/RecommendTeacherCollaborator.service';
import {CategorieProfDto} from 'src/app/shared/model/prof/CategorieProf.model';
import {CategorieProfCollaboratorService} from 'src/app/shared/service/collaborator/prof/CategorieProfCollaborator.service';
import {TrancheHoraireProfDto} from 'src/app/shared/model/prof/TrancheHoraireProf.model';
import {TrancheHoraireProfCollaboratorService} from 'src/app/shared/service/collaborator/prof/TrancheHoraireProfCollaborator.service';

@Component({
  selector: 'app-prof-edit-collaborator',
  templateUrl: './prof-edit-collaborator.component.html'
})
export class ProfEditCollaboratorComponent implements OnInit {

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


    private _trancheHoraireProfsElement = new TrancheHoraireProfDto();
    private _recommendTeachersElement = new RecommendTeacherDto();

    private _validProfRef = true;

    private _validParcoursCode = true;
    private _validParcoursLibelle = true;
    private _validCategorieProfCode = true;
    private _validRecommendTeachersRef = true;
    private _validTypeTeacherLibelle = true;
    private _validTypeTeacherCode = true;



    constructor(private service: ProfCollaboratorService , private collaboratorService: CollaboratorCollaboratorService, private parcoursService: ParcoursCollaboratorService, private typeTeacherService: TypeTeacherCollaboratorService, private recommendTeacherService: RecommendTeacherCollaboratorService, private categorieProfService: CategorieProfCollaboratorService, private trancheHoraireProfService: TrancheHoraireProfCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {


        this.parcoursService.findAll().subscribe((data) => this.parcourss = data);
        this.categorieProfService.findAll().subscribe((data) => this.categorieProfs = data);
        this.typeTeacherService.findAll().subscribe((data) => this.typeTeachers = data);
        this.collaboratorService.findAll().subscribe((data) => this.collaborators = data);
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
            this.item = new ProfDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateTrancheHoraireProfs(){
        this.errorMessages = new Array();
    }

    public validateRecommendTeachers(){
        this.errorMessages = new Array();
        this.validateRecommendTeachersRef();
    }

    public setValidation(value: boolean){
        this.validProfRef = value;
        this.validRecommendTeachersRef = value;
    }

   public addTrancheHoraireProfs() {
        if( this.item.trancheHoraireProfs == null )
            this.item.trancheHoraireProfs = new Array<TrancheHoraireProfDto>();
       this.validateTrancheHoraireProfs();
       if (this.errorMessages.length === 0) {
            if(this.trancheHoraireProfsElement.id == null){
                this.item.trancheHoraireProfs.push(this.trancheHoraireProfsElement);
            }else{
                const index = this.item.trancheHoraireProfs.findIndex(e => e.id == this.trancheHoraireProfsElement.id);
                this.item.trancheHoraireProfs[index] = this.trancheHoraireProfsElement;
            }
          this.trancheHoraireProfsElement = new TrancheHoraireProfDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteTrancheHoraireProfs(p: TrancheHoraireProfDto) {
        this.item.trancheHoraireProfs.forEach((element, index) => {
            if (element === p) { this.item.trancheHoraireProfs.splice(index, 1); }
        });
    }

    public editTrancheHoraireProfs(p: TrancheHoraireProfDto) {
        this.trancheHoraireProfsElement = {... p};
        this.activeTab = 0;
    }


   public addRecommendTeachers() {
        if( this.item.recommendTeachers == null )
            this.item.recommendTeachers = new Array<RecommendTeacherDto>();
       this.validateRecommendTeachers();
       if (this.errorMessages.length === 0) {
            if(this.recommendTeachersElement.id == null){
                this.item.recommendTeachers.push(this.recommendTeachersElement);
            }else{
                const index = this.item.recommendTeachers.findIndex(e => e.id == this.recommendTeachersElement.id);
                this.item.recommendTeachers[index] = this.recommendTeachersElement;
            }
          this.recommendTeachersElement = new RecommendTeacherDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteRecommendTeachers(p: RecommendTeacherDto) {
        this.item.recommendTeachers.forEach((element, index) => {
            if (element === p) { this.item.recommendTeachers.splice(index, 1); }
        });
    }

    public editRecommendTeachers(p: RecommendTeacherDto) {
        this.recommendTeachersElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateProfRef();
    }

    public validateProfRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
            this.errorMessages.push('Ref non valide');
            this.validProfRef = false;
        } else {
            this.validProfRef = true;
        }
    }



    private validateRecommendTeachersRef(){
        if (this.recommendTeachersElement.ref == null) {
        this.errorMessages.push('Ref de la recommendTeacher est  invalide');
            this.validRecommendTeachersRef = false;
        } else {
            this.validRecommendTeachersRef = true;
        }
    }

   public async openCreateTypeTeacher(typeTeacher: string) {
        const isPermistted = await this.roleService.isPermitted('TypeTeacher', 'edit');
        if (isPermistted) {
             this.typeTeacher = new TypeTeacherDto();
             this.createTypeTeacherDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }
   public async openCreateCategorieProf(categorieProf: string) {
        const isPermistted = await this.roleService.isPermitted('CategorieProf', 'edit');
        if (isPermistted) {
             this.categorieProf = new CategorieProfDto();
             this.createCategorieProfDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

    get parcours(): ParcoursDto {
        return this.parcoursService.item;
    }
    set parcours(value: ParcoursDto) {
        this.parcoursService.item = value;
    }
    get parcourss(): Array<ParcoursDto> {
        return this.parcoursService.items;
    }
    set parcourss(value: Array<ParcoursDto>) {
        this.parcoursService.items = value;
    }
    get createParcoursDialog(): boolean {
        return this.parcoursService.createDialog;
    }
    set createParcoursDialog(value: boolean) {
        this.parcoursService.createDialog= value;
    }
    get collaborator(): CollaboratorDto {
        return this.collaboratorService.item;
    }
    set collaborator(value: CollaboratorDto) {
        this.collaboratorService.item = value;
    }
    get collaborators(): Array<CollaboratorDto> {
        return this.collaboratorService.items;
    }
    set collaborators(value: Array<CollaboratorDto>) {
        this.collaboratorService.items = value;
    }
    get createCollaboratorDialog(): boolean {
        return this.collaboratorService.createDialog;
    }
    set createCollaboratorDialog(value: boolean) {
        this.collaboratorService.createDialog= value;
    }
    get typeTeacher(): TypeTeacherDto {
        return this.typeTeacherService.item;
    }
    set typeTeacher(value: TypeTeacherDto) {
        this.typeTeacherService.item = value;
    }
    get typeTeachers(): Array<TypeTeacherDto> {
        return this.typeTeacherService.items;
    }
    set typeTeachers(value: Array<TypeTeacherDto>) {
        this.typeTeacherService.items = value;
    }
    get createTypeTeacherDialog(): boolean {
        return this.typeTeacherService.createDialog;
    }
    set createTypeTeacherDialog(value: boolean) {
        this.typeTeacherService.createDialog= value;
    }
    get categorieProf(): CategorieProfDto {
        return this.categorieProfService.item;
    }
    set categorieProf(value: CategorieProfDto) {
        this.categorieProfService.item = value;
    }
    get categorieProfs(): Array<CategorieProfDto> {
        return this.categorieProfService.items;
    }
    set categorieProfs(value: Array<CategorieProfDto>) {
        this.categorieProfService.items = value;
    }
    get createCategorieProfDialog(): boolean {
        return this.categorieProfService.createDialog;
    }
    set createCategorieProfDialog(value: boolean) {
        this.categorieProfService.createDialog= value;
    }

    get trancheHoraireProfsElement(): TrancheHoraireProfDto {
        if( this._trancheHoraireProfsElement == null )
            this._trancheHoraireProfsElement = new TrancheHoraireProfDto();
         return this._trancheHoraireProfsElement;
    }

    set trancheHoraireProfsElement(value: TrancheHoraireProfDto) {
        this._trancheHoraireProfsElement = value;
    }
    get recommendTeachersElement(): RecommendTeacherDto {
        if( this._recommendTeachersElement == null )
            this._recommendTeachersElement = new RecommendTeacherDto();
         return this._recommendTeachersElement;
    }

    set recommendTeachersElement(value: RecommendTeacherDto) {
        this._recommendTeachersElement = value;
    }

    get validProfRef(): boolean {
        return this._validProfRef;
    }
    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }

    get validParcoursCode(): boolean {
        return this._validParcoursCode;
    }
    set validParcoursCode(value: boolean) {
        this._validParcoursCode = value;
    }
    get validParcoursLibelle(): boolean {
        return this._validParcoursLibelle;
    }
    set validParcoursLibelle(value: boolean) {
        this._validParcoursLibelle = value;
    }
    get validCategorieProfCode(): boolean {
        return this._validCategorieProfCode;
    }
    set validCategorieProfCode(value: boolean) {
        this._validCategorieProfCode = value;
    }
    get validRecommendTeachersRef(): boolean {
        return this._validRecommendTeachersRef;
    }
    set validRecommendTeachersRef(value: boolean) {
        this._validRecommendTeachersRef = value;
    }
    get validTypeTeacherLibelle(): boolean {
        return this._validTypeTeacherLibelle;
    }
    set validTypeTeacherLibelle(value: boolean) {
        this._validTypeTeacherLibelle = value;
    }
    get validTypeTeacherCode(): boolean {
        return this._validTypeTeacherCode;
    }
    set validTypeTeacherCode(value: boolean) {
        this._validTypeTeacherCode = value;
    }

	get items(): Array<ProfDto> {
        return this.service.items;
    }

    set items(value: Array<ProfDto>) {
        this.service.items = value;
    }

    get item(): ProfDto {
        return this.service.item;
    }

    set item(value: ProfDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): ProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: ProfCriteria) {
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
