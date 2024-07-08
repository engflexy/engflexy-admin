import {Component, OnInit} from '@angular/core';

import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {NgForOf, NgIf} from "@angular/common";

import {FuseAlertService} from "../../../../../@fuse/components/alert";

import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatIconModule} from "@angular/material/icon";
import {MatTooltipModule} from "@angular/material/tooltip";

import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";



import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';


import {environment} from '../../../../../environments/environment';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';
import {StringUtilService} from '../../../../zynerator/util/StringUtil.service';
import {ServiceLocator} from '../../../../zynerator/service/ServiceLocator';

import {FormsModule} from "@angular/forms";
import {MatCheckboxModule} from "@angular/material/checkbox

import {TranslocoModule} from "@ngneat/transloco";



import {CategorieProfCollaboratorService} from '../../../../shared/service/collaborator/prof/CategorieProfCollaborator.service';
import {CategorieProfDto} from '../../../../shared/model/prof/CategorieProf.model';
import {CategorieProfCriteria} from '../../../../shared/criteria/prof/CategorieProfCriteria.model';
import {CollaboratorDto} from '../../../../shared/model/vocab/Collaborator.model';
import {CollaboratorCollaboratorService} from '../../../../shared/service/collaborator/vocab/CollaboratorCollaborator.service';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from '../../../../shared/service/collaborator/course/ParcoursCollaborator.service';
import {TypeTeacherDto} from '../../../../shared/model/prof/TypeTeacher.model';
import {TypeTeacherCollaboratorService} from '../../../../shared/service/collaborator/prof/TypeTeacherCollaborator.service';
import {RecommendTeacherDto} from '../../../../shared/model/recomrecla/RecommendTeacher.model';
import {RecommendTeacherCollaboratorService} from '../../../../shared/service/collaborator/recomrecla/RecommendTeacherCollaborator.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ProfCollaborator.service';
import {TrancheHoraireProfDto} from '../../../../shared/model/prof/TrancheHoraireProf.model';
import {TrancheHoraireProfCollaboratorService} from '../../../../shared/service/collaborator/prof/TrancheHoraireProfCollaborator.service';

@Component({
  selector: 'app-categorie-prof-create-collaborator',
  templateUrl: './categorie-prof-create-collaborator.component.html',
  imports: [
        MatButtonModule,
        MatDialogModule,
        MatFormFieldModule,
        MatInputModule,
        NgIf,
        MatAutocompleteModule,
        NgForOf,
        MatIconModule,
        MatTooltipModule,
        TranslocoModule,
        FormsModule,
        MatCheckboxModule
    ],
    standalone: true
})
export class CategorieProfCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;


    private _profsElement = new ProfDto();


   private _validCategorieProfCode = true;
    private _validProfsRef = true;

	constructor(private alert: FuseAlertService, private service: CategorieProfCollaboratorService , private collaboratorService: CollaboratorCollaboratorService, private parcoursService: ParcoursCollaboratorService, private typeTeacherService: TypeTeacherCollaboratorService, private profService: ProfCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.profsElement.parcours = new ParcoursDto();
        this.parcoursService.findAll().subscribe((data) => this.parcourss = data);
        this.profsElement.typeTeacher = new TypeTeacherDto();
        this.typeTeacherService.findAll().subscribe((data) => this.typeTeachers = data);
        this.profsElement.collaborator = new CollaboratorDto();
        this.collaboratorService.findAll().subscribe((data) => this.collaborators = data);
    }




    public save(): void {
        this.submitted = true;
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.saveWithShowOption(false);
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public saveWithShowOption(showList: boolean) {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.createDialog = false;
                this.submitted = false;
                this.item = new CategorieProfDto();
            } else {
                this.alert.show('info', 'something went wrong!, please try again.');
            }

        }, error => {
            console.log(error);
        });
    }


    public hideCreateDialog() {
        this.createDialog = false;
        this.setValidation(true);
    }



    validateProfs(){
        this.errorMessages = new Array();
        this.validateProfsRef();
    }


    public  setValidation(value: boolean){
        this.validCategorieProfCode = value;
        this.validProfsRef = value;
    }

    public addProfs() {
        if( this.item.profs == null )
            this.item.profs = new Array<ProfDto>();
       this.validateProfs();
       if (this.errorMessages.length === 0) {
              this.item.profs.push({... this.profsElement});
              this.profsElement = new ProfDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deleteprofs(p: ProfDto) {
        this.item.profs.forEach((element, index) => {
            if (element === p) { this.item.profs.splice(index, 1); }
        });
    }

    public editprofs(p: ProfDto) {
        this.profsElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateCategorieProfCode();
    }

    public validateCategorieProfCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validCategorieProfCode = false;
        } else {
            this.validCategorieProfCode = true;
        }
    }

    public validateProfsRef(){
        if (this.profsElement.ref == null) {
            this.errorMessages.push('Ref de la prof est  invalide');
            this.validProfsRef = false;
        } else {
            this.validProfsRef = true;
        }
    }

    public async openCreateTypeTeacher(typeTeacher: string) {
    const isPermistted = await this.roleService.isPermitted('TypeTeacher', 'add');
    if(isPermistted) {
         this.typeTeacher = new TypeTeacherDto();
         this.createTypeTeacherDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
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



    get validCategorieProfCode(): boolean {
        return this._validCategorieProfCode;
    }

    set validCategorieProfCode(value: boolean) {
         this._validCategorieProfCode = value;
    }

    get validProfsRef(): boolean {
        return this._validProfsRef;
    }
    set validProfsRef(value: boolean) {
        this._validProfsRef = value;
    }

    get profsElement(): ProfDto {
        if( this._profsElement == null )
            this._profsElement = new ProfDto();
        return this._profsElement;
    }

    set profsElement(value: ProfDto) {
        this._profsElement = value;
    }

    get items(): Array<CategorieProfDto> {
        return this.service.items;
    }

    set items(value: Array<CategorieProfDto>) {
        this.service.items = value;
    }

    get item(): CategorieProfDto {
        return this.service.item;
    }

    set item(value: CategorieProfDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): CategorieProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: CategorieProfCriteria) {
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
