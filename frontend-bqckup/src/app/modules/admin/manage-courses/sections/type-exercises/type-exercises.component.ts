import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialog, MatDialogRef} from "@angular/material/dialog";
import {SectionDto} from "../../../../../shared/model/course/Section.model";
import {ContentType, TYPE_QUESTION} from "../../../../../shared/utils/enums";
import {CreateExerciseComponent} from "../create-exercise/create-exercise.component";
import {ExerciceDto} from "../../../../../shared/model/course/Exercice.model";
import {
    ExerciceCollaboratorService
} from "../../../../../shared/service/collaborator/course/ExerciceCollaborator.service";
import {QuizDto} from "../../../../../shared/model/quiz/Quiz.model";
import {QuizCollaboratorService} from "../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";

@Component({
    selector: 'app-type-exercises',
    templateUrl: './type-exercises.component.html'
})
export class TypeExercisesComponent implements OnInit {
    TYPE = TYPE_QUESTION
    CONTENT_TYPE = ContentType

    constructor(@Inject(MAT_DIALOG_DATA) private _data: SectionDto,
                private refDialog: MatDialogRef<TypeExercisesComponent>,
                private exerciseService: ExerciceCollaboratorService,
                private quizService: QuizCollaboratorService,
                private dialog: MatDialog
    ) {
    }

    get quiz(): QuizDto {
        return this.quizService.item
    }

    set quiz(item: QuizDto) {
        this.quizService.item = item
    }

    get exercise(): ExerciceDto {
        return this.exerciseService.item
    }

    set exercise(item: ExerciceDto) {
        this.exerciseService.item = item
    }

    ngOnInit() {
        console.log(this._data)
    }

    choseType(type: string, quizType?: string) {
        this.refDialog.close()
        this.quiz = new QuizDto()
        this.exercise = new ExerciceDto()
        this.dialog.open(CreateExerciseComponent, {
            autoFocus: false,
            data: {type: type, quizType: quizType},
            height: "auto",
            width: "calc(100% - 30px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"

        });
    }
}
