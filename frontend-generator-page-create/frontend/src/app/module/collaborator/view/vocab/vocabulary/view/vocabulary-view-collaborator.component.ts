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


import {VocabularyCollaboratorService} from 'src/app/shared/service/collaborator/vocab/VocabularyCollaborator.service';
import {VocabularyDto} from 'src/app/shared/model/vocab/Vocabulary.model';
import {VocabularyCriteria} from 'src/app/shared/criteria/vocab/VocabularyCriteria.model';

import {VocabularyQuizDto} from 'src/app/shared/model/vocab/VocabularyQuiz.model';
import {VocabularyQuizCollaboratorService} from 'src/app/shared/service/collaborator/vocab/VocabularyQuizCollaborator.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCollaboratorService} from 'src/app/shared/service/collaborator/course/SectionCollaborator.service';
@Component({
  selector: 'app-vocabulary-view-collaborator',
  templateUrl: './vocabulary-view-collaborator.component.html'
})
export class VocabularyViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: VocabularyCollaboratorService, private vocabularyQuizService: VocabularyQuizCollaboratorService, private sectionService: SectionCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get vocabularyQuiz(): VocabularyQuizDto {
        return this.vocabularyQuizService.item;
    }
    set vocabularyQuiz(value: VocabularyQuizDto) {
        this.vocabularyQuizService.item = value;
    }
    get vocabularyQuizs(): Array<VocabularyQuizDto> {
        return this.vocabularyQuizService.items;
    }
    set vocabularyQuizs(value: Array<VocabularyQuizDto>) {
        this.vocabularyQuizService.items = value;
    }
    get section(): SectionDto {
        return this.sectionService.item;
    }
    set section(value: SectionDto) {
        this.sectionService.item = value;
    }
    get sections(): Array<SectionDto> {
        return this.sectionService.items;
    }
    set sections(value: Array<SectionDto>) {
        this.sectionService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<VocabularyDto> {
        return this.service.items;
    }

    set items(value: Array<VocabularyDto>) {
        this.service.items = value;
    }

    get item(): VocabularyDto {
        return this.service.item;
    }

    set item(value: VocabularyDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): VocabularyCriteria {
        return this.service.criteria;
    }

    set criteria(value: VocabularyCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
