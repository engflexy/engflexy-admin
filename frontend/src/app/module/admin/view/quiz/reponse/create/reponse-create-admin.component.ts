import {Component, OnInit} from '@angular/core';

import {AbstractCreateController} from 'src/app/zynerator/controller/AbstractCreateController';

import {ReponseAdminService} from 'src/app/shared/service/admin/quiz/ReponseAdmin.service';
import {ReponseDto} from 'src/app/shared/model/quiz/Reponse.model';
import {ReponseCriteria} from 'src/app/shared/criteria/quiz/ReponseCriteria.model';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionAdminService} from 'src/app/shared/service/admin/quiz/QuestionAdmin.service';

@Component({
    selector: 'app-reponse-create-admin',
    templateUrl: './reponse-create-admin.component.html'
})
export class ReponseCreateAdminComponent extends AbstractCreateController<ReponseDto, ReponseCriteria, ReponseAdminService> implements OnInit {


    constructor(private reponseService: ReponseAdminService, private questionService: QuestionAdminService) {
        super(reponseService);
    }

    private _validReponseRef = true;

    get validReponseRef(): boolean {
        return this._validReponseRef;
    }

    set validReponseRef(value: boolean) {
        this._validReponseRef = value;
    }

    private _validReponseLib = true;

    get validReponseLib(): boolean {
        return this._validReponseLib;
    }

    set validReponseLib(value: boolean) {
        this._validReponseLib = value;
    }

    private _validQuestionRef = true;

    get validQuestionRef(): boolean {
        return this._validQuestionRef;
    }

    set validQuestionRef(value: boolean) {
        this._validQuestionRef = value;
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

    get createQuestionDialog(): boolean {
        return this.questionService.createDialog;
    }

    set createQuestionDialog(value: boolean) {
        this.questionService.createDialog = value;
    }

    ngOnInit(): void {
        this.question = new QuestionDto();
        this.questionService.findAll().subscribe((data) => this.questions = data);
    }

    public override setValidation(value: boolean) {
        this.validReponseRef = value;
        this.validReponseLib = value;
    }

    public override validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validateReponseRef();
        this.validateReponseLib();
    }

    public validateReponseRef() {
        if (this.stringUtilService.isEmpty(this.item.ref)) {
            this.errorMessages.push('Ref non valide');
            this.validReponseRef = false;
        } else {
            this.validReponseRef = true;
        }
    }

    public validateReponseLib() {
        if (this.stringUtilService.isEmpty(this.item.lib)) {
            this.errorMessages.push('Lib non valide');
            this.validReponseLib = false;
        } else {
            this.validReponseLib = true;
        }
    }

    public async openCreateQuestion(question: string) {
        const isPermistted = await this.roleService.isPermitted('Question', 'add');
        if (isPermistted) {
            this.question = new QuestionDto();
            this.createQuestionDialog = true;
        } else {
            this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }


}
