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


import {LevelTestConfigurationAdminService} from 'src/app/shared/service/admin/courseref/LevelTestConfigurationAdmin.service';
import {LevelTestConfigurationDto} from 'src/app/shared/model/courseref/LevelTestConfiguration.model';
import {LevelTestConfigurationCriteria} from 'src/app/shared/criteria/courseref/LevelTestConfigurationCriteria.model';

import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursAdminService} from 'src/app/shared/service/admin/course/ParcoursAdmin.service';
@Component({
  selector: 'app-level-test-configuration-view-admin',
  templateUrl: './level-test-configuration-view-admin.component.html'
})
export class LevelTestConfigurationViewAdminComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: LevelTestConfigurationAdminService, private parcoursService: ParcoursAdminService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
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

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<LevelTestConfigurationDto> {
        return this.service.items;
    }

    set items(value: Array<LevelTestConfigurationDto>) {
        this.service.items = value;
    }

    get item(): LevelTestConfigurationDto {
        return this.service.item;
    }

    set item(value: LevelTestConfigurationDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): LevelTestConfigurationCriteria {
        return this.service.criteria;
    }

    set criteria(value: LevelTestConfigurationCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
