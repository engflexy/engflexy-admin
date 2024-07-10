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


import {QuizAdminService} from 'src/app/shared/service/admin/quiz/QuizAdmin.service';
import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCriteria} from 'src/app/shared/criteria/quiz/QuizCriteria.model';

import {QuizEtudiantDto} from 'src/app/shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantAdminService} from 'src/app/shared/service/admin/quizetudiant/QuizEtudiantAdmin.service';
import {TypeDeQuestionDto} from 'src/app/shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionAdminService} from 'src/app/shared/service/admin/quizref/TypeDeQuestionAdmin.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {ReponseEtudiantDto} from 'src/app/shared/model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantAdminService} from 'src/app/shared/service/admin/quizetudiant/ReponseEtudiantAdmin.service';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionAdminService} from 'src/app/shared/service/admin/quiz/QuestionAdmin.service';
import {ReponseDto} from 'src/app/shared/model/quiz/Reponse.model';
import {ReponseAdminService} from 'src/app/shared/service/admin/quiz/ReponseAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';
@Component({
  selector: 'app-quiz-view-admin',
  templateUrl: './quiz-view-admin.component.html'
})
export class QuizViewAdminComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;


    questions = new QuestionDto();
    questionss: Array<QuestionDto> = [];
    quizEtudiants = new QuizEtudiantDto();
    quizEtudiantss: Array<QuizEtudiantDto> = [];

    constructor(private service: QuizAdminService, private quizEtudiantService: QuizEtudiantAdminService, private typeDeQuestionService: TypeDeQuestionAdminService, private etudiantService: EtudiantAdminService, private questionService: QuestionAdminService, private sectionService: SectionAdminService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
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
    get typeDeQuestion(): TypeDeQuestionDto {
        return this.typeDeQuestionService.item;
    }
    set typeDeQuestion(value: TypeDeQuestionDto) {
        this.typeDeQuestionService.item = value;
    }
    get typeDeQuestions(): Array<TypeDeQuestionDto> {
        return this.typeDeQuestionService.items;
    }
    set typeDeQuestions(value: Array<TypeDeQuestionDto>) {
        this.typeDeQuestionService.items = value;
    }

    public hideViewDialog() {
        this.viewDialog = false;
    }

    get items(): Array<QuizDto> {
        return this.service.items;
    }

    set items(value: Array<QuizDto>) {
        this.service.items = value;
    }

    get item(): QuizDto {
        return this.service.item;
    }

    set item(value: QuizDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): QuizCriteria {
        return this.service.criteria;
    }

    set criteria(value: QuizCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
