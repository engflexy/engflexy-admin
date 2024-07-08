import {Component, Input, OnInit} from '@angular/core';
import {MatDialog} from "@angular/material/dialog";
import {HomeWorkDto} from "../../../../../../../shared/model/homework/HomeWork.model";
import {HomeWorkQuestionDto} from "../../../../../../../shared/model/homework/HomeWorkQuestion.model";
import {sound} from "../../../../../../../shared/utils/sound-method";

@Component({
    selector: 'app-translate-phrase',
    templateUrl: './translate-phrase.component.html'
})
export class TranslatePhraseComponent implements OnInit {

    @Input()
    homework: HomeWorkDto = new HomeWorkDto()
    questions: Array<HomeWorkQuestionDto> = new Array<HomeWorkQuestionDto>();
    showError: boolean = false
    index: number = 0

    constructor(private dialog: MatDialog) {
    }


    ngOnInit() {
        this.index = 0

    }

    dict() {

    }

    protected readonly sound = sound;
}
