import {ChangeDetectorRef, Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {ReponseDto} from "../../../../../../../shared/model/quiz/Reponse.model";
import {QuestionDto} from "../../../../../../../shared/model/quiz/Question.model";
import {sound} from "../../../../../../../shared/utils/sound-method";
import {QuizDto} from "../../../../../../../shared/model/quiz/Quiz.model";
import {QuizCollaboratorService} from "../../../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";

@Component({
    selector: 'app-true-or-false',
    templateUrl: './true-or-false.component.html'
})
export class TrueOrFalseComponent implements OnInit, OnChanges {
    @Input()
    question: QuestionDto
    correctAnswer: ReponseDto;
    value: boolean
    is_correct: Boolean = null
    checked: Boolean = null
    index: number = 0

    constructor(private ref: ChangeDetectorRef,
                private quizService: QuizCollaboratorService) {
    }

    get selectedQuiz(): QuizDto {
        return this.quizService.item
    }

    ngOnChanges(changes: SimpleChanges): void {
        if (changes.question && !changes.question.firstChange) {
            // Update the properties when the question changes
        }
    }


    private extracte() {
        this.correctAnswer = this.question?.reponses?.find(s => s.etatReponse)
        console.log(this.correctAnswer)
        this.value = false
        this.is_correct = null
        this.checked = false
        this.ref.detectChanges();
    }

    ngOnInit() {
        this.index = 0
        this.extracte();
    }


    check(event) {
        this.value = event
        const value = event?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        const correct = this.correctAnswer?.lib?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        // check if answer is correct
        this.is_correct = value === correct;
        this.checked = true
        this.ref.detectChanges();
    }

    protected readonly sound = sound;
}
