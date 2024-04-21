import {Component, OnInit} from '@angular/core';

import {AbstractCreateController} from 'src/app/zynerator/controller/AbstractCreateController';

import {QuizAdminService} from 'src/app/shared/service/admin/quiz/QuizAdmin.service';
import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCriteria} from 'src/app/shared/criteria/quiz/QuizCriteria.model';
import {QuizEtudiantDto} from 'src/app/shared/model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantAdminService} from 'src/app/shared/service/admin/quizetudiant/QuizEtudiantAdmin.service';
import {TypeDeQuestionDto} from 'src/app/shared/model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionAdminService} from 'src/app/shared/service/admin/quizref/TypeDeQuestionAdmin.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {QuestionDto} from 'src/app/shared/model/quiz/Question.model';
import {QuestionAdminService} from 'src/app/shared/service/admin/quiz/QuestionAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkAdminService} from 'src/app/shared/service/admin/homework/HomeWorkAdmin.service';

@Component({
    selector: 'app-quiz-create-admin',
    templateUrl: './quiz-create-admin.component.html'
})
export class QuizCreateAdminComponent extends AbstractCreateController<QuizDto, QuizCriteria, QuizAdminService> implements OnInit {

    constructor(private quizService: QuizAdminService, private quizEtudiantService: QuizEtudiantAdminService, private typeDeQuestionService: TypeDeQuestionAdminService, private etudiantService: EtudiantAdminService, private questionService: QuestionAdminService, private sectionService: SectionAdminService, private homeWorkService: HomeWorkAdminService) {
        super(quizService);
    }

    private _questionsElement = new QuestionDto();

    get questionsElement(): QuestionDto {
        if (this._questionsElement == null)
            this._questionsElement = new QuestionDto();
        return this._questionsElement;
    }

    set questionsElement(value: QuestionDto) {
        this._questionsElement = value;
    }

    private _quizEtudiantsElement = new QuizEtudiantDto();

    get quizEtudiantsElement(): QuizEtudiantDto {
        if (this._quizEtudiantsElement == null)
            this._quizEtudiantsElement = new QuizEtudiantDto();
        return this._quizEtudiantsElement;
    }

    set quizEtudiantsElement(value: QuizEtudiantDto) {
        this._quizEtudiantsElement = value;
    }

    private _validQuizRef = true;

    get validQuizRef(): boolean {
        return this._validQuizRef;
    }

    set validQuizRef(value: boolean) {
        this._validQuizRef = value;
    }

    private _validQuizLib = true;

    get validQuizLib(): boolean {
        return this._validQuizLib;
    }

    set validQuizLib(value: boolean) {
        this._validQuizLib = value;
    }

    private _validQuestionsRef = true;

    get validQuestionsRef(): boolean {
        return this._validQuestionsRef;
    }

    set validQuestionsRef(value: boolean) {
        this._validQuestionsRef = value;
    }

    private _validQuizEtudiantsRef = true;

    get validQuizEtudiantsRef(): boolean {
        return this._validQuizEtudiantsRef;
    }

    set validQuizEtudiantsRef(value: boolean) {
        this._validQuizEtudiantsRef = value;
    }

    private _validSectionCode = true;

    get validSectionCode(): boolean {
        return this._validSectionCode;
    }

    set validSectionCode(value: boolean) {
        this._validSectionCode = value;
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

    get createSectionDialog(): boolean {
        return this.sectionService.createDialog;
    }

    set createSectionDialog(value: boolean) {
        this.sectionService.createDialog = value;
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

    get createEtudiantDialog(): boolean {
        return this.etudiantService.createDialog;
    }

    set createEtudiantDialog(value: boolean) {
        this.etudiantService.createDialog = value;
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

    get createTypeDeQuestionDialog(): boolean {
        return this.typeDeQuestionService.createDialog;
    }

    set createTypeDeQuestionDialog(value: boolean) {
        this.typeDeQuestionService.createDialog = value;
    }

    get homeWork(): HomeWorkDto {
        return this.homeWorkService.item;
    }

    set homeWork(value: HomeWorkDto) {
        this.homeWorkService.item = value;
    }

    get homeWorks(): Array<HomeWorkDto> {
        return this.homeWorkService.items;
    }

    set homeWorks(value: Array<HomeWorkDto>) {
        this.homeWorkService.items = value;
    }

    get createHomeWorkDialog(): boolean {
        return this.homeWorkService.createDialog;
    }

    set createHomeWorkDialog(value: boolean) {
        this.homeWorkService.createDialog = value;
    }

    ngOnInit(): void {
        this.questionsElement.typeDeQuestion = new TypeDeQuestionDto();
        this.typeDeQuestionService.findAll().subscribe((data) => this.typeDeQuestions = data);
        this.questionsElement.homeWork = new HomeWorkDto();
        this.homeWorkService.findAll().subscribe((data) => this.homeWorks = data);
        this.quizEtudiantsElement.etudiant = new EtudiantDto();
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
        this.section = new SectionDto();
        this.sectionService.findAll().subscribe((data) => this.sections = data);
    }

    validateQuestions() {
        this.errorMessages = [];
        this.validateQuestionsRef();
    }

    validateQuizEtudiants() {
        this.errorMessages = [];
        this.validateQuizEtudiantsRef();
    }

    public override setValidation(value: boolean) {
        this.validQuizRef = value;
        this.validQuizLib = value;
        this.validQuestionsRef = value;
        this.validQuizEtudiantsRef = value;
    }

    public addQuestions() {
        if (this.item.questions == null)
            this.item.questions = new Array<QuestionDto>();
        this.validateQuestions();
        if (this.errorMessages.length === 0) {
            this.item.questions.push({...this.questionsElement});
            this.questionsElement = new QuestionDto();
        } else {
            this.messageService.add({
                severity: 'error',
                summary: 'Erreurs',
                detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages
            });
        }
    }

    public deletequestions(p: QuestionDto) {
        this.item.questions.forEach((element, index) => {
            if (element === p) {
                this.item.questions.splice(index, 1);
            }
        });
    }

    public editquestions(p: QuestionDto) {
        this.questionsElement = {...p};
        this.activeTab = 0;
    }

    public addQuizEtudiants() {
        if (this.item.quizEtudiants == null)
            this.item.quizEtudiants = new Array<QuizEtudiantDto>();
        this.validateQuizEtudiants();
        if (this.errorMessages.length === 0) {
            this.item.quizEtudiants.push({...this.quizEtudiantsElement});
            this.quizEtudiantsElement = new QuizEtudiantDto();
        } else {
            this.messageService.add({
                severity: 'error',
                summary: 'Erreurs',
                detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages
            });
        }
    }

    public deletequizEtudiants(p: QuizEtudiantDto) {
        this.item.quizEtudiants.forEach((element, index) => {
            if (element === p) {
                this.item.quizEtudiants.splice(index, 1);
            }
        });
    }

    public editquizEtudiants(p: QuizEtudiantDto) {
        this.quizEtudiantsElement = {...p};
        this.activeTab = 0;
    }

    public override validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validateQuizRef();
        this.validateQuizLib();
    }

    public validateQuizRef() {
        if (this.stringUtilService.isEmpty(this.item.ref)) {
            this.errorMessages.push('Ref non valide');
            this.validQuizRef = false;
        } else {
            this.validQuizRef = true;
        }
    }

    public validateQuizLib() {
        if (this.stringUtilService.isEmpty(this.item.lib)) {
            this.errorMessages.push('Lib non valide');
            this.validQuizLib = false;
        } else {
            this.validQuizLib = true;
        }
    }

    public validateQuestionsRef() {
        if (this.questionsElement.ref == null) {
            this.errorMessages.push('Ref de la question est  invalide');
            this.validQuestionsRef = false;
        } else {
            this.validQuestionsRef = true;
        }
    }

    public validateQuizEtudiantsRef() {
        if (this.quizEtudiantsElement.ref == null) {
            this.errorMessages.push('Ref de la quizEtudiant est  invalide');
            this.validQuizEtudiantsRef = false;
        } else {
            this.validQuizEtudiantsRef = true;
        }
    }

}
