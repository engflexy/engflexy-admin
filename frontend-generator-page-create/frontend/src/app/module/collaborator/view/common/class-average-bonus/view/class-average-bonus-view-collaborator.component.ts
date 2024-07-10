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


import {ClassAverageBonusCollaboratorService} from 'src/app/shared/service/collaborator/common/ClassAverageBonusCollaborator.service';
import {ClassAverageBonusDto} from 'src/app/shared/model/common/ClassAverageBonus.model';
import {ClassAverageBonusCriteria} from 'src/app/shared/criteria/common/ClassAverageBonusCriteria.model';

import {CollaboratorDto} from 'src/app/shared/model/vocab/Collaborator.model';
import {CollaboratorCollaboratorService} from 'src/app/shared/service/collaborator/vocab/CollaboratorCollaborator.service';
@Component({
  selector: 'app-class-average-bonus-view-collaborator',
  templateUrl: './class-average-bonus-view-collaborator.component.html'
})
export class ClassAverageBonusViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: ClassAverageBonusCollaboratorService, private collaboratorService: CollaboratorCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get collaborator(): CollaboratorDto {
        return this.collaboratorService.item;
    }
    set collaborator(value: CollaboratorDto) {
        this.collaboratorService.item = value;
    }
    get collaborators(): Array<CollaboratorDto> {
        return this.collaboratorService.items;
    }
    set collaborators(value: Array<CollaboratorDto>) {
        this.collaboratorService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<ClassAverageBonusDto> {
        return this.service.items;
    }

    set items(value: Array<ClassAverageBonusDto>) {
        this.service.items = value;
    }

    get item(): ClassAverageBonusDto {
        return this.service.item;
    }

    set item(value: ClassAverageBonusDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): ClassAverageBonusCriteria {
        return this.service.criteria;
    }

    set criteria(value: ClassAverageBonusCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
