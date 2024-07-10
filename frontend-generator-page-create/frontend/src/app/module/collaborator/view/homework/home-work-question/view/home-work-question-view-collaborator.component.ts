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


import {HomeWorkQuestionCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';
import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCriteria} from 'src/app/shared/criteria/homework/HomeWorkQuestionCriteria.model';

import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCollaboratorService} from 'src/app/shared/service/collaborator/homework/HoweWorkQSTReponseCollaborator.service';
import {TypeDeQuestionDto} from 'src/app/shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionCollaboratorService} from 'src/app/shared/service/collaborator/quizref/TypeDeQuestionCollaborator.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkCollaborator.service';
@Component({
  selector: 'app-home-work-question-view-collaborator',
  templateUrl: './home-work-question-view-collaborator.component.html'
})
export class HomeWorkQuestionViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;


    howeWorkQSTReponses = new HoweWorkQSTReponseDto();
    howeWorkQSTReponsess: Array<HoweWorkQSTReponseDto> = [];

    constructor(private service: HomeWorkQuestionCollaboratorService, private howeWorkQSTReponseService: HoweWorkQSTReponseCollaboratorService, private typeDeQuestionService: TypeDeQuestionCollaboratorService, private homeWorkService: HomeWorkCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get typeDeQuestion(): TypeDeQuestionDto {
        return this.typeDeQuestionService.item;
    }
    set typeDeQuestion(value: TypeDeQuestionDto) {
        this.typeDeQuestionService.item = value;
    }
    get typeDeQuestions(): Array<TypeDeQuestionDto> {
        return this.typeDeQuestionService.items;
    }
    set typeDeQuestions(value: Array<TypeDeQuestionDto>) {
        this.typeDeQuestionService.items = value;
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

    get items(): Array<HomeWorkQuestionDto> {
        return this.service.items;
    }

    set items(value: Array<HomeWorkQuestionDto>) {
        this.service.items = value;
    }

    get item(): HomeWorkQuestionDto {
        return this.service.item;
    }

    set item(value: HomeWorkQuestionDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): HomeWorkQuestionCriteria {
        return this.service.criteria;
    }

    set criteria(value: HomeWorkQuestionCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
