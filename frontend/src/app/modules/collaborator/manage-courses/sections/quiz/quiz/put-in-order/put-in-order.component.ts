import {ChangeDetectorRef, Component, Input, OnInit} from '@angular/core';
import {CdkDragDrop} from "@angular/cdk/drag-drop";
import {QuestionDto} from "../../../../../../../shared/model/quiz/Question.model";

@Component({
    selector: 'app-collaborator-put-in-order',
    templateUrl: './put-in-order.component.html',
})
export class PutInOrderComponent implements OnInit {
    @Input()
    question: QuestionDto = new QuestionDto()
    showError: boolean = false
    dragAndDropAnswer: Map<string, string> = new Map<string, string>()
    values: Map<number, string> = new Map<number, string>()
    listOfWords: Array<string> = new Array<string>()
    listOfText: Map<number, string> = new Map<number, string>()
    value: string
    index: number = 0
    checked: boolean = false

    constructor(private ref: ChangeDetectorRef) {
    }


    ngOnInit() {
        this.checked = false
        if (this.question?.libelle) {
            this.extractData(this.question.libelle)
        } else {
            this.showError = true
        }
    }

    private extractData(data: string) {
        this.dragAndDropAnswer = new Map<string, string>();
        this.listOfWords = new Array<string>();
        let counter = 2;
        while (counter !== -1) {
            const myNumber = data[0];
            let sentence: string;
            const index = data.indexOf(String(counter));
            if (index !== -1) {
                sentence = data.substring(1, index);
                counter++;
            } else {
                sentence = data.substring(1, data.length);
                counter = -1;
            }
            data = data.substring(sentence.length + 1, data.length);

            this.dragAndDropAnswer.set(sentence, myNumber);
            this.listOfWords.push(sentence);
        }
        this.listOfWords = this.listOfWords.sort((a, b) => b.localeCompare(a));
        this.ref.detectChanges();
    }

    drop(event: CdkDragDrop<string[]>) {

    }


    check() {

    }
}
