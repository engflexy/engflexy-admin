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


import {InviteStudentAdminService} from 'src/app/shared/service/admin/inscriptionref/InviteStudentAdmin.service';
import {InviteStudentDto} from 'src/app/shared/model/inscriptionref/InviteStudent.model';
import {InviteStudentCriteria} from 'src/app/shared/criteria/inscriptionref/InviteStudentCriteria.model';

import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
@Component({
  selector: 'app-invite-student-view-admin',
  templateUrl: './invite-student-view-admin.component.html'
})
export class InviteStudentViewAdminComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: InviteStudentAdminService, private etudiantService: EtudiantAdminService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
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

    get items(): Array<InviteStudentDto> {
        return this.service.items;
    }

    set items(value: Array<InviteStudentDto>) {
        this.service.items = value;
    }

    get item(): InviteStudentDto {
        return this.service.item;
    }

    set item(value: InviteStudentDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): InviteStudentCriteria {
        return this.service.criteria;
    }

    set criteria(value: InviteStudentCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
