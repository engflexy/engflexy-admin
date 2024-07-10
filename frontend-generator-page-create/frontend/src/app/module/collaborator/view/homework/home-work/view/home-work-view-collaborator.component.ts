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


import {HomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkCollaborator.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkCriteria} from 'src/app/shared/criteria/homework/HomeWorkCriteria.model';

import {HoweWorkQSTReponseDto} from 'src/app/shared/model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCollaboratorService} from 'src/app/shared/service/collaborator/homework/HoweWorkQSTReponseCollaborator.service';
import {TypeDeQuestionDto} from 'src/app/shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionCollaboratorService} from 'src/app/shared/service/collaborator/quizref/TypeDeQuestionCollaborator.service';
import {HomeWorkEtudiantDto} from 'src/app/shared/model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkEtudiantCollaborator.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from 'src/app/shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {ReponseEtudiantHomeWorkDto} from 'src/app/shared/model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/ReponseEtudiantHomeWorkCollaborator.service';
import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCollaboratorService} from 'src/app/shared/service/collaborator/homework/HomeWorkQuestionCollaborator.service';
import {TypeHomeWorkDto} from 'src/app/shared/model/homework/TypeHomeWork.model';
import {TypeHomeWorkCollaboratorService} from 'src/app/shared/service/collaborator/homework/TypeHomeWorkCollaborator.service';
import {CoursDto} from 'src/app/shared/model/course/Cours.model';
import {CoursCollaboratorService} from 'src/app/shared/service/collaborator/course/CoursCollaborator.service';
@Component({
  selector: 'app-home-work-view-collaborator',
  templateUrl: './home-work-view-collaborator.component.html'
})
export class HomeWorkViewCollaboratorComponent implements OnInit {


	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;


    homeWorkQuestions = new HomeWorkQuestionDto();
    homeWorkQuestionss: Array<HomeWorkQuestionDto> = [];
    homeWorkEtudiants = new HomeWorkEtudiantDto();
    homeWorkEtudiantss: Array<HomeWorkEtudiantDto> = [];

    constructor(private service: HomeWorkCollaboratorService, private typeDeQuestionService: TypeDeQuestionCollaboratorService, private homeWorkEtudiantService: HomeWorkEtudiantCollaboratorService, private etudiantService: EtudiantCollaboratorService, private homeWorkQuestionService: HomeWorkQuestionCollaboratorService, private typeHomeWorkService: TypeHomeWorkCollaboratorService, private coursService: CoursCollaboratorService){
		this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
	}

    ngOnInit(): void {
    }


    get typeHomeWork(): TypeHomeWorkDto {
        return this.typeHomeWorkService.item;
    }
    set typeHomeWork(value: TypeHomeWorkDto) {
        this.typeHomeWorkService.item = value;
    }
    get typeHomeWorks(): Array<TypeHomeWorkDto> {
        return this.typeHomeWorkService.items;
    }
    set typeHomeWorks(value: Array<TypeHomeWorkDto>) {
        this.typeHomeWorkService.items = value;
    }
    get cours(): CoursDto {
        return this.coursService.item;
    }
    set cours(value: CoursDto) {
        this.coursService.item = value;
    }
    get courss(): Array<CoursDto> {
        return this.coursService.items;
    }
    set courss(value: Array<CoursDto>) {
        this.coursService.items = value;
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

    get items(): Array<HomeWorkDto> {
        return this.service.items;
    }

    set items(value: Array<HomeWorkDto>) {
        this.service.items = value;
    }

    get item(): HomeWorkDto {
        return this.service.item;
    }

    set item(value: HomeWorkDto) {
        this.service.item = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): HomeWorkCriteria {
        return this.service.criteria;
    }

    set criteria(value: HomeWorkCriteria) {
        this.service.criteria = value;
    }

    get dateFormat(){
        return environment.dateFormatView;
    }

    get dateFormatColumn(){
        return environment.dateFormatList;
    }


}
