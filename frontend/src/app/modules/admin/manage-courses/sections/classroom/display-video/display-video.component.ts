import {Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {ExerciceDto} from "../../../../../../shared/model/course/Exercice.model";
import {SafePipe} from "../../../../../../shared/utils/safe.pipe";

@Component({
    selector: 'app-display-video',
    templateUrl: './display-video.component.html',
})
export class DisplayVideoComponent implements OnChanges, OnInit {
    @Input()
    exercise: ExerciceDto
    video: string

    constructor( private safePipe: SafePipe) {
    }

    ngOnInit() {
        this.extract()
    }

    ngOnChanges(changes: SimpleChanges) {
        if (changes.exercise && !changes.exercise.firstChange) {
            // Update the properties when the question changes
            this.extract()
        }
    }

    private extract() {
        console.log(this.exercise)
        let video = this.exercise?.content.replace('watch?v=', 'embed/');
        const index = video.indexOf('&t=');
        const startTime: number = Number(video.substring(index + '&t='.length, (video.length - 1)));
        if (index !== -1) {
            video = video.substring(0, index) + '?start=' + startTime;
        }
        this.video = video;
    }




}
