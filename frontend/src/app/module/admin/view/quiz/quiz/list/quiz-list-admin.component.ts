import {Component, OnInit} from '@angular/core';
import {QuizAdminService} from 'src/app/shared/service/admin/quiz/QuizAdmin.service';
import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCriteria} from 'src/app/shared/criteria/quiz/QuizCriteria.model';
import {AbstractListController} from 'src/app/zynerator/controller/AbstractListController';
import {environment} from 'src/environments/environment';
import {QuizEtudiantAdminService} from 'src/app/shared/service/admin/quizetudiant/QuizEtudiantAdmin.service';
import {TypeDeQuestionAdminService} from 'src/app/shared/service/admin/quizref/TypeDeQuestionAdmin.service';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {QuestionAdminService} from 'src/app/shared/service/admin/quiz/QuestionAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';
import {HomeWorkAdminService} from 'src/app/shared/service/admin/homework/HomeWorkAdmin.service';


@Component({
    selector: 'app-quiz-list-admin',
    templateUrl: './quiz-list-admin.component.html'
})
export class QuizListAdminComponent extends AbstractListController<QuizDto, QuizCriteria, QuizAdminService> implements OnInit {

    override fileName = 'Quiz';


    sections: Array<SectionDto>;


    constructor(private quizService: QuizAdminService, private quizEtudiantService: QuizEtudiantAdminService, private typeDeQuestionService: TypeDeQuestionAdminService, private etudiantService: EtudiantAdminService, private questionService: QuestionAdminService, private sectionService: SectionAdminService, private homeWorkService: HomeWorkAdminService) {
        super(quizService);
    }

    ngOnInit(): void {
        this.activateSecurityConstraint('Quiz').subscribe(() => {
            if (true || this.listActionIsValid) {
                this.findPaginatedByCriteria();
                this.initExport();
                this.initCol();
                this.loadSection();
            }
        });
    }


    public override initCol() {
        this.cols = [
            {field: 'ref', header: 'Ref'},
            {field: 'lib', header: 'Lib'},
            {field: 'dateDebut', header: 'Date debut'},
            {field: 'dateFin', header: 'Date fin'},
            {field: 'section?.code', header: 'Section'},
            {field: 'numero', header: 'Numero'},
            {field: 'seuilReussite', header: 'Seuil reussite'},
        ];
    }


    public async loadSection() {
        this.sectionService.findAllOptimized().subscribe(sections => this.sections = sections, error => console.log(error))
    }

    public override initDuplicate(res: QuizDto) {
        if (res.questions != null) {
            res.questions.forEach(d => {
                d.quiz = null;
                d.id = null;
            });
        }
        if (res.quizEtudiants != null) {
            res.quizEtudiants.forEach(d => {
                d.quiz = null;
                d.id = null;
            });
        }
    }


    public override prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                'Ref': e.ref,
                'Lib': e.lib,
                'Date debut': this.datePipe.transform(e.dateDebut, 'dd/MM/yyyy hh:mm'),
                'Date fin': this.datePipe.transform(e.dateFin, 'dd/MM/yyyy hh:mm'),
                'Section': e.section?.code,
                'Numero': e.numero,
                'Seuil reussite': e.seuilReussite,
            }
        });

        this.criteriaData = [{
            'Ref': this.criteria.ref ? this.criteria.ref : environment.emptyForExport,
            'Lib': this.criteria.lib ? this.criteria.lib : environment.emptyForExport,
            'Date debut Min': this.criteria.dateDebutFrom ? this.datePipe.transform(this.criteria.dateDebutFrom, this.dateFormat) : environment.emptyForExport,
            'Date debut Max': this.criteria.dateDebutTo ? this.datePipe.transform(this.criteria.dateDebutTo, this.dateFormat) : environment.emptyForExport,
            'Date fin Min': this.criteria.dateFinFrom ? this.datePipe.transform(this.criteria.dateFinFrom, this.dateFormat) : environment.emptyForExport,
            'Date fin Max': this.criteria.dateFinTo ? this.datePipe.transform(this.criteria.dateFinTo, this.dateFormat) : environment.emptyForExport,
            //'Section': this.criteria.section?.code ? this.criteria.section?.code : environment.emptyForExport ,
            'Numero Min': this.criteria.numeroMin ? this.criteria.numeroMin : environment.emptyForExport,
            'Numero Max': this.criteria.numeroMax ? this.criteria.numeroMax : environment.emptyForExport,
            'Seuil reussite Min': this.criteria.seuilReussiteMin ? this.criteria.seuilReussiteMin : environment.emptyForExport,
            'Seuil reussite Max': this.criteria.seuilReussiteMax ? this.criteria.seuilReussiteMax : environment.emptyForExport,
        }];
    }
}
