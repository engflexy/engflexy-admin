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


import {PackStudentAdminService} from 'src/app/shared/service/admin/pack/PackStudentAdmin.service';
import {PackStudentDto} from 'src/app/shared/model/pack/PackStudent.model';
import {PackStudentCriteria} from 'src/app/shared/criteria/pack/PackStudentCriteria.model';

import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursAdminService} from 'src/app/shared/service/admin/course/ParcoursAdmin.service';
import {PriceDto} from 'src/app/shared/model/price/Price.model';
import {PriceAdminService} from 'src/app/shared/service/admin/price/PriceAdmin.service';
@Component({
  selector: 'app-pack-student-view-admin',
  templateUrl: './pack-student-view-admin.component.html'
})
export class PackStudentViewAdminComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: PackStudentAdminService, private parcoursService: ParcoursAdminService, private priceService: PriceAdminService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get price(): PriceDto {
        return this.priceService.item;
    }
    set price(value: PriceDto) {
        this.priceService.item = value;
    }
    get prices(): Array<PriceDto> {
        return this.priceService.items;
    }
    set prices(value: Array<PriceDto>) {
        this.priceService.items = value;
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

    get items(): Array<PackStudentDto> {
        return this.service.items;
    }

    set items(value: Array<PackStudentDto>) {
        this.service.items = value;
    }

    get item(): PackStudentDto {
        return this.service.item;
    }

    set item(value: PackStudentDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): PackStudentCriteria {
        return this.service.criteria;
    }

    set criteria(value: PackStudentCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
