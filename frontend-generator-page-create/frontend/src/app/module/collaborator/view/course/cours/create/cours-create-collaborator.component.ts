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



import {CoursCollaboratorService} from '../../../../shared/service/collaborator/course/CoursCollaborator.service';
import {CoursDto} from '../../../../shared/model/course/Cours.model';
import {CoursCriteria} from '../../../../shared/criteria/course/CoursCriteria.model';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from '../../../../shared/service/collaborator/course/ParcoursCollaborator.service';
import {QuizDto} from '../../../../shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from '../../../../shared/service/collaborator/quiz/QuizCollaborator.service';
import {HomeWorkEtudiantDto} from '../../../../shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkEtudiantCollaborator.service';
import {HomeWorkQuestionDto} from '../../../../shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';
import {EtatCoursDto} from '../../../../shared/model/courseref/EtatCours.model';
import {EtatCoursCollaboratorService} from '../../../../shared/service/collaborator/courseref/EtatCoursCollaborator.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionCollaboratorService} from '../../../../shared/service/collaborator/course/SectionCollaborator.service';
import {ExerciceDto} from '../../../../shared/model/course/Exercice.model';
import {ExerciceCollaboratorService} from '../../../../shared/service/collaborator/course/ExerciceCollaborator.service';
import {TypeHomeWorkDto} from '../../../../shared/model/homework/TypeHomeWork.model';
import {TypeHomeWorkCollaboratorService} from '../../../../shared/service/collaborator/homework/TypeHomeWorkCollaborator.service';
import {HomeWorkDto} from '../../../../shared/model/homework/HomeWork.model';
import {HomeWorkCollaboratorService} from '../../../../shared/service/collaborator/homework/HomeWorkCollaborator.service';

@Component({
  selector: 'app-cours-create-collaborator',
  templateUrl: './cours-create-collaborator.component.html',
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
export class CoursCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _etatCourssFilter:  EtatCoursDto[];
  _parcourssFilter:  ParcoursDto[];

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

	constructor(private alert: FuseAlertService, private service: CoursCollaboratorService , private parcoursService: ParcoursCollaboratorService, private etatCoursService: EtatCoursCollaboratorService, private sectionService: SectionCollaboratorService, private typeHomeWorkService: TypeHomeWorkCollaboratorService, private homeWorkService: HomeWorkCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.homeWorksElement.typeHomeWork = new TypeHomeWorkDto();
        this.typeHomeWorkService.findAll().subscribe((data) => this.typeHomeWorks = data);
        this.etatCoursService.findAll().subscribe((data) => {this.etatCourss = data; this._etatCourssFilter = {...this.etatCourss}});
        this.parcoursService.findAll().subscribe((data) => {this.parcourss = data; this._parcourssFilter = {...this.parcourss}});
    }

  displayEtatCours(item: EtatCoursDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterEtatCours(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._etatCourssFilter = this.etatCourss.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._etatCourssFilter = this.etatCourss
	}
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
                this.item = new CoursDto();
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



    validateSections(){
        this.errorMessages = new Array();
        this.validateSectionsCode();
        this.validateSectionsLibelle();
    }
    validateHomeWorks(){
        this.errorMessages = new Array();
        this.validateHomeWorksLibelle();
    }


    public  setValidation(value: boolean){
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
              this.item.sections.push({... this.sectionsElement});
              this.sectionsElement = new SectionDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletesections(p: SectionDto) {
        this.item.sections.forEach((element, index) => {
            if (element === p) { this.item.sections.splice(index, 1); }
        });
    }

    public editsections(p: SectionDto) {
        this.sectionsElement = {... p};
        this.activeTab = 0;
    }
    public addHomeWorks() {
        if( this.item.homeWorks == null )
            this.item.homeWorks = new Array<HomeWorkDto>();
       this.validateHomeWorks();
       if (this.errorMessages.length === 0) {
              this.item.homeWorks.push({... this.homeWorksElement});
              this.homeWorksElement = new HomeWorkDto();
       }else{
         this.alert.show('info', 'something went wrong!, please try again.');
       }
    }


    public deletehomeWorks(p: HomeWorkDto) {
        this.item.homeWorks.forEach((element, index) => {
            if (element === p) { this.item.homeWorks.splice(index, 1); }
        });
    }

    public edithomeWorks(p: HomeWorkDto) {
        this.homeWorksElement = {... p};
        this.activeTab = 0;
    }


    public  validateForm(): void{
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

    public validateSectionsCode(){
        if (this.sectionsElement.code == null) {
            this.errorMessages.push('Code de la section est  invalide');
            this.validSectionsCode = false;
        } else {
            this.validSectionsCode = true;
        }
    }
    public validateSectionsLibelle(){
        if (this.sectionsElement.libelle == null) {
            this.errorMessages.push('Libelle de la section est  invalide');
            this.validSectionsLibelle = false;
        } else {
            this.validSectionsLibelle = true;
        }
    }
    public validateHomeWorksLibelle(){
        if (this.homeWorksElement.libelle == null) {
            this.errorMessages.push('Libelle de la homeWork est  invalide');
            this.validHomeWorksLibelle = false;
        } else {
            this.validHomeWorksLibelle = true;
        }
    }

    public async openCreateParcours(parcours: string) {
    const isPermistted = await this.roleService.isPermitted('Parcours', 'add');
    if(isPermistted) {
         this.parcours = new ParcoursDto();
         this.createParcoursDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
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

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
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
