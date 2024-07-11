import {ChangeDetectorRef, Component, Input, OnInit} from '@angular/core';
import {QuestionDto} from "../../../../../../../shared/model/quiz/Question.model";

@Component({
    selector: 'app-drag-and-drop',
    templateUrl: './drag-and-drop.component.html',
    styleUrls: ['./drag-and-drop.component.scss']
})
export class DragAndDropComponent implements OnInit {
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

    constructor(private ref: ChangeDetectorRef,) {
    }

    ngOnInit() {
        if (this.question?.libelle) {
            this.extractDataForDragAndDrop(this.question.libelle)
        } else {
            this.showError = true
        }
    }


    private extractDataForDragAndDrop(qst: string) {
        let libelle = qst;
        let index = 1;
        let test = '@';
        while (test === '@') {
            const firstIndex = qst.indexOf('@');
            if (firstIndex !== -1) {
                this.listOfText?.set(index, qst.slice(0, qst.indexOf('@')));
                qst = qst.slice(firstIndex + 1, qst.length);
                const word = qst.substring(0, qst.indexOf('@'));
                this.values.set(index, word);
                qst = qst.slice(word.length + 1, qst.length);
                libelle = libelle.replace(word, ' ');
                index++;
                test = '@';
            } else {
                this.listOfText.set(index, qst.slice(0, qst.length));
                test = 'finish';
            }
        }
        for (const value of this.values.values()) {
            if (this.listOfWords.indexOf(value) === -1) {
                this.listOfWords.push(value);
            }
        }
        this.listOfWords = this.listOfWords.sort((a, b) => b.localeCompare(a));
        this.ref.detectChanges();
    }


    drag(ev) {
        this.value = ev.target.value;
    }

    allowDrop(ev) {
        ev.preventDefault();
    }

    drop(ev) {
        const id = ev.target.id
    }


    check() {

    }


}
