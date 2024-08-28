import {ChangeDetectorRef, Component, Input, OnInit} from '@angular/core';
import {ImagesService} from "../../../../../../shared/service/public/images.service";
import {FuseAlertService} from "../../../../../../../@fuse/components/alert";
import {
    SectionCollaboratorService
} from "../../../../../../shared/service/collaborator/course/SectionCollaborator.service";
import {
    ExerciceCollaboratorService
} from "../../../../../../shared/service/collaborator/course/ExerciceCollaborator.service";
import {ExerciceDto} from "../../../../../../shared/model/course/Exercice.model";
import {SectionDto} from "../../../../../../shared/model/course/Section.model";
import {
    TypeDeQuestionCollaboratorService
} from "../../../../../../shared/service/collaborator/quizref/TypeDeQuestionCollaborator.service";
import {TypeDeQuestionDto} from "../../../../../../shared/model/quizref/TypeDeQuestion.model";
import {compareObjects, generateRandomString} from "../../../../../../shared/constant/global-funsctions";
import {TYPE_QUESTION} from "../../../../../../shared/utils/enums";
import {QuizCollaboratorService} from "../../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";
import {QuizDto} from "../../../../../../shared/model/quiz/Quiz.model";
import {QuestionDto} from "../../../../../../shared/model/quiz/Question.model";
import {ReponseDto} from "../../../../../../shared/model/quiz/Reponse.model";
import {MatDialog} from "@angular/material/dialog";
import {TypesQuestionComponent} from "../types-question/types-question.component";
import {EditAnswersComponent} from "./edit-answers/edit-answers.component";
import {
    ReponseCollaboratorService
} from "../../../../../../shared/service/collaborator/quiz/ReponseCollaborator.service";
import {
    QuestionCollaboratorService
} from "../../../../../../shared/service/collaborator/quiz/QuestionCollaborator.service";
import {AngularEditorConfig} from "@kolkov/angular-editor";
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';



@Component({
    selector: 'app-create-quiz',
    templateUrl: './create-quiz.component.html',
})
export class CreateQuizComponent implements OnInit {
    protected readonly TYPE_QUESTION = TYPE_QUESTION;
    safeHtml: SafeHtml;
    @Input()
    type: string
    types: Array<TypeDeQuestionDto> = new Array<TypeDeQuestionDto>()
    selectedFile: File | null = null;
    imagesList: Array<{ url, desc }> = new Array<{ url; desc }>()
    question: QuestionDto = new QuestionDto()
    answer: ReponseDto = new ReponseDto()
    showSimulation: boolean = false
    answerFieldRequired: boolean = false
    editField: number = -1;
    editQstField: number = -1;
    editing: boolean = false
    selectedQuestion: QuestionDto
    editorConfig: AngularEditorConfig = {
        editable: true,
        spellcheck: true,
        height: 'auto',
        minHeight: '100px',
        maxHeight: 'auto',
        width: 'auto',
        minWidth: '0',
        translate: 'yes',
        enableToolbar: true,
        showToolbar: true,
        placeholder: 'Enter text here...',
        defaultParagraphSeparator: '',
        defaultFontName: '',
        defaultFontSize: '',
        fonts: [
            {class: 'arial', name: 'Arial'},
            {class: 'times-new-roman', name: 'Times New Roman'},
            {class: 'calibri', name: 'Calibri'},
            {class: 'comic-sans-ms', name: 'Comic Sans MS'}
        ],
        customClasses: [
            {
                name: 'quote',
                class: 'quote',
            },
            {
                name: 'redText',
                class: 'redText'
            },
            {
                name: 'titleText',
                class: 'titleText',
                tag: 'h1',
            },
        ],
        uploadWithCredentials: false,
        sanitize: true,
        toolbarPosition: 'top'
    };

    constructor(
        private imageService: ImagesService,
        private alert: FuseAlertService,
        private dialog: MatDialog,
        private ref: ChangeDetectorRef,
        private quizService: QuizCollaboratorService,
        private reponseService: ReponseCollaboratorService,
        private questionService: QuestionCollaboratorService,
        private typeQuestion: TypeDeQuestionCollaboratorService,
        private sectionService: SectionCollaboratorService,
        private exerciseService: ExerciceCollaboratorService,
        private sanitizer: DomSanitizer ) {
    }


    get exercise(): ExerciceDto {
        return this.exerciseService.item
    }

    set exercise(item: ExerciceDto) {
        this.exerciseService.item = item
    }

    get quiz(): QuizDto {
        return this.quizService.item
    }

    set quiz(item: QuizDto) {
        this.quizService.item = item
    }


    get selectedSection(): SectionDto {
        return this.sectionService.item
    }

    set selectedSection(item: SectionDto) {
        this.sectionService.item = item
    }

   sanitizeHtml(html: string): SafeHtml {
    return this.sanitizer.bypassSecurityTrustHtml(html);
}

    ngOnInit() {
        this.typeQuestion.findAll().subscribe(res => {
            this.types = res
            this.question.typeDeQuestion = res.find(s => s.ref === this.type)
            this.question.numero = this.quiz.questions?.length + 1
            this.ref.markForCheck()
        })

    }


    onFileSelected(event: any): void {
        var file = event.target.files[0];
        if (!this.isImageFile(file)) {
            this.alert.show('warning', 'Only ".gif", ".jpeg", ".png" extensions are allowed. Please upload an image file')
            this.selectedFile = null
        } else {
            this.selectedFile = file;
            const formData: FormData = new FormData();
            formData.append('img', this.selectedFile);
            const name = generateRandomString(10)
            this.imageService.generate_img_url(name, formData)
                .subscribe(res => {
                    const ulr = {url: res, desc: null}
                    this.imagesList.push(ulr)
                }, error => {
                    if (error?.status === 200) {
                        const ulr = {url: error?.error?.text, desc: null}
                        this.imagesList.push(ulr)
                    } else {
                        this.alert.show('warning', error?.error || 'something went wrong please try again.')
                    }
                })
        }
    }

    private isImageFile(file: File): boolean {
        return ["image/gif", "image/webp", "image/jpeg", "image/png"].includes(file.type);
    }

    removeImage(item: { url; desc }, i: number) {
        this.imagesList.splice(i, 1)
    }


    openTypesOfQsts() {
        const dialog = this.dialog.open(TypesQuestionComponent);
        dialog.afterClosed().subscribe(res => {
            console.log(res)
            this.type = String(res)
            this.question.typeDeQuestion = this.types.find(s => s.ref === this.type)
            this.question.numero = this.quiz.questions?.length + 1
            this.ref.markForCheck()
        })
    }

    protected readonly compareObjects = compareObjects;


    saveQuestion() {

        //set answer to the question
        if (this.type === TYPE_QUESTION.TRUE_OR_FALSE) {

            if (this.answer?.lib && this.answer?.lib?.length > 2) {
                this.answerFieldRequired = false
                this.answer.etatReponse = true
                this.answer.lib = this.answer.lib.toString()
                this.answer.numero = 1
                if (!this.question?.reponses)
                    this.question.reponses = new Array<ReponseDto>()
                this.question.reponses.push({...this.answer})
            } else {
                this.answerFieldRequired = true
                this.ref.markForCheck()
                return
            }
        }

        // Check if the question already exists in the quiz.questions array
        const existingQuestionIndex = this.quiz.questions.findIndex(q => q.id === this.question.id);

        if (existingQuestionIndex !== -1) {
            // If the question already exists, update it
            this.quiz.questions[existingQuestionIndex] = {...this.question};
        } else {
            // If the question does not exist, add it
            this.question.numero = this.quiz.questions.length + 1;
            this.quiz.questions.push({...this.question});
        }

       // this.question.numero = this.quiz.questions.length + 1
        this.sanitizeHtml(this.question.libelle);
       // this.quiz.questions.push({...this.question})
        this.question = new QuestionDto()
        this.question.typeDeQuestion = this.types.find(s => s.ref === this.type)
        this.question.numero = this.quiz.questions.length + 1
        console.log(this.quiz)
    }


    getPlaceHolder(): string {
        if (this.question.typeDeQuestion.ref === this.TYPE_QUESTION.CHOOSE_THE_CORRECT_ALTERNATIVE) {
            return 'Example: We must ... the train at the next stop. ' +
                ' (Use at last 3 points)';
        } else if (this.question.typeDeQuestion.ref === this.TYPE_QUESTION.CORRECT_THE_MISTAKE) {
            return 'Example: We must @get on@  the train at the next stop. ' +
                ' (Put the mistake between two "@")';
        } else if (this.question.typeDeQuestion.ref === this.TYPE_QUESTION.WRITE_THE_CORRECT_FORM) {
            return 'Example: He @to want@ all of them. ' +
                ' (Put the verb between two "@")';
        } else if (this.question.typeDeQuestion.ref === this.TYPE_QUESTION.DRAG_AND_DROP) {
            return " Example: Lucas goes to @school@ every day of the week. He has many subjects to @go@ to each school day: English, art, science, mathematics, gym, and history.\n" +
                "His @mother@ packs a big backpack full of @books@ and lunch for Lucas.";
        } else if (this.question.typeDeQuestion.ref === this.TYPE_QUESTION.PUT_IN_ORDER) {
            return "Example:\n" +
                "1 sentence number 1.\n" +
                "2 sentence number 2.\n" +
                "3 sentence number 3.\n" +
                "4 sentence number 4.\n" +
                "5 sentence number 5."
        } else {
            return ''
        }
    }

    addAnswer() {
        if (!this.editing) {
            if (!this.question?.reponses)
                this.question.reponses = new Array<ReponseDto>()
            this.answer.numero = this.question.reponses?.length + 1
            this.question.reponses.push({...this.answer})
        } else {
            this.editing = false
        }
        console.log(this.question)
        this.answer = new ReponseDto()
    }

    delete(i: number, answer: ReponseDto) {
        this.question.reponses.splice(i, 1)
        //update order of questions
        for (let j = 0; j < this.question.reponses.length; j++) {
            this.question.reponses[j].numero = j + 1
        }
        if (answer?.id && answer?.id !== 0) {
            this.reponseService.delete(answer).subscribe(res => console.log(res))
        }
    }

    deleteQst(i: number, qst: QuestionDto) {
        this.quiz.questions.splice(i, 1)
        //update order of questions
        for (let j = 0; j < this.quiz.questions.length; j++) {
            this.quiz.questions[j].numero = j + 1
        }
        if (qst?.id && qst?.id !== 0) {
            this.questionService.delete(qst).subscribe(res => console.log(res))
        }
    }

    edit(answer: ReponseDto) {
        this.sanitizeHtml(this.question.libelle);
        this.answer = answer
        this.editing = true
    }


    openAnswers(question: QuestionDto) {
        const dlg = this.dialog.open(EditAnswersComponent, {
            autoFocus: false,
            data: question.reponses,
            height: "auto",
            disableClose: true,
            width: "calc(100% - 30px)",
            maxWidth: "100%",
            maxHeight: "100%"
        });
        dlg.afterClosed().subscribe(result => {
            console.log(result)
            if (result && result?.length > 0) {
                question.reponses = result
            }
        })
    }

    chnangeQuestionIndex(i: number) {
        this.editField=i
        this.question = this.quiz.questions[i]

    }
}
