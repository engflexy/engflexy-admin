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




import {CoursCollaboratorService} from 'src/app/shared/service/collaborator/course/CoursCollaborator.service';
import {CoursDto} from 'src/app/shared/model/course/Cours.model';
import {CoursCriteria} from 'src/app/shared/criteria/course/CoursCriteria.model';


import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from 'src/app/shared/service/collaborator/course/ParcoursCollaborator.service';
import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuizCollaborator.service';
import {HomeWorkEtudiantDto} from 'src/app/shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkEtudiantCollaborator.service';
import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';
import {EtatCoursDto} from 'src/app/shared/model/courseref/EtatCours.model';
import {EtatCoursCollaboratorService} from 'src/app/shared/service/collaborator/courseref/EtatCoursCollaborator.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCollaboratorService} from 'src/app/shared/service/collaborator/course/SectionCollaborator.service';
import {ExerciceDto} from 'src/app/shared/model/course/Exercice.model';
import {ExerciceCollaboratorService} from 'src/app/shared/service/collaborator/course/ExerciceCollaborator.service';
import {TypeHomeWorkDto} from 'src/app/shared/model/homework/TypeHomeWork.model';
import {TypeHomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/TypeHomeWorkCollaborator.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkCollaborator.service';

@Component({
  selector: 'app-cours-edit-collaborator',
  templateUrl: './cours-edit-collaborator.component.html'
})
export class CoursEditCollaboratorComponent implements OnInit {

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
    private _homeWorksElement = new HomeWorkDto();

    private _validCoursCode = true;
    private _validCoursLibelle = true;

    private _validEtatCoursCode = true;
    private _validEtatCoursLibelle = true;
    private _validParcoursCode = true;
    private _validParcoursLibelle = true;
    private _validSectionsCode = true;
    private _validSectionsLibelle = true;
    private _validHomeWorksLibelle = true;



    constructor(private service: CoursCollaboratorService , private parcoursService: ParcoursCollaboratorService, private etatCoursService: EtatCoursCollaboratorService, private sectionService: SectionCollaboratorService, private typeHomeWorkService: TypeHomeWorkCollaboratorService, private homeWorkService: HomeWorkCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {

        this.homeWorksElement.typeHomeWork = new TypeHomeWorkDto();
        this.typeHomeWorkService.findAll().subscribe((data) => this.typeHomeWorks = data);

        this.etatCoursService.findAll().subscribe((data) => this.etatCourss = data);
        this.parcoursService.findAll().subscribe((data) => this.parcourss = data);
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
            this.item = new CoursDto();
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

    public validateHomeWorks(){
        this.errorMessages = new Array();
        this.validateHomeWorksLibelle();
    }

    public setValidation(value: boolean){
        this.validCoursCode = value;
        this.validCoursLibelle = value;
        this.validSectionsCode = value;
        this.validSectionsLibelle = value;
        this.validHomeWorksLibelle = value;
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


   public addHomeWorks() {
        if( this.item.homeWorks == null )
            this.item.homeWorks = new Array<HomeWorkDto>();
       this.validateHomeWorks();
       if (this.errorMessages.length === 0) {
            if(this.homeWorksElement.id == null){
                this.item.homeWorks.push(this.homeWorksElement);
            }else{
                const index = this.item.homeWorks.findIndex(e => e.id == this.homeWorksElement.id);
                this.item.homeWorks[index] = this.homeWorksElement;
            }
          this.homeWorksElement = new HomeWorkDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteHomeWorks(p: HomeWorkDto) {
        this.item.homeWorks.forEach((element, index) => {
            if (element === p) { this.item.homeWorks.splice(index, 1); }
        });
    }

    public editHomeWorks(p: HomeWorkDto) {
        this.homeWorksElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateCoursCode();
        this.validateCoursLibelle();
    }

    public validateCoursCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validCoursCode = false;
        } else {
            this.validCoursCode = true;
        }
    }

    public validateCoursLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validCoursLibelle = false;
        } else {
            this.validCoursLibelle = true;
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
    private validateHomeWorksLibelle(){
        if (this.homeWorksElement.libelle == null) {
        this.errorMessages.push('Libelle de la homeWork est  invalide');
            this.validHomeWorksLibelle = false;
        } else {
            this.validHomeWorksLibelle = true;
        }
    }

   public async openCreateParcours(parcours: string) {
        const isPermistted = await this.roleService.isPermitted('Parcours', 'edit');
        if (isPermistted) {
             this.parcours = new ParcoursDto();
             this.createParcoursDialog = true;
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
    get etatCours(): EtatCoursDto {
        return this.etatCoursService.item;
    }
    set etatCours(value: EtatCoursDto) {
        this.etatCoursService.item = value;
    }
    get etatCourss(): Array<EtatCoursDto> {
        return this.etatCoursService.items;
    }
    set etatCourss(value: Array<EtatCoursDto>) {
        this.etatCoursService.items = value;
    }
    get createEtatCoursDialog(): boolean {
        return this.etatCoursService.createDialog;
    }
    set createEtatCoursDialog(value: boolean) {
        this.etatCoursService.createDialog= value;
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

    get sectionsElement(): SectionDto {
        if( this._sectionsElement == null )
            this._sectionsElement = new SectionDto();
         return this._sectionsElement;
    }

    set sectionsElement(value: SectionDto) {
        this._sectionsElement = value;
    }
    get homeWorksElement(): HomeWorkDto {
        if( this._homeWorksElement == null )
            this._homeWorksElement = new HomeWorkDto();
         return this._homeWorksElement;
    }

    set homeWorksElement(value: HomeWorkDto) {
        this._homeWorksElement = value;
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

    get validEtatCoursCode(): boolean {
        return this._validEtatCoursCode;
    }
    set validEtatCoursCode(value: boolean) {
        this._validEtatCoursCode = value;
    }
    get validEtatCoursLibelle(): boolean {
        return this._validEtatCoursLibelle;
    }
    set validEtatCoursLibelle(value: boolean) {
        this._validEtatCoursLibelle = value;
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
    get validHomeWorksLibelle(): boolean {
        return this._validHomeWorksLibelle;
    }
    set validHomeWorksLibelle(value: boolean) {
        this._validHomeWorksLibelle = value;
    }

	get items(): Array<CoursDto> {
        return this.service.items;
    }

    set items(value: Array<CoursDto>) {
        this.service.items = value;
    }

    get item(): CoursDto {
        return this.service.item;
    }

    set item(value: CoursDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): CoursCriteria {
        return this.service.criteria;
    }

    set criteria(value: CoursCriteria) {
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
