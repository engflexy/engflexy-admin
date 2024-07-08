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


import {CategorieSectionCollaboratorService} from 'src/app/shared/service/collaborator/courseref/CategorieSectionCollaborator.service';
import {CategorieSectionDto} from 'src/app/shared/model/courseref/CategorieSection.model';
import {CategorieSectionCriteria} from 'src/app/shared/criteria/courseref/CategorieSectionCriteria.model';

import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuizCollaborator.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCollaboratorService} from 'src/app/shared/service/collaborator/course/SectionCollaborator.service';
import {ExerciceDto} from 'src/app/shared/model/course/Exercice.model';
import {ExerciceCollaboratorService} from 'src/app/shared/service/collaborator/course/ExerciceCollaborator.service';
import {SuperCategorieSectionDto} from 'src/app/shared/model/courseref/SuperCategorieSection.model';
import {SuperCategorieSectionCollaboratorService} from 'src/app/shared/service/collaborator/courseref/SuperCategorieSectionCollaborator.service';
@Component({
  selector: 'app-categorie-section-view-collaborator',
  templateUrl: './categorie-section-view-collaborator.component.html'
})
export class CategorieSectionViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;


    sections = new SectionDto();
    sectionss: Array<SectionDto> = [];

    constructor(private service: CategorieSectionCollaboratorService, private sectionService: SectionCollaboratorService, private superCategorieSectionService: SuperCategorieSectionCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get superCategorieSection(): SuperCategorieSectionDto {
        return this.superCategorieSectionService.item;
    }
    set superCategorieSection(value: SuperCategorieSectionDto) {
        this.superCategorieSectionService.item = value;
    }
    get superCategorieSections(): Array<SuperCategorieSectionDto> {
        return this.superCategorieSectionService.items;
    }
    set superCategorieSections(value: Array<SuperCategorieSectionDto>) {
        this.superCategorieSectionService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<CategorieSectionDto> {
        return this.service.items;
    }

    set items(value: Array<CategorieSectionDto>) {
        this.service.items = value;
    }

    get item(): CategorieSectionDto {
        return this.service.item;
    }

    set item(value: CategorieSectionDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): CategorieSectionCriteria {
        return this.service.criteria;
    }

    set criteria(value: CategorieSectionCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
