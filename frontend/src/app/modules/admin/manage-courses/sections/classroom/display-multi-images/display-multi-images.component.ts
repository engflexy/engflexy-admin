import {Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {ExerciceDto} from "../../../../../../shared/model/course/Exercice.model";

class ImageObject {
    image: string
    thumbImage: string
    alt: string
    title: string
}

@Component({
    selector: 'app-display-multi-images',
    templateUrl: './display-multi-images.component.html',
})
export class DisplayMultiImagesComponent implements OnChanges, OnInit {
    @Input()
    exercise: ExerciceDto
    images: Array<ImageObject> = new Array<ImageObject>();

    constructor() {
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
        const images = this.exercise.content.split(';')
        const titles = this.exercise.description.split(';')
        for (let i = 0; i < images.length; i++) {
            const imageObject = new ImageObject()
            if (images[i] !== null && images[i]?.length > 5) {
                imageObject.image = images[i]
                imageObject.thumbImage = images[i]
            }

            if (titles[i] !== null && titles[i]?.length > 5)
                imageObject.title = titles[i]
            if (imageObject?.image)
                this.images.push({...imageObject})
        }
    }
}
