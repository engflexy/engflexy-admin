import {Component, Input, OnInit} from '@angular/core';
import {fuseAnimations} from "../../../../../../../@fuse/animations";
import {TYPE_QUESTION} from "../../../../../../shared/utils/enums";
import {QuizCollaboratorService} from "../../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";
import {QuizDto} from "../../../../../../shared/model/quiz/Quiz.model";
import {ExerciceDto} from "../../../../../../shared/model/course/Exercice.model";

@Component({
    selector: 'app-collaborator-quiz',
    templateUrl: './quiz.component.html',
    animations: fuseAnimations
})
export class QuizComponent implements OnInit {
    typeQuestion = TYPE_QUESTION
    index: number = 0
    @Input()
    exercise: ExerciceDto
    @Input()
    selectedQuiz: QuizDto

    constructor(private quizService: QuizCollaboratorService) {
    }


    get quiz(): QuizDto {
        return this.quizService.item
    }

    set quiz(item: QuizDto) {
        this.quizService.item = item
    }

    ngOnInit() {
        console.log(this.selectedQuiz)
        console.log(this.exercise)
    }


}
