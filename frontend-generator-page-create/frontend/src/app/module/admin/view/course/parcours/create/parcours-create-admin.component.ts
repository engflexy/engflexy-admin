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



import {ParcoursAdminService} from '../../../../shared/service/admin/course/ParcoursAdmin.service';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursCriteria} from '../../../../shared/criteria/course/ParcoursCriteria.model';
import {CollaboratorDto} from '../../../../shared/model/vocab/Collaborator.model';
import {CollaboratorAdminService} from '../../../../shared/service/admin/vocab/CollaboratorAdmin.service';
import {EtatCoursDto} from '../../../../shared/model/courseref/EtatCours.model';
import {EtatCoursAdminService} from '../../../../shared/service/admin/courseref/EtatCoursAdmin.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionAdminService} from '../../../../shared/service/admin/course/SectionAdmin.service';
import {CoursDto} from '../../../../shared/model/course/Cours.model';
import {CoursAdminService} from '../../../../shared/service/admin/course/CoursAdmin.service';
import {HomeWorkDto} from '../../../../shared/model/homework/HomeWork.model';
import {HomeWorkAdminService} from '../../../../shared/service/admin/homework/HomeWorkAdmin.service';

@Component({
  selector: 'app-parcours-create-admin',
  templateUrl: './parcours-create-admin.component.html',
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
export class ParcoursCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _collaboratorsFilter:  CollaboratorDto[];

    private _courssElement = new CoursDto();


   private _validParcoursCode = true;
   private _validParcoursLibelle = true;
    private _validCourssCode = true;
    private _validCourssLibelle = true;

	constructor(private alert: FuseAlertService, private service: ParcoursAdminService , private collaboratorService: CollaboratorAdminService, private etatCoursService: EtatCoursAdminService, private coursService: CoursAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.courssElement.etatCours = new EtatCoursDto();
        this.etatCoursService.findAll().subscribe((data) => this.etatCourss = data);
        this.collaboratorService.findAll().subscribe((data) => {this.collaborators = data; this._collaboratorsFilter = {...this.collaborators}});
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
                this.item = new ParcoursDto();
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



    validateCourss(){
        this.errorMessages = new Array();
        this.validateCourssCode();
        this.validateCourssLibelle();
    }


    public  setValidation(value: boolean){
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
              this.item.courss.push({... this.courssElement});
              this.courssElement = new CoursDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletecourss(p: CoursDto) {
        this.item.courss.forEach((element, index) => {
            if (element === p) { this.item.courss.splice(index, 1); }
        });
    }

    public editcourss(p: CoursDto) {
        this.courssElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
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

    public validateCourssCode(){
        if (this.courssElement.code == null) {
            this.errorMessages.push('Code de la cours est  invalide');
            this.validCourssCode = false;
        } else {
            this.validCourssCode = true;
        }
    }
    public validateCourssLibelle(){
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

    get courssElement(): CoursDto {
        if( this._courssElement == null )
            this._courssElement = new CoursDto();
        return this._courssElement;
    }

    set courssElement(value: CoursDto) {
        this._courssElement = value;
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

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
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
