import {ChangeDetectorRef, Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {QuestionDto} from "../../../../../../../shared/model/quiz/Question.model";
import {sound} from "../../../../../../../shared/utils/sound-method";
import {QuizCollaboratorService} from "../../../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";
import {QuizDto} from "../../../../../../../shared/model/quiz/Quiz.model";
import {ReponseDto} from "../../../../../../../shared/model/quiz/Reponse.model";

@Component({
    selector: 'app-correct-the-mistake',
    templateUrl: './correct-the-mistake.component.html'
})
export class CorrectTheMistakeComponent implements OnChanges, OnInit {
    correctAnswer: string
    middle: string
    right: string
    left: string
    correctAnswers: ReponseDto[]
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
        this.correctAnswers = this.question?.reponses
        const items = this.question?.libelle?.split('@')
        if (items?.length === 3) {
            this.left = items[0];
            this.middle = items[1]; //middle of sentence is the mistake that student should correct
            this.right = items[2];

            //this.value = middle  //create sentence from question parts
            this.value = this.left + this.middle + this.right
            for (let i = 0; i < this.correctAnswers?.length; i++) {
                this.correctAnswers[i].value = this.left + this.question?.reponses?.[i]?.lib + this.right
            }
            this.correctAnswer = this.correctAnswers[0].value

        } else {
            this.showError = true;
        }
        // Use a regular expression to replace multiple spaces with a single space
        this.value = this.value?.replace(/\s+/g, ' ')
        this.correctAnswer = this.correctAnswer?.replace(/\s+/g, ' ')
        this.ref.detectChanges();
    }

    check() {
        const value = this.value?.toString()?.toLowerCase()?.replace(/\s+/g, '');

        const correct = this.correctAnswer?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        // check if answer is correct
        console.log("haaa correct ansewrs", this.correctAnswers);
        console.log("haaa value", this.value);
        for (let i = 0; i < this.correctAnswers.length; i++) {
            console.log("ana f haddd lib ", this.correctAnswers[i]?.value);
            if (this.correctAnswers[i]?.value?.toString()?.toLowerCase()?.replace(/\s+/g, '') === value) {
                this.is_correct = true;
                console.log("kokoooooooooooo trueeee")
                break;
            } else {
                this.is_correct = false;
            }
        }
        this.checked = true
    }


    student_dont_know() {
        this.value = this.correctAnswer
        const value = this.correctAnswer?.toString()?.toLowerCase()?.replace(/\s+/g, '');
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
