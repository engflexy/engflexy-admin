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


import {HoweWorkQSTReponseAdminService} from 'src/app/shared/service/admin/homework/HoweWorkQSTReponseAdmin.service';
import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCriteria} from 'src/app/shared/criteria/homework/HoweWorkQSTReponseCriteria.model';

import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionAdminService} from 'src/app/shared/service/admin/homework/HomeWorkQuestionAdmin.service';
@Component({
  selector: 'app-howe-work-q-s-t-reponse-view-admin',
  templateUrl: './howe-work-q-s-t-reponse-view-admin.component.html'
})
export class HoweWorkQSTReponseViewAdminComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: HoweWorkQSTReponseAdminService, private homeWorkQuestionService: HomeWorkQuestionAdminService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
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

    get items(): Array<HoweWorkQSTReponseDto> {
        return this.service.items;
    }

    set items(value: Array<HoweWorkQSTReponseDto>) {
        this.service.items = value;
    }

    get item(): HoweWorkQSTReponseDto {
        return this.service.item;
    }

    set item(value: HoweWorkQSTReponseDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): HoweWorkQSTReponseCriteria {
        return this.service.criteria;
    }

    set criteria(value: HoweWorkQSTReponseCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
