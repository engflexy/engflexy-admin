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



import {CategorieSectionCollaboratorService} from '../../../../shared/service/collaborator/courseref/CategorieSectionCollaborator.service';
import {CategorieSectionDto} from '../../../../shared/model/courseref/CategorieSection.model';
import {CategorieSectionCriteria} from '../../../../shared/criteria/courseref/CategorieSectionCriteria.model';
import {QuizDto} from '../../../../shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from '../../../../shared/service/collaborator/quiz/QuizCollaborator.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionCollaboratorService} from '../../../../shared/service/collaborator/course/SectionCollaborator.service';
import {ExerciceDto} from '../../../../shared/model/course/Exercice.model';
import {ExerciceCollaboratorService} from '../../../../shared/service/collaborator/course/ExerciceCollaborator.service';
import {SuperCategorieSectionDto} from '../../../../shared/model/courseref/SuperCategorieSection.model';
import {SuperCategorieSectionCollaboratorService} from '../../../../shared/service/collaborator/courseref/SuperCategorieSectionCollaborator.service';

@Component({
  selector: 'app-categorie-section-create-collaborator',
  templateUrl: './categorie-section-create-collaborator.component.html',
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
export class CategorieSectionCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _superCategorieSectionsFilter:  SuperCategorieSectionDto[];

    private _sectionsElement = new SectionDto();


   private _validCategorieSectionCode = true;
    private _validSuperCategorieSectionCode = true;
    private _validSuperCategorieSectionLibelle = true;
    private _validSectionsCode = true;
    private _validSectionsLibelle = true;

	constructor(private alert: FuseAlertService, private service: CategorieSectionCollaboratorService , private sectionService: SectionCollaboratorService, private superCategorieSectionService: SuperCategorieSectionCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.superCategorieSectionService.findAll().subscribe((data) => {this.superCategorieSections = data; this._superCategorieSectionsFilter = {...this.superCategorieSections}});
    }

  displaySuperCategorieSection(item: SuperCategorieSectionDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterSuperCategorieSection(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._superCategorieSectionsFilter = this.superCategorieSections.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._superCategorieSectionsFilter = this.superCategorieSections
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
                this.item = new CategorieSectionDto();
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


    public  setValidation(value: boolean){
        this.validCategorieSectionCode = value;
        this.validSectionsCode = value;
        this.validSectionsLibelle = value;
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


    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateCategorieSectionCode();
    }

    public validateCategorieSectionCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validCategorieSectionCode = false;
        } else {
            this.validCategorieSectionCode = true;
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

    public async openCreateSuperCategorieSection(superCategorieSection: string) {
    const isPermistted = await this.roleService.isPermitted('SuperCategorieSection', 'add');
    if(isPermistted) {
         this.superCategorieSection = new SuperCategorieSectionDto();
         this.createSuperCategorieSectionDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get superCategorieSection(): SuperCategorieSectionDto {
        return this.superCategorieSectionService.item;
    }
    set superCategorieSection(value: SuperCategorieSectionDto) {
        this.superCategorieSectionService.item = value;
    }
    get superCategorieSections(): Array<SuperCategorieSectionDto> {
        return this.superCategorieSectionService.items;
    }
    set superCategorieSections(value: Array<SuperCategorieSectionDto>) {
        this.superCategorieSectionService.items = value;
    }
    get createSuperCategorieSectionDialog(): boolean {
        return this.superCategorieSectionService.createDialog;
    }
    set createSuperCategorieSectionDialog(value: boolean) {
        this.superCategorieSectionService.createDialog= value;
    }



    get validCategorieSectionCode(): boolean {
        return this._validCategorieSectionCode;
    }

    set validCategorieSectionCode(value: boolean) {
         this._validCategorieSectionCode = value;
    }

    get validSuperCategorieSectionCode(): boolean {
        return this._validSuperCategorieSectionCode;
    }
    set validSuperCategorieSectionCode(value: boolean) {
        this._validSuperCategorieSectionCode = value;
    }
    get validSuperCategorieSectionLibelle(): boolean {
        return this._validSuperCategorieSectionLibelle;
    }
    set validSuperCategorieSectionLibelle(value: boolean) {
        this._validSuperCategorieSectionLibelle = value;
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

    get sectionsElement(): SectionDto {
        if( this._sectionsElement == null )
            this._sectionsElement = new SectionDto();
        return this._sectionsElement;
    }

    set sectionsElement(value: SectionDto) {
        this._sectionsElement = value;
    }

    get items(): Array<CategorieSectionDto> {
        return this.service.items;
    }

    set items(value: Array<CategorieSectionDto>) {
        this.service.items = value;
    }

    get item(): CategorieSectionDto {
        return this.service.item;
    }

    set item(value: CategorieSectionDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): CategorieSectionCriteria {
        return this.service.criteria;
    }

    set criteria(value: CategorieSectionCriteria) {
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
