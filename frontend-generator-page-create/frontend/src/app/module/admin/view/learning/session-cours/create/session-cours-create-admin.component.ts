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



import {SessionCoursAdminService} from '../../../../shared/service/admin/learning/SessionCoursAdmin.service';
import {SessionCoursDto} from '../../../../shared/model/learning/SessionCours.model';
import {SessionCoursCriteria} from '../../../../shared/criteria/learning/SessionCoursCriteria.model';
import {SalaryDto} from '../../../../shared/model/salary/Salary.model';
import {SalaryAdminService} from '../../../../shared/service/admin/salary/SalaryAdmin.service';
import {GroupeEtudiantDto} from '../../../../shared/model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantAdminService} from '../../../../shared/service/admin/grpe/GroupeEtudiantAdmin.service';
import {SessionCoursSectionDto} from '../../../../shared/model/learning/SessionCoursSection.model';
import {SessionCoursSectionAdminService} from '../../../../shared/service/admin/learning/SessionCoursSectionAdmin.service';
import {SectionDto} from '../../../../shared/model/course/Section.model';
import {SectionAdminService} from '../../../../shared/service/admin/course/SectionAdmin.service';
import {CoursDto} from '../../../../shared/model/course/Cours.model';
import {CoursAdminService} from '../../../../shared/service/admin/course/CoursAdmin.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfAdminService} from '../../../../shared/service/admin/prof/ProfAdmin.service';

@Component({
  selector: 'app-session-cours-create-admin',
  templateUrl: './session-cours-create-admin.component.html',
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
export class SessionCoursCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _profsFilter:  ProfDto[];
  _courssFilter:  CoursDto[];
  _groupeEtudiantsFilter:  GroupeEtudiantDto[];
  _salarysFilter:  SalaryDto[];

    private _sessionCoursSectionsElement = new SessionCoursSectionDto();


   private _validSessionCoursReference = true;
    private _validProfRef = true;
    private _validCoursCode = true;
    private _validCoursLibelle = true;
    private _validSalaryCode = true;
    private _sessionCoursSections: Array<SessionCoursSectionDto> = [];

	constructor(private alert: FuseAlertService, private service: SessionCoursAdminService , private salaryService: SalaryAdminService, private groupeEtudiantService: GroupeEtudiantAdminService, private sessionCoursSectionService: SessionCoursSectionAdminService, private sectionService: SectionAdminService, private coursService: CoursAdminService, private profService: ProfAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.sectionService.findAll().subscribe(data => this.prepareSessionCoursSections(data));
        this.sessionCoursSectionsElement.section = new SectionDto();
        this.sectionService.findAll().subscribe((data) => this.sections = data);
        this.profService.findAll().subscribe((data) => {this.profs = data; this._profsFilter = {...this.profs}});
        this.coursService.findAll().subscribe((data) => {this.courss = data; this._courssFilter = {...this.courss}});
        this.groupeEtudiantService.findAll().subscribe((data) => {this.groupeEtudiants = data; this._groupeEtudiantsFilter = {...this.groupeEtudiants}});
        this.salaryService.findAll().subscribe((data) => {this.salarys = data; this._salarysFilter = {...this.salarys}});
    }

  displayProf(item: ProfDto): string {
	return item && item.ref ? item.ref : "";

  }

  filterProf(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._profsFilter = this.profs.filter(s =>
			s.ref?.toLowerCase()?.includes(value)
		)
	} else {
		this._profsFilter = this.profs
	}
 }
  displayCours(item: CoursDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterCours(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._courssFilter = this.courss.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._courssFilter = this.courss
	}
 }
  displayGroupeEtudiant(item: GroupeEtudiantDto): string {
	return item && item.id ? item.id : "";

  }

  filterGroupeEtudiant(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._groupeEtudiantsFilter = this.groupeEtudiants.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._groupeEtudiantsFilter = this.groupeEtudiants
	}
 }
  displaySalary(item: SalaryDto): string {
	return item && item.code ? item.code : "";

  }

  filterSalary(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._salarysFilter = this.salarys.filter(s =>
			s.code?.toLowerCase()?.includes(value)
		)
	} else {
		this._salarysFilter = this.salarys
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
                this.item = new SessionCoursDto();
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


     prepareSessionCoursSections(sections: Array<SectionDto>): void{
        if( sections != null){
                sections.forEach(e => {
                const sessionCoursSection = new SessionCoursSectionDto();
                sessionCoursSection.section = e;
                this.sessionCoursSections.push(sessionCoursSection);
            });
        }
    }



    public  setValidation(value: boolean){
        this.validSessionCoursReference = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateSessionCoursReference();
    }

    public validateSessionCoursReference(){
        if (this.stringUtilService.isEmpty(this.item.reference)) {
        this.errorMessages.push('Reference non valide');
        this.validSessionCoursReference = false;
        } else {
            this.validSessionCoursReference = true;
        }
    }



    get prof(): ProfDto {
        return this.profService.item;
    }
    set prof(value: ProfDto) {
        this.profService.item = value;
    }
    get profs(): Array<ProfDto> {
        return this.profService.items;
    }
    set profs(value: Array<ProfDto>) {
        this.profService.items = value;
    }
    get createProfDialog(): boolean {
        return this.profService.createDialog;
    }
    set createProfDialog(value: boolean) {
        this.profService.createDialog= value;
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
    get groupeEtudiant(): GroupeEtudiantDto {
        return this.groupeEtudiantService.item;
    }
    set groupeEtudiant(value: GroupeEtudiantDto) {
        this.groupeEtudiantService.item = value;
    }
    get groupeEtudiants(): Array<GroupeEtudiantDto> {
        return this.groupeEtudiantService.items;
    }
    set groupeEtudiants(value: Array<GroupeEtudiantDto>) {
        this.groupeEtudiantService.items = value;
    }
    get createGroupeEtudiantDialog(): boolean {
        return this.groupeEtudiantService.createDialog;
    }
    set createGroupeEtudiantDialog(value: boolean) {
        this.groupeEtudiantService.createDialog= value;
    }
    get section(): SectionDto {
        return this.sectionService.item;
    }
    set section(value: SectionDto) {
        this.sectionService.item = value;
    }
    get sections(): Array<SectionDto> {
        return this.sectionService.items;
    }
    set sections(value: Array<SectionDto>) {
        this.sectionService.items = value;
    }
    get createSectionDialog(): boolean {
        return this.sectionService.createDialog;
    }
    set createSectionDialog(value: boolean) {
        this.sectionService.createDialog= value;
    }
    get salary(): SalaryDto {
        return this.salaryService.item;
    }
    set salary(value: SalaryDto) {
        this.salaryService.item = value;
    }
    get salarys(): Array<SalaryDto> {
        return this.salaryService.items;
    }
    set salarys(value: Array<SalaryDto>) {
        this.salaryService.items = value;
    }
    get createSalaryDialog(): boolean {
        return this.salaryService.createDialog;
    }
    set createSalaryDialog(value: boolean) {
        this.salaryService.createDialog= value;
    }

    get sessionCoursSections(): Array<SessionCoursSectionDto> {
        if( this._sessionCoursSections == null )
            this._sessionCoursSections = new Array();
        return this._sessionCoursSections;
    }

    set sessionCoursSections(value: Array<SessionCoursSectionDto>) {
        this._sessionCoursSections = value;
    }


    get validSessionCoursReference(): boolean {
        return this._validSessionCoursReference;
    }

    set validSessionCoursReference(value: boolean) {
         this._validSessionCoursReference = value;
    }

    get validProfRef(): boolean {
        return this._validProfRef;
    }
    set validProfRef(value: boolean) {
        this._validProfRef = value;
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
    get validSalaryCode(): boolean {
        return this._validSalaryCode;
    }
    set validSalaryCode(value: boolean) {
        this._validSalaryCode = value;
    }

    get sessionCoursSectionsElement(): SessionCoursSectionDto {
        if( this._sessionCoursSectionsElement == null )
            this._sessionCoursSectionsElement = new SessionCoursSectionDto();
        return this._sessionCoursSectionsElement;
    }

    set sessionCoursSectionsElement(value: SessionCoursSectionDto) {
        this._sessionCoursSectionsElement = value;
    }

    get items(): Array<SessionCoursDto> {
        return this.service.items;
    }

    set items(value: Array<SessionCoursDto>) {
        this.service.items = value;
    }

    get item(): SessionCoursDto {
        return this.service.item;
    }

    set item(value: SessionCoursDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): SessionCoursCriteria {
        return this.service.criteria;
    }

    set criteria(value: SessionCoursCriteria) {
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
