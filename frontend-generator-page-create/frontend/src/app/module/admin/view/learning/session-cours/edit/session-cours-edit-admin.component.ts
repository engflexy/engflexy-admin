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




import {SessionCoursAdminService} from 'src/app/shared/service/admin/learning/SessionCoursAdmin.service';
import {SessionCoursDto} from 'src/app/shared/model/learning/SessionCours.model';
import {SessionCoursCriteria} from 'src/app/shared/criteria/learning/SessionCoursCriteria.model';


import {SalaryDto} from 'src/app/shared/model/salary/Salary.model';
import {SalaryAdminService} from 'src/app/shared/service/admin/salary/SalaryAdmin.service';
import {GroupeEtudiantDto} from 'src/app/shared/model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantAdminService} from 'src/app/shared/service/admin/grpe/GroupeEtudiantAdmin.service';
import {SessionCoursSectionDto} from 'src/app/shared/model/learning/SessionCoursSection.model';
import {SessionCoursSectionAdminService} from 'src/app/shared/service/admin/learning/SessionCoursSectionAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';
import {CoursDto} from 'src/app/shared/model/course/Cours.model';
import {CoursAdminService} from 'src/app/shared/service/admin/course/CoursAdmin.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfAdminService} from 'src/app/shared/service/admin/prof/ProfAdmin.service';

@Component({
  selector: 'app-session-cours-edit-admin',
  templateUrl: './session-cours-edit-admin.component.html'
})
export class SessionCoursEditAdminComponent implements OnInit {

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


    private _sessionCoursSectionsElement = new SessionCoursSectionDto();

    private _validSessionCoursReference = true;

    private _validProfRef = true;
    private _validCoursCode = true;
    private _validCoursLibelle = true;
    private _validSalaryCode = true;


    private _sessionCoursSections: Array<SessionCoursSectionDto> = [];

    constructor(private service: SessionCoursAdminService , private salaryService: SalaryAdminService, private groupeEtudiantService: GroupeEtudiantAdminService, private sessionCoursSectionService: SessionCoursSectionAdminService, private sectionService: SectionAdminService, private coursService: CoursAdminService, private profService: ProfAdminService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.sectionService.findAll().subscribe(data => this.prepareSessionCoursSections(data));
        this.sessionCoursSectionsElement.section = new SectionDto();
        this.sectionService.findAll().subscribe((data) => this.sections = data);

        this.profService.findAll().subscribe((data) => this.profs = data);
        this.coursService.findAll().subscribe((data) => this.courss = data);
        this.groupeEtudiantService.findAll().subscribe((data) => this.groupeEtudiants = data);
        this.salaryService.findAll().subscribe((data) => this.salarys = data);
    }

    public prepareEdit() {
        this.item.dateFin = this.service.format(this.item.dateFin);
        this.item.dateDebut = this.service.format(this.item.dateDebut);
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
            this.item = new SessionCoursDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
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

    public setValidation(value: boolean){
        this.validSessionCoursReference = value;
    }

    public validateForm(): void{
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
    get sessionCoursSectionsElement(): SessionCoursSectionDto {
        if( this._sessionCoursSectionsElement == null )
            this._sessionCoursSectionsElement = new SessionCoursSectionDto();
         return this._sessionCoursSectionsElement;
    }

    set sessionCoursSectionsElement(value: SessionCoursSectionDto) {
        this._sessionCoursSectionsElement = value;
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

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
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
