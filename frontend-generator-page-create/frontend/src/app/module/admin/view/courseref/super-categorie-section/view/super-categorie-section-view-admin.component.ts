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


import {SuperCategorieSectionAdminService} from 'src/app/shared/service/admin/courseref/SuperCategorieSectionAdmin.service';
import {SuperCategorieSectionDto} from 'src/app/shared/model/courseref/SuperCategorieSection.model';
import {SuperCategorieSectionCriteria} from 'src/app/shared/criteria/courseref/SuperCategorieSectionCriteria.model';

import {CategorieSectionDto} from 'src/app/shared/model/courseref/CategorieSection.model';
import {CategorieSectionAdminService} from 'src/app/shared/service/admin/courseref/CategorieSectionAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';
@Component({
  selector: 'app-super-categorie-section-view-admin',
  templateUrl: './super-categorie-section-view-admin.component.html'
})
export class SuperCategorieSectionViewAdminComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;


    categorieSections = new CategorieSectionDto();
    categorieSectionss: Array<CategorieSectionDto> = [];

    constructor(private service: SuperCategorieSectionAdminService, private categorieSectionService: CategorieSectionAdminService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }



    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<SuperCategorieSectionDto> {
        return this.service.items;
    }

    set items(value: Array<SuperCategorieSectionDto>) {
        this.service.items = value;
    }

    get item(): SuperCategorieSectionDto {
        return this.service.item;
    }

    set item(value: SuperCategorieSectionDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): SuperCategorieSectionCriteria {
        return this.service.criteria;
    }

    set criteria(value: SuperCategorieSectionCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
