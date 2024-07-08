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


import {FaqProfCollaboratorService} from 'src/app/shared/service/collaborator/faq/FaqProfCollaborator.service';
import {FaqProfDto} from 'src/app/shared/model/faq/FaqProf.model';
import {FaqProfCriteria} from 'src/app/shared/criteria/faq/FaqProfCriteria.model';

import {FaqTypeDto} from 'src/app/shared/model/faq/FaqType.model';
import {FaqTypeCollaboratorService} from 'src/app/shared/service/collaborator/faq/FaqTypeCollaborator.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfCollaboratorService} from 'src/app/shared/service/collaborator/prof/ProfCollaborator.service';
@Component({
  selector: 'app-faq-prof-view-collaborator',
  templateUrl: './faq-prof-view-collaborator.component.html'
})
export class FaqProfViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: FaqProfCollaboratorService, private faqTypeService: FaqTypeCollaboratorService, private profService: ProfCollaboratorService){
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

    get items(): Array<FaqProfDto> {
        return this.service.items;
    }

    set items(value: Array<FaqProfDto>) {
        this.service.items = value;
    }

    get item(): FaqProfDto {
        return this.service.item;
    }

    set item(value: FaqProfDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): FaqProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: FaqProfCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
