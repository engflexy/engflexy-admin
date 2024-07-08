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




import {ParcoursCollaboratorService} from 'src/app/shared/service/collaborator/course/ParcoursCollaborator.service';
import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursCriteria} from 'src/app/shared/criteria/course/ParcoursCriteria.model';


import {CollaboratorDto} from 'src/app/shared/model/vocab/Collaborator.model';
import {CollaboratorCollaboratorService} from 'src/app/shared/service/collaborator/vocab/CollaboratorCollaborator.service';
import {EtatCoursDto} from 'src/app/shared/model/courseref/EtatCours.model';
import {EtatCoursCollaboratorService} from 'src/app/shared/service/collaborator/courseref/EtatCoursCollaborator.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCollaboratorService} from 'src/app/shared/service/collaborator/course/SectionCollaborator.service';
import {CoursDto} from 'src/app/shared/model/course/Cours.model';
import {CoursCollaboratorService} from 'src/app/shared/service/collaborator/course/CoursCollaborator.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkCollaborator.service';

@Component({
  selector: 'app-parcours-edit-collaborator',
  templateUrl: './parcours-edit-collaborator.component.html'
})
export class ParcoursEditCollaboratorComponent implements OnInit {

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


    private _courssElement = new CoursDto();

    private _validParcoursCode = true;
    private _validParcoursLibelle = true;

    private _validCourssCode = true;
    private _validCourssLibelle = true;



    constructor(private service: ParcoursCollaboratorService , private collaboratorService: CollaboratorCollaboratorService, private etatCoursService: EtatCoursCollaboratorService, private coursService: CoursCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.courssElement.etatCours = new EtatCoursDto();
        this.etatCoursService.findAll().subscribe((data) => this.etatCourss = data);

        this.collaboratorService.findAll().subscribe((data) => this.collaborators = data);
    }

    public prepareEdit() {
        this.item.datePublication = this.service.format(this.item.datePublication);
        this.item.dateCreation = this.service.format(this.item.dateCreation);
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
            this.item = new ParcoursDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateCourss(){
        this.errorMessages = new Array();
        this.validateCourssCode();
        this.validateCourssLibelle();
    }

    public setValidation(value: boolean){
        this.validParcoursCode = value;
        this.validParcoursLibelle = value;
        this.validCourssCode = value;
        this.validCourssLibelle = value;
    }

   public addCourss() {
        if( this.item.courss == null )
            this.item.courss = new Array<CoursDto>();
       this.validateCourss();
       if (this.errorMessages.length === 0) {
            if(this.courssElement.id == null){
                this.item.courss.push(this.courssElement);
            }else{
                const index = this.item.courss.findIndex(e => e.id == this.courssElement.id);
                this.item.courss[index] = this.courssElement;
            }
          this.courssElement = new CoursDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteCourss(p: CoursDto) {
        this.item.courss.forEach((element, index) => {
            if (element === p) { this.item.courss.splice(index, 1); }
        });
    }

    public editCourss(p: CoursDto) {
        this.courssElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateParcoursCode();
        this.validateParcoursLibelle();
    }

    public validateParcoursCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validParcoursCode = false;
        } else {
            this.validParcoursCode = true;
        }
    }

    public validateParcoursLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validParcoursLibelle = false;
        } else {
            this.validParcoursLibelle = true;
        }
    }



    private validateCourssCode(){
        if (this.courssElement.code == null) {
        this.errorMessages.push('Code de la cours est  invalide');
            this.validCourssCode = false;
        } else {
            this.validCourssCode = true;
        }
    }
    private validateCourssLibelle(){
        if (this.courssElement.libelle == null) {
        this.errorMessages.push('Libelle de la cours est  invalide');
            this.validCourssLibelle = false;
        } else {
            this.validCourssLibelle = true;
        }
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

    get courssElement(): CoursDto {
        if( this._courssElement == null )
            this._courssElement = new CoursDto();
         return this._courssElement;
    }

    set courssElement(value: CoursDto) {
        this._courssElement = value;
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

    get validCourssCode(): boolean {
        return this._validCourssCode;
    }
    set validCourssCode(value: boolean) {
        this._validCourssCode = value;
    }
    get validCourssLibelle(): boolean {
        return this._validCourssLibelle;
    }
    set validCourssLibelle(value: boolean) {
        this._validCourssLibelle = value;
    }

	get items(): Array<ParcoursDto> {
        return this.service.items;
    }

    set items(value: Array<ParcoursDto>) {
        this.service.items = value;
    }

    get item(): ParcoursDto {
        return this.service.item;
    }

    set item(value: ParcoursDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): ParcoursCriteria {
        return this.service.criteria;
    }

    set criteria(value: ParcoursCriteria) {
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
