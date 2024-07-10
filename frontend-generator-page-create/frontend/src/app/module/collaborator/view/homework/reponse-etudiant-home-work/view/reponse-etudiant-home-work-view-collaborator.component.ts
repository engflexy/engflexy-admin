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


import {ReponseEtudiantHomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/ReponseEtudiantHomeWorkCollaborator.service';
import {ReponseEtudiantHomeWorkDto} from 'src/app/shared/model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkCriteria} from 'src/app/shared/criteria/homework/ReponseEtudiantHomeWorkCriteria.model';

import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCollaboratorService} from 'src/app/shared/service/collaborator/homework/HoweWorkQSTReponseCollaborator.service';
import {HomeWorkEtudiantDto} from 'src/app/shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkEtudiantCollaborator.service';
import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';
@Component({
  selector: 'app-reponse-etudiant-home-work-view-collaborator',
  templateUrl: './reponse-etudiant-home-work-view-collaborator.component.html'
})
export class ReponseEtudiantHomeWorkViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: ReponseEtudiantHomeWorkCollaboratorService, private howeWorkQSTReponseService: HoweWorkQSTReponseCollaboratorService, private homeWorkEtudiantService: HomeWorkEtudiantCollaboratorService, private homeWorkQuestionService: HomeWorkQuestionCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get homeWorkEtudiant(): HomeWorkEtudiantDto {
        return this.homeWorkEtudiantService.item;
    }
    set homeWorkEtudiant(value: HomeWorkEtudiantDto) {
        this.homeWorkEtudiantService.item = value;
    }
    get homeWorkEtudiants(): Array<HomeWorkEtudiantDto> {
        return this.homeWorkEtudiantService.items;
    }
    set homeWorkEtudiants(value: Array<HomeWorkEtudiantDto>) {
        this.homeWorkEtudiantService.items = value;
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

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<ReponseEtudiantHomeWorkDto> {
        return this.service.items;
    }

    set items(value: Array<ReponseEtudiantHomeWorkDto>) {
        this.service.items = value;
    }

    get item(): ReponseEtudiantHomeWorkDto {
        return this.service.item;
    }

    set item(value: ReponseEtudiantHomeWorkDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): ReponseEtudiantHomeWorkCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReponseEtudiantHomeWorkCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
