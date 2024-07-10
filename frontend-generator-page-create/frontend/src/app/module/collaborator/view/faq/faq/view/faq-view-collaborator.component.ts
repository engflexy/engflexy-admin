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


import {FaqCollaboratorService} from 'src/app/shared/service/collaborator/faq/FaqCollaborator.service';
import {FaqDto} from 'src/app/shared/model/faq/Faq.model';
import {FaqCriteria} from 'src/app/shared/criteria/faq/FaqCriteria.model';

import {FaqTypeDto} from 'src/app/shared/model/faq/FaqType.model';
import {FaqTypeCollaboratorService} from 'src/app/shared/service/collaborator/faq/FaqTypeCollaborator.service';
@Component({
  selector: 'app-faq-view-collaborator',
  templateUrl: './faq-view-collaborator.component.html'
})
export class FaqViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: FaqCollaboratorService, private faqTypeService: FaqTypeCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get faqType(): FaqTypeDto {
        return this.faqTypeService.item;
    }
    set faqType(value: FaqTypeDto) {
        this.faqTypeService.item = value;
    }
    get faqTypes(): Array<FaqTypeDto> {
        return this.faqTypeService.items;
    }
    set faqTypes(value: Array<FaqTypeDto>) {
        this.faqTypeService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<FaqDto> {
        return this.service.items;
    }

    set items(value: Array<FaqDto>) {
        this.service.items = value;
    }

    get item(): FaqDto {
        return this.service.item;
    }

    set item(value: FaqDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): FaqCriteria {
        return this.service.criteria;
    }

    set criteria(value: FaqCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
