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


import {ReclamationProfCollaboratorService} from 'src/app/shared/service/collaborator/recomrecla/ReclamationProfCollaborator.service';
import {ReclamationProfDto} from 'src/app/shared/model/recomrecla/ReclamationProf.model';
import {ReclamationProfCriteria} from 'src/app/shared/criteria/recomrecla/ReclamationProfCriteria.model';

import {TypeReclamationProfDto} from 'src/app/shared/model/recomrecla/TypeReclamationProf.model';
import {TypeReclamationProfCollaboratorService} from 'src/app/shared/service/collaborator/recomrecla/TypeReclamationProfCollaborator.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfCollaboratorService} from 'src/app/shared/service/collaborator/prof/ProfCollaborator.service';
@Component({
  selector: 'app-reclamation-prof-view-collaborator',
  templateUrl: './reclamation-prof-view-collaborator.component.html'
})
export class ReclamationProfViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: ReclamationProfCollaboratorService, private typeReclamationProfService: TypeReclamationProfCollaboratorService, private profService: ProfCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get typeReclamationProf(): TypeReclamationProfDto {
        return this.typeReclamationProfService.item;
    }
    set typeReclamationProf(value: TypeReclamationProfDto) {
        this.typeReclamationProfService.item = value;
    }
    get typeReclamationProfs(): Array<TypeReclamationProfDto> {
        return this.typeReclamationProfService.items;
    }
    set typeReclamationProfs(value: Array<TypeReclamationProfDto>) {
        this.typeReclamationProfService.items = value;
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

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<ReclamationProfDto> {
        return this.service.items;
    }

    set items(value: Array<ReclamationProfDto>) {
        this.service.items = value;
    }

    get item(): ReclamationProfDto {
        return this.service.item;
    }

    set item(value: ReclamationProfDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): ReclamationProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReclamationProfCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
