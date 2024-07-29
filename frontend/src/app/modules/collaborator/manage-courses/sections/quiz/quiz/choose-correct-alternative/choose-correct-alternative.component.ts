import {ChangeDetectorRef, Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {ReponseDto} from "../../../../../../../shared/model/quiz/Reponse.model";
import {QuestionDto} from "../../../../../../../shared/model/quiz/Question.model";
import {sound} from "../../../../../../../shared/utils/sound-method";
import {QuizCollaboratorService} from "../../../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";
import {QuizDto} from "../../../../../../../shared/model/quiz/Quiz.model";


@Component({
    selector: 'app-collaborator-choose-correct-alternative',
    templateUrl: './choose-correct-alternative.component.html'
})
export class ChooseCorrectAlternativeComponent implements OnChanges, OnInit {
    correctAnswer: ReponseDto
    showError: boolean = false
    left: string;
    right: string;
    value: string
    is_correct: Boolean = null
    checked: boolean = false
    @Input()
    question: QuestionDto


    constructor(private ref: ChangeDetectorRef,
                private quizService: QuizCollaboratorService) {
    }

    get selectedQuiz(): QuizDto {
        return this.quizService.item
    }

    ngOnInit() {
        this.extractSentence()
    }

    ngOnChanges(changes: SimpleChanges): void {
        if (changes.question && !changes.question.firstChange) {
            // Update the properties when the question changes
            // this.extractSentence()
        }
    }

    extractSentence() {
        this.is_correct = null
        this.checked = false
        //save the correct answer
        this.correctAnswer = this.question?.reponses?.find(s => s.etatReponse)
        const indexOf = this.question?.libelle?.indexOf('...');
        const lastIndexOf = this.question?.libelle?.lastIndexOf('...');
        this.left = this.question?.libelle?.slice(0, indexOf)
        this.right = this.question?.libelle?.slice(lastIndexOf + 3)
        this.ref.detectChanges();
    }


    student_dont_know() {
        this.value = this.correctAnswer.lib
        const value = this.correctAnswer?.lib?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        const correct = this.correctAnswer?.lib?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        // check if answer is correct
        this.is_correct = value === correct;
        this.checked = true
    }

    check() {
        const timer = setInterval(() => {
            const value = this.value?.toString()?.toLowerCase()?.replace(/\s+/g, '');
            const correct = this.correctAnswer?.lib?.toString()?.toLowerCase()?.replace(/\s+/g, '');
            // check if answer is correct
            this.is_correct = value === correct;
            this.checked = true
            clearInterval(timer);
        }, 500);

    }

    public sound() {
        const text = this.left + ' ' + this.correctAnswer?.lib + ' ' + this.right
        sound(text)
    }

    showMe: boolean = false;

    /**
     * show answer to teacher only
     */
    showMeAnswer(value: boolean) {
        this.showMe = value
    }

}
