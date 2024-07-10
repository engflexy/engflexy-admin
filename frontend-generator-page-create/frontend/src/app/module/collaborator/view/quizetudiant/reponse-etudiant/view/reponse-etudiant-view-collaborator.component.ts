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


import {ReponseEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/quizetudiant/ReponseEtudiantCollaborator.service';
import {ReponseEtudiantDto} from 'src/app/shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantCriteria} from 'src/app/shared/criteria/quizetudiant/ReponseEtudiantCriteria.model';

import {QuizEtudiantDto} from 'src/app/shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/quizetudiant/QuizEtudiantCollaborator.service';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuestionCollaborator.service';
import {ReponseDto} from 'src/app/shared/model/quiz/Reponse.model';
import {ReponseCollaboratorService} from 'src/app/shared/service/collaborator/quiz/ReponseCollaborator.service';
@Component({
  selector: 'app-reponse-etudiant-view-collaborator',
  templateUrl: './reponse-etudiant-view-collaborator.component.html'
})
export class ReponseEtudiantViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;



    constructor(private service: ReponseEtudiantCollaboratorService, private quizEtudiantService: QuizEtudiantCollaboratorService, private questionService: QuestionCollaboratorService, private reponseService: ReponseCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get reponse(): ReponseDto {
        return this.reponseService.item;
    }
    set reponse(value: ReponseDto) {
        this.reponseService.item = value;
    }
    get reponses(): Array<ReponseDto> {
        return this.reponseService.items;
    }
    set reponses(value: Array<ReponseDto>) {
        this.reponseService.items = value;
    }
    get question(): QuestionDto {
        return this.questionService.item;
    }
    set question(value: QuestionDto) {
        this.questionService.item = value;
    }
    get questions(): Array<QuestionDto> {
        return this.questionService.items;
    }
    set questions(value: Array<QuestionDto>) {
        this.questionService.items = value;
    }
    get quizEtudiant(): QuizEtudiantDto {
        return this.quizEtudiantService.item;
    }
    set quizEtudiant(value: QuizEtudiantDto) {
        this.quizEtudiantService.item = value;
    }
    get quizEtudiants(): Array<QuizEtudiantDto> {
        return this.quizEtudiantService.items;
    }
    set quizEtudiants(value: Array<QuizEtudiantDto>) {
        this.quizEtudiantService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<ReponseEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<ReponseEtudiantDto>) {
        this.service.items = value;
    }

    get item(): ReponseEtudiantDto {
        return this.service.item;
    }

    set item(value: ReponseEtudiantDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): ReponseEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: ReponseEtudiantCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
