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



import {ProfAdminService} from '../../../../shared/service/admin/prof/ProfAdmin.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfCriteria} from '../../../../shared/criteria/prof/ProfCriteria.model';
import {CollaboratorDto} from '../../../../shared/model/vocab/Collaborator.model';
import {CollaboratorAdminService} from '../../../../shared/service/admin/vocab/CollaboratorAdmin.service';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursAdminService} from '../../../../shared/service/admin/course/ParcoursAdmin.service';
import {TypeTeacherDto} from '../../../../shared/model/prof/TypeTeacher.model';
import {TypeTeacherAdminService} from '../../../../shared/service/admin/prof/TypeTeacherAdmin.service';
import {RecommendTeacherDto} from '../../../../shared/model/recomrecla/RecommendTeacher.model';
import {RecommendTeacherAdminService} from '../../../../shared/service/admin/recomrecla/RecommendTeacherAdmin.service';
import {CategorieProfDto} from '../../../../shared/model/prof/CategorieProf.model';
import {CategorieProfAdminService} from '../../../../shared/service/admin/prof/CategorieProfAdmin.service';
import {TrancheHoraireProfDto} from '../../../../shared/model/prof/TrancheHoraireProf.model';
import {TrancheHoraireProfAdminService} from '../../../../shared/service/admin/prof/TrancheHoraireProfAdmin.service';

@Component({
  selector: 'app-prof-create-admin',
  templateUrl: './prof-create-admin.component.html',
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
export class ProfCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _parcourssFilter:  ParcoursDto[];
  _categorieProfsFilter:  CategorieProfDto[];
  _typeTeachersFilter:  TypeTeacherDto[];
  _collaboratorsFilter:  CollaboratorDto[];

    private _trancheHoraireProfsElement = new TrancheHoraireProfDto();
    private _recommendTeachersElement = new RecommendTeacherDto();


   private _validProfRef = true;
    private _validParcoursCode = true;
    private _validParcoursLibelle = true;
    private _validCategorieProfCode = true;
    private _validRecommendTeachersRef = true;
    private _validTypeTeacherLibelle = true;
    private _validTypeTeacherCode = true;

	constructor(private alert: FuseAlertService, private service: ProfAdminService , private collaboratorService: CollaboratorAdminService, private parcoursService: ParcoursAdminService, private typeTeacherService: TypeTeacherAdminService, private recommendTeacherService: RecommendTeacherAdminService, private categorieProfService: CategorieProfAdminService, private trancheHoraireProfService: TrancheHoraireProfAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.parcoursService.findAll().subscribe((data) => {this.parcourss = data; this._parcourssFilter = {...this.parcourss}});
        this.categorieProfService.findAll().subscribe((data) => {this.categorieProfs = data; this._categorieProfsFilter = {...this.categorieProfs}});
        this.typeTeacherService.findAll().subscribe((data) => {this.typeTeachers = data; this._typeTeachersFilter = {...this.typeTeachers}});
        this.collaboratorService.findAll().subscribe((data) => {this.collaborators = data; this._collaboratorsFilter = {...this.collaborators}});
    }

  displayParcours(item: ParcoursDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterParcours(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._parcourssFilter = this.parcourss.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._parcourssFilter = this.parcourss
	}
 }
  displayCategorieProf(item: CategorieProfDto): string {
	return item && item.code ? item.code : "";

  }

  filterCategorieProf(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._categorieProfsFilter = this.categorieProfs.filter(s =>
			s.code?.toLowerCase()?.includes(value)
		)
	} else {
		this._categorieProfsFilter = this.categorieProfs
	}
 }
  displayTypeTeacher(item: TypeTeacherDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterTypeTeacher(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._typeTeachersFilter = this.typeTeachers.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._typeTeachersFilter = this.typeTeachers
	}
 }
  displayCollaborator(item: CollaboratorDto): string {
	return item && item.id ? item.id : "";

  }

  filterCollaborator(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._collaboratorsFilter = this.collaborators.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._collaboratorsFilter = this.collaborators
	}
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
                this.item = new ProfDto();
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



    validateTrancheHoraireProfs(){
        this.errorMessages = new Array();
    }
    validateRecommendTeachers(){
        this.errorMessages = new Array();
        this.validateRecommendTeachersRef();
    }


    public  setValidation(value: boolean){
        this.validProfRef = value;
        this.validRecommendTeachersRef = value;
    }

    public addTrancheHoraireProfs() {
        if( this.item.trancheHoraireProfs == null )
            this.item.trancheHoraireProfs = new Array<TrancheHoraireProfDto>();
       this.validateTrancheHoraireProfs();
       if (this.errorMessages.length === 0) {
              this.item.trancheHoraireProfs.push({... this.trancheHoraireProfsElement});
              this.trancheHoraireProfsElement = new TrancheHoraireProfDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletetrancheHoraireProfs(p: TrancheHoraireProfDto) {
        this.item.trancheHoraireProfs.forEach((element, index) => {
            if (element === p) { this.item.trancheHoraireProfs.splice(index, 1); }
        });
    }

    public edittrancheHoraireProfs(p: TrancheHoraireProfDto) {
        this.trancheHoraireProfsElement = {... p};
        this.activeTab = 0;
    }
    public addRecommendTeachers() {
        if( this.item.recommendTeachers == null )
            this.item.recommendTeachers = new Array<RecommendTeacherDto>();
       this.validateRecommendTeachers();
       if (this.errorMessages.length === 0) {
              this.item.recommendTeachers.push({... this.recommendTeachersElement});
              this.recommendTeachersElement = new RecommendTeacherDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deleterecommendTeachers(p: RecommendTeacherDto) {
        this.item.recommendTeachers.forEach((element, index) => {
            if (element === p) { this.item.recommendTeachers.splice(index, 1); }
        });
    }

    public editrecommendTeachers(p: RecommendTeacherDto) {
        this.recommendTeachersElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
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

    public validateRecommendTeachersRef(){
        if (this.recommendTeachersElement.ref == null) {
            this.errorMessages.push('Ref de la recommendTeacher est  invalide');
            this.validRecommendTeachersRef = false;
        } else {
            this.validRecommendTeachersRef = true;
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
    public async openCreateCategorieProf(categorieProf: string) {
    const isPermistted = await this.roleService.isPermitted('CategorieProf', 'add');
    if(isPermistted) {
         this.categorieProf = new CategorieProfDto();
         this.createCategorieProfDialog = true;
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

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
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
