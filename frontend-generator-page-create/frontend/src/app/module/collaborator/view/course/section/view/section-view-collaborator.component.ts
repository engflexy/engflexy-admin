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


import {SectionCollaboratorService} from 'src/app/shared/service/collaborator/course/SectionCollaborator.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCriteria} from 'src/app/shared/criteria/course/SectionCriteria.model';

import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuizCollaborator.service';
import {QuizEtudiantDto} from 'src/app/shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/quizetudiant/QuizEtudiantCollaborator.service';
import {ContentTypeDto} from 'src/app/shared/model/courseref/ContentType.model';
import {ContentTypeCollaboratorService} from 'src/app/shared/service/collaborator/courseref/ContentTypeCollaborator.service';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuestionCollaborator.service';
import {ExerciceDto} from 'src/app/shared/model/course/Exercice.model';
import {ExerciceCollaboratorService} from 'src/app/shared/service/collaborator/course/ExerciceCollaborator.service';
@Component({
  selector: 'app-section-view-collaborator',
  templateUrl: './section-view-collaborator.component.html'
})
export class SectionViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;


    quizs = new QuizDto();
    quizss: Array<QuizDto> = [];
    exercices = new ExerciceDto();
    exercicess: Array<ExerciceDto> = [];

    constructor(private service: SectionCollaboratorService, private quizService: QuizCollaboratorService, private contentTypeService: ContentTypeCollaboratorService, private exerciceService: ExerciceCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get contentType(): ContentTypeDto {
        return this.contentTypeService.item;
    }
    set contentType(value: ContentTypeDto) {
        this.contentTypeService.item = value;
    }
    get contentTypes(): Array<ContentTypeDto> {
        return this.contentTypeService.items;
    }
    set contentTypes(value: Array<ContentTypeDto>) {
        this.contentTypeService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<SectionDto> {
        return this.service.items;
    }

    set items(value: Array<SectionDto>) {
        this.service.items = value;
    }

    get item(): SectionDto {
        return this.service.item;
    }

    set item(value: SectionDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): SectionCriteria {
        return this.service.criteria;
    }

    set criteria(value: SectionCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
