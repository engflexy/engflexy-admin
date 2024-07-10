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


import {HomeWorkEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkEtudiantCollaborator.service';
import {HomeWorkEtudiantDto} from 'src/app/shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCriteria} from 'src/app/shared/criteria/homework/HomeWorkEtudiantCriteria.model';

import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCollaboratorService} from 'src/app/shared/service/collaborator/homework/HoweWorkQSTReponseCollaborator.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from 'src/app/shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {ReponseEtudiantHomeWorkDto} from 'src/app/shared/model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/ReponseEtudiantHomeWorkCollaborator.service';
import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkCollaborator.service';
@Component({
  selector: 'app-home-work-etudiant-view-collaborator',
  templateUrl: './home-work-etudiant-view-collaborator.component.html'
})
export class HomeWorkEtudiantViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;


    reponseEtudiantHomeWorks = new ReponseEtudiantHomeWorkDto();
    reponseEtudiantHomeWorkss: Array<ReponseEtudiantHomeWorkDto> = [];

    constructor(private service: HomeWorkEtudiantCollaboratorService, private howeWorkQSTReponseService: HoweWorkQSTReponseCollaboratorService, private etudiantService: EtudiantCollaboratorService, private reponseEtudiantHomeWorkService: ReponseEtudiantHomeWorkCollaboratorService, private homeWorkQuestionService: HomeWorkQuestionCollaboratorService, private homeWorkService: HomeWorkCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
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
    get howeWorkQSTReponse(): HoweWorkQSTReponseDto {
        return this.howeWorkQSTReponseService.item;
    }
    set howeWorkQSTReponse(value: HoweWorkQSTReponseDto) {
        this.howeWorkQSTReponseService.item = value;
    }
    get howeWorkQSTReponses(): Array<HoweWorkQSTReponseDto> {
        return this.howeWorkQSTReponseService.items;
    }
    set howeWorkQSTReponses(value: Array<HoweWorkQSTReponseDto>) {
        this.howeWorkQSTReponseService.items = value;
    }
    get homeWorkQuestion(): HomeWorkQuestionDto {
        return this.homeWorkQuestionService.item;
    }
    set homeWorkQuestion(value: HomeWorkQuestionDto) {
        this.homeWorkQuestionService.item = value;
    }
    get homeWorkQuestions(): Array<HomeWorkQuestionDto> {
        return this.homeWorkQuestionService.items;
    }
    set homeWorkQuestions(value: Array<HomeWorkQuestionDto>) {
        this.homeWorkQuestionService.items = value;
    }
    get homeWork(): HomeWorkDto {
        return this.homeWorkService.item;
    }
    set homeWork(value: HomeWorkDto) {
        this.homeWorkService.item = value;
    }
    get homeWorks(): Array<HomeWorkDto> {
        return this.homeWorkService.items;
    }
    set homeWorks(value: Array<HomeWorkDto>) {
        this.homeWorkService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<HomeWorkEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<HomeWorkEtudiantDto>) {
        this.service.items = value;
    }

    get item(): HomeWorkEtudiantDto {
        return this.service.item;
    }

    set item(value: HomeWorkEtudiantDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): HomeWorkEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: HomeWorkEtudiantCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
