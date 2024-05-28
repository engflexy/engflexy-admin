import {ChangeDetectorRef, Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {QuestionDto} from "../../../../../../../shared/model/quiz/Question.model";
import {ReponseDto} from "../../../../../../../shared/model/quiz/Reponse.model";
import {sound} from "../../../../../../../shared/utils/sound-method";
import {QuizCollaboratorService} from "../../../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";
import {QuizDto} from "../../../../../../../shared/model/quiz/Quiz.model";

@Component({
    selector: 'app-write-correct-form',
    templateUrl: './write-correct-form.component.html',
})
export class WriteCorrectFormComponent implements OnChanges, OnInit {
    correctAnswer: ReponseDto;
    left: string
    right: string
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
        this.get_question()
    }


    ngOnChanges(changes: SimpleChanges): void {

    }

    private get_question() {
        this.is_correct = null
        this.checked = false
        //save the correct answer
        this.correctAnswer = this.question?.reponses?.find(s => s.etatReponse)
        const items = this.question?.libelle?.split('@');
        if (items?.length === 3) {
            this.left = items[0];
            this.value = items[1];
            this.right = items[2];
        } else {
            this.showError = true;
        }
        this.ref.detectChanges();
    }

    check() {
        const value = this.value?.toString()?.toLowerCase()?.replace(/\s+/g, '');
        const correct = this.correctAnswer?.lib?.toString()?.toLowerCase()?.replace(/\s+/g, '');
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
