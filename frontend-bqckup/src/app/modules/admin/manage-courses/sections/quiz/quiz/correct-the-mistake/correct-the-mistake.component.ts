import {ChangeDetectorRef, Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {QuestionDto} from "../../../../../../../shared/model/quiz/Question.model";
import {sound} from "../../../../../../../shared/utils/sound-method";
import {QuizCollaboratorService} from "../../../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";
import {QuizDto} from "../../../../../../../shared/model/quiz/Quiz.model";

@Component({
    selector: 'app-correct-the-mistake',
    templateUrl: './correct-the-mistake.component.html'
})
export class CorrectTheMistakeComponent implements OnChanges, OnInit {
    correctAnswer: string
    showError: boolean = false
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
        const items = this.question?.libelle?.split('@')
        if (items?.length === 3) {
            const left = items[0];
            const middle = items[1]; //middle of sentence is the mistake that student should correct
            const right = items[2];
            this.value = left + ' ' + middle + ' ' + right //create sentence from question parts
            //get the correct answer from question answer, index 0 because this type has only one answer
            const correctValue = this.question?.reponses?.at(0)?.lib;

            this.correctAnswer = left + ' ' + correctValue + ' ' + right

        } else {
            this.showError = true;
        }
        // Use a regular expression to replace multiple spaces with a single space
        this.value = this.value?.replace(/\s+/g, ' ')
        this.correctAnswer = this.correctAnswer?.replace(/\s+/g, ' ')
        this.ref.detectChanges();
    }


    student_dont_know() {
        this.value = this.correctAnswer
        const value = this.correctAnswer?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        const correct = this.correctAnswer?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        // check if answer is correct
        this.is_correct = value === correct;
        this.checked = true
    }

    check() {
        const value = this.value?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        const correct = this.correctAnswer?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        // check if answer is correct
        this.is_correct = value === correct;
        this.checked = true
    }


    protected readonly sound = sound;

    showMe: boolean = false;

    /**
     * show answer to teacher only
     */
    showMeAnswer(value: boolean) {
        this.showMe = value
    }
}
