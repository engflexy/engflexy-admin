import {Component, Inject} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {SectionDto} from "../../../../../../shared/model/course/Section.model";
import {TYPE_QUESTION} from "../../../../../../shared/utils/enums";

@Component({
    selector: 'app-types-question',
    templateUrl: './types-question.component.html'
})
export class TypesQuestionComponent {
    TYPE = TYPE_QUESTION

    constructor(@Inject(MAT_DIALOG_DATA) private _data: SectionDto,
                private refDialog: MatDialogRef<TypesQuestionComponent>
    ) {
    }

    choseType(type: string) {
        this.refDialog.close(type)
    }
}
