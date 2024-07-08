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


import {FreeTrialCollaboratorService} from 'src/app/shared/service/collaborator/freetrial/FreeTrialCollaborator.service';
import {FreeTrialDto} from 'src/app/shared/model/freetrial/FreeTrial.model';
import {FreeTrialCriteria} from 'src/app/shared/criteria/freetrial/FreeTrialCriteria.model';

import {FreeTrialTeacherEmailTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialTeacherEmailTemplate.model';
import {FreeTrialTeacherEmailTemplateCollaboratorService} from 'src/app/shared/service/collaborator/freetrial/FreeTrialTeacherEmailTemplateCollaborator.service';
import {FreeTrialTeacherWhatsTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialTeacherWhatsTemplate.model';
import {FreeTrialTeacherWhatsTemplateCollaboratorService} from 'src/app/shared/service/collaborator/freetrial/FreeTrialTeacherWhatsTemplateCollaborator.service';
import {StatutFreeTrialDto} from 'src/app/shared/model/freetrial/StatutFreeTrial.model';
import {StatutFreeTrialCollaboratorService} from 'src/app/shared/service/collaborator/freetrial/StatutFreeTrialCollaborator.service';
import {FreeTrialConfigurationDto} from 'src/app/shared/model/freetrial/FreeTrialConfiguration.model';
import {FreeTrialConfigurationCollaboratorService} from 'src/app/shared/service/collaborator/freetrial/FreeTrialConfigurationCollaborator.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from 'src/app/shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {FreeTrialStudentEmailTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialStudentEmailTemplate.model';
import {FreeTrialStudentEmailTemplateCollaboratorService} from 'src/app/shared/service/collaborator/freetrial/FreeTrialStudentEmailTemplateCollaborator.service';
import {FreeTrialDetailDto} from 'src/app/shared/model/freetrial/FreeTrialDetail.model';
import {FreeTrialDetailCollaboratorService} from 'src/app/shared/service/collaborator/freetrial/FreeTrialDetailCollaborator.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfCollaboratorService} from 'src/app/shared/service/collaborator/prof/ProfCollaborator.service';
import {NiveauEtudeDto} from 'src/app/shared/model/inscriptionref/NiveauEtude.model';
import {NiveauEtudeCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/NiveauEtudeCollaborator.service';
import {FreeTrialStudentWhatsTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialStudentWhatsTemplate.model';
import {FreeTrialStudentWhatsTemplateCollaboratorService} from 'src/app/shared/service/collaborator/freetrial/FreeTrialStudentWhatsTemplateCollaborator.service';
@Component({
  selector: 'app-free-trial-view-collaborator',
  templateUrl: './free-trial-view-collaborator.component.html'
})
export class FreeTrialViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;


    freeTrialDetails = new FreeTrialDetailDto();
    freeTrialDetailss: Array<FreeTrialDetailDto> = [];

    constructor(private service: FreeTrialCollaboratorService, private freeTrialTeacherEmailTemplateService: FreeTrialTeacherEmailTemplateCollaboratorService, private freeTrialTeacherWhatsTemplateService: FreeTrialTeacherWhatsTemplateCollaboratorService, private statutFreeTrialService: StatutFreeTrialCollaboratorService, private freeTrialConfigurationService: FreeTrialConfigurationCollaboratorService, private etudiantService: EtudiantCollaboratorService, private freeTrialStudentEmailTemplateService: FreeTrialStudentEmailTemplateCollaboratorService, private freeTrialDetailService: FreeTrialDetailCollaboratorService, private profService: ProfCollaboratorService, private niveauEtudeService: NiveauEtudeCollaboratorService, private freeTrialStudentWhatsTemplateService: FreeTrialStudentWhatsTemplateCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get freeTrialTeacherWhatsTemplate(): FreeTrialTeacherWhatsTemplateDto {
        return this.freeTrialTeacherWhatsTemplateService.item;
    }
    set freeTrialTeacherWhatsTemplate(value: FreeTrialTeacherWhatsTemplateDto) {
        this.freeTrialTeacherWhatsTemplateService.item = value;
    }
    get freeTrialTeacherWhatsTemplates(): Array<FreeTrialTeacherWhatsTemplateDto> {
        return this.freeTrialTeacherWhatsTemplateService.items;
    }
    set freeTrialTeacherWhatsTemplates(value: Array<FreeTrialTeacherWhatsTemplateDto>) {
        this.freeTrialTeacherWhatsTemplateService.items = value;
    }
    get freeTrialStudentEmailTemplate(): FreeTrialStudentEmailTemplateDto {
        return this.freeTrialStudentEmailTemplateService.item;
    }
    set freeTrialStudentEmailTemplate(value: FreeTrialStudentEmailTemplateDto) {
        this.freeTrialStudentEmailTemplateService.item = value;
    }
    get freeTrialStudentEmailTemplates(): Array<FreeTrialStudentEmailTemplateDto> {
        return this.freeTrialStudentEmailTemplateService.items;
    }
    set freeTrialStudentEmailTemplates(value: Array<FreeTrialStudentEmailTemplateDto>) {
        this.freeTrialStudentEmailTemplateService.items = value;
    }
    get freeTrialConfiguration(): FreeTrialConfigurationDto {
        return this.freeTrialConfigurationService.item;
    }
    set freeTrialConfiguration(value: FreeTrialConfigurationDto) {
        this.freeTrialConfigurationService.item = value;
    }
    get freeTrialConfigurations(): Array<FreeTrialConfigurationDto> {
        return this.freeTrialConfigurationService.items;
    }
    set freeTrialConfigurations(value: Array<FreeTrialConfigurationDto>) {
        this.freeTrialConfigurationService.items = value;
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
    get niveauEtude(): NiveauEtudeDto {
        return this.niveauEtudeService.item;
    }
    set niveauEtude(value: NiveauEtudeDto) {
        this.niveauEtudeService.item = value;
    }
    get niveauEtudes(): Array<NiveauEtudeDto> {
        return this.niveauEtudeService.items;
    }
    set niveauEtudes(value: Array<NiveauEtudeDto>) {
        this.niveauEtudeService.items = value;
    }
    get freeTrialStudentWhatsTemplate(): FreeTrialStudentWhatsTemplateDto {
        return this.freeTrialStudentWhatsTemplateService.item;
    }
    set freeTrialStudentWhatsTemplate(value: FreeTrialStudentWhatsTemplateDto) {
        this.freeTrialStudentWhatsTemplateService.item = value;
    }
    get freeTrialStudentWhatsTemplates(): Array<FreeTrialStudentWhatsTemplateDto> {
        return this.freeTrialStudentWhatsTemplateService.items;
    }
    set freeTrialStudentWhatsTemplates(value: Array<FreeTrialStudentWhatsTemplateDto>) {
        this.freeTrialStudentWhatsTemplateService.items = value;
    }
    get etudiant(): EtudiantDto {
        return this.etudiantService.item;
    }
    set etudiant(value: EtudiantDto) {
        this.etudiantService.item = value;
    }
    get etudiants(): Array<EtudiantDto> {
        return this.etudiantService.items;
    }
    set etudiants(value: Array<EtudiantDto>) {
        this.etudiantService.items = value;
    }
    get statutFreeTrial(): StatutFreeTrialDto {
        return this.statutFreeTrialService.item;
    }
    set statutFreeTrial(value: StatutFreeTrialDto) {
        this.statutFreeTrialService.item = value;
    }
    get statutFreeTrials(): Array<StatutFreeTrialDto> {
        return this.statutFreeTrialService.items;
    }
    set statutFreeTrials(value: Array<StatutFreeTrialDto>) {
        this.statutFreeTrialService.items = value;
    }
    get freeTrialTeacherEmailTemplate(): FreeTrialTeacherEmailTemplateDto {
        return this.freeTrialTeacherEmailTemplateService.item;
    }
    set freeTrialTeacherEmailTemplate(value: FreeTrialTeacherEmailTemplateDto) {
        this.freeTrialTeacherEmailTemplateService.item = value;
    }
    get freeTrialTeacherEmailTemplates(): Array<FreeTrialTeacherEmailTemplateDto> {
        return this.freeTrialTeacherEmailTemplateService.items;
    }
    set freeTrialTeacherEmailTemplates(value: Array<FreeTrialTeacherEmailTemplateDto>) {
        this.freeTrialTeacherEmailTemplateService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<FreeTrialDto> {
        return this.service.items;
    }

    set items(value: Array<FreeTrialDto>) {
        this.service.items = value;
    }

    get item(): FreeTrialDto {
        return this.service.item;
    }

    set item(value: FreeTrialDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): FreeTrialCriteria {
        return this.service.criteria;
    }

    set criteria(value: FreeTrialCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
