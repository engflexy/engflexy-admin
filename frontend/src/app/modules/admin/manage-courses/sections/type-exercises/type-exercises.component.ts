import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialog, MatDialogRef} from "@angular/material/dialog";
import {SectionDto} from "../../../../../shared/model/course/Section.model";
import {ContentType, TYPE_QUESTION} from "../../../../../shared/utils/enums";
import {CreateExerciseComponent} from "../create-exercise/create-exercise.component";

@Component({
    selector: 'app-type-exercises',
    templateUrl: './type-exercises.component.html'
})
export class TypeExercisesComponent implements OnInit {
    TYPE = TYPE_QUESTION
    CONTENT_TYPE = ContentType

    constructor(@Inject(MAT_DIALOG_DATA) private _data: SectionDto,
                private refDialog: MatDialogRef<TypeExercisesComponent>,
                private dialog: MatDialog
    ) {
    }

    ngOnInit() {
        console.log(this._data)
    }

    choseType(type: string, quizType?: string) {
        this.refDialog.close()
        this.dialog.open(CreateExerciseComponent, {
            autoFocus: false,
            data: {type: type, quizType: quizType}
        });
    }
}
