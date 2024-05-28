import {Component, Inject} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {ReponseDto} from "../../../../../../../shared/model/quiz/Reponse.model";

@Component({
    selector: 'app-edit-answers',
    templateUrl: './edit-answers.component.html'
})
export class EditAnswersComponent {

    editField: number = -1

    constructor(@Inject(MAT_DIALOG_DATA) public answers: Array<ReponseDto>,
                private refDialog: MatDialogRef<EditAnswersComponent>,) {
        console.log(answers)
    }

    delete(i: number) {
        this.answers.splice(i, 1)
    }

    createAnswer() {
        let answer = new ReponseDto()
        if (this.answers?.length > 0)
            answer.numero = this.answers?.length + 1
        else {
            answer.numero = 1
            this.answers = new Array<ReponseDto>()
        }
        this.answers.push({...answer})
    }
}
