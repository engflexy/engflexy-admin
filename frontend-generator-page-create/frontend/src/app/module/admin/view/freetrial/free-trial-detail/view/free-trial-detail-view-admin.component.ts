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


import {FreeTrialDetailAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialDetailAdmin.service';
import {FreeTrialDetailDto} from 'src/app/shared/model/freetrial/FreeTrialDetail.model';
import {FreeTrialDetailCriteria} from 'src/app/shared/criteria/freetrial/FreeTrialDetailCriteria.model';

import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {FreeTrialDto} from 'src/app/shared/model/freetrial/FreeTrial.model';
import {FreeTrialAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialAdmin.service';
@Component({
  selector: 'app-free-trial-detail-view-admin',
  templateUrl: './free-trial-detail-view-admin.component.html'
})
export class FreeTrialDetailViewAdminComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: FreeTrialDetailAdminService, private etudiantService: EtudiantAdminService, private freeTrialService: FreeTrialAdminService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get freeTrial(): FreeTrialDto {
        return this.freeTrialService.item;
    }
    set freeTrial(value: FreeTrialDto) {
        this.freeTrialService.item = value;
    }
    get freeTrials(): Array<FreeTrialDto> {
        return this.freeTrialService.items;
    }
    set freeTrials(value: Array<FreeTrialDto>) {
        this.freeTrialService.items = value;
    }
    get etudiant(): EtudiantDto {
        return this.etudiantService.item;
    }
    set etudiant(value: EtudiantDto) {
        this.etudiantService.item = value;
    }
    get etudiants(): Array<EtudiantDto> {
        return this.etudiantService.items;
    }
    set etudiants(value: Array<EtudiantDto>) {
        this.etudiantService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<FreeTrialDetailDto> {
        return this.service.items;
    }

    set items(value: Array<FreeTrialDetailDto>) {
        this.service.items = value;
    }

    get item(): FreeTrialDetailDto {
        return this.service.item;
    }

    set item(value: FreeTrialDetailDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): FreeTrialDetailCriteria {
        return this.service.criteria;
    }

    set criteria(value: FreeTrialDetailCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
