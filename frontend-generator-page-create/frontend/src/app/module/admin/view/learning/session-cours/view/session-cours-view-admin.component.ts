import {Component, OnInit} from '@angular/core';


import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';


import {environment} from 'src/environments/environment';

import {RoleService} from 'src/app/zynerator/security/shared/service/Role.service';
import {AbstractService} from 'src/app/zynerator/service/AbstractService';
import {BaseDto} from 'src/app/zynerator/dto/BaseDto.model';
import {BaseCriteria} from 'src/app/zynerator/criteria/BaseCriteria.model';
import {StringUtilService} from 'src/app/zynerator/util/StringUtil.service';
import {ServiceLocator} from 'src/app/zynerator/service/ServiceLocator';
import {ConfirmationService, MessageService,MenuItem} from 'primeng/api';
import {FileTempDto} from 'src/app/zynerator/dto/FileTempDto.model';


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
  selector: 'app-session-cours-view-admin',
  templateUrl: './session-cours-view-admin.component.html'
})
export class SessionCoursViewAdminComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;


    sessionCoursSections = new SessionCoursSectionDto();
    sessionCoursSectionss: Array<SessionCoursSectionDto> = [];

    constructor(private service: SessionCoursAdminService, private salaryService: SalaryAdminService, private groupeEtudiantService: GroupeEtudiantAdminService, private sessionCoursSectionService: SessionCoursSectionAdminService, private sectionService: SectionAdminService, private coursService: CoursAdminService, private profService: ProfAdminService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
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

    public hideViewDialog() {
        this.viewDialog = false;
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

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): SessionCoursCriteria {
        return this.service.criteria;
    }

    set criteria(value: SessionCoursCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
