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


import {TypeReclamationEtudiantAdminService} from 'src/app/shared/service/admin/recomrecla/TypeReclamationEtudiantAdmin.service';
import {TypeReclamationEtudiantDto} from 'src/app/shared/model/recomrecla/TypeReclamationEtudiant.model';
import {TypeReclamationEtudiantCriteria} from 'src/app/shared/criteria/recomrecla/TypeReclamationEtudiantCriteria.model';

@Component({
  selector: 'app-type-reclamation-etudiant-view-admin',
  templateUrl: './type-reclamation-etudiant-view-admin.component.html'
})
export class TypeReclamationEtudiantViewAdminComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: TypeReclamationEtudiantAdminService){
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

    get items(): Array<TypeReclamationEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<TypeReclamationEtudiantDto>) {
        this.service.items = value;
    }

    get item(): TypeReclamationEtudiantDto {
        return this.service.item;
    }

    set item(value: TypeReclamationEtudiantDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): TypeReclamationEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: TypeReclamationEtudiantCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}