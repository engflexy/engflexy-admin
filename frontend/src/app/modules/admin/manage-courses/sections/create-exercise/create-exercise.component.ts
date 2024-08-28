import {Component, Inject, OnInit, SecurityContext} from '@angular/core';
import {ContentType} from "../../../../../shared/utils/enums";
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {ExerciceDto} from "../../../../../shared/model/course/Exercice.model";
import {ImagesService} from "../../../../../shared/service/public/images.service";
import {generateRandomString} from "../../../../../shared/constant/global-funsctions";
import {FuseAlertService} from "../../../../../../@fuse/components/alert";
import {ContentTypeDto} from "../../../../../shared/model/courseref/ContentType.model";
import {SectionDto} from "../../../../../shared/model/course/Section.model";
import {
    SectionCollaboratorService
} from "../../../../../shared/service/collaborator/course/SectionCollaborator.service";
import {
    ExerciceCollaboratorService
} from "../../../../../shared/service/collaborator/course/ExerciceCollaborator.service";
import {AngularEditorConfig} from "@kolkov/angular-editor";
import {QuizDto} from "../../../../../shared/model/quiz/Quiz.model";
import {QuizCollaboratorService} from "../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";
@Component({
    selector: 'app-create-exercise',
    templateUrl: './create-exercise.component.html',
})
export class CreateExerciseComponent implements OnInit {
    protected readonly ContentType = ContentType
    selectedFile: File | null = null;
    imagesList: Array<{ url, desc }> = new Array<{ url; desc }>()
    editorConfig: AngularEditorConfig = {
        editable: true,
        spellcheck: true,
        height: 'auto',
        minHeight: '100px',
        maxHeight: 'auto',
        width: 'auto',
        minWidth: '0',
        translate: 'yes',
        enableToolbar: true,
        showToolbar: true,
        placeholder: 'Enter text here...',
        defaultParagraphSeparator: '',
        defaultFontName: '',
        defaultFontSize: '',
        fonts: [
            {class: 'arial', name: 'Arial'},
            {class: 'times-new-roman', name: 'Times New Roman'},
            {class: 'calibri', name: 'Calibri'},
            {class: 'comic-sans-ms', name: 'Comic Sans MS'}
        ],
        customClasses: [
            {
                name: 'quote',
                class: 'quote',
            },
            {
                name: 'redText',
                class: 'redText'
            },
            {
                name: 'titleText',
                class: 'titleText',
                tag: 'h1',
            },
        ],
        uploadWithCredentials: false,
        sanitize: true,
        toolbarPosition: 'top'
    };

    constructor(@Inject(MAT_DIALOG_DATA) public _data: { type: string, quizType: string },
                private imageService: ImagesService,
                private alert: FuseAlertService,
                private quizService: QuizCollaboratorService,
                private sectionService: SectionCollaboratorService,
                private exerciseService: ExerciceCollaboratorService,
                private refDialog: MatDialogRef<CreateExerciseComponent>,
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


    get selectedSection(): SectionDto {
        return this.sectionService.item
    }

    set selectedSection(item: SectionDto) {
        this.sectionService.item = item
    }




    ngOnInit() {
        console.log(this.exercise)
        if (this.exercise?.id) {
            if (this.exercise.contentType.code === ContentType.IMAGE) {
                this.extract()
            }
        }
    }

    private extract() {
        const images = this.exercise.content.split(';')
        const titles = this.exercise.description.split(';')
        for (let i = 0; i < images.length; i++) {
            const imageObject = {url: null, desc: null}
            if (images[i] !== null && images[i]?.length > 5) {
                imageObject.url = images[i]
            }

            if (titles[i] !== null && titles[i]?.length > 5)
                imageObject.desc = titles[i]
            if (imageObject?.url)
                this.imagesList.push({...imageObject})
        }
        this.exercise.content = ''
        this.exercise.description = ''
    }

    save() {
        this.exercise.contentType = new ContentTypeDto(this._data?.type)
        this.exercise.section = new SectionDto(this.selectedSection.id)
        if (!this.exercise.id) {
            if (this.selectedSection?.exercices?.length)
                this.exercise.numero = this.selectedSection?.exercices?.length + 1
            else
                this.exercise.numero = 1
        }

        if (this.exercise.contentType.code === this.ContentType.QUIZ)
            this.exercise.quiz = this.quiz

        //custom edit for the image type
        if (this._data?.type === this.ContentType?.IMAGE) {
            this.imagesList.forEach(s => {
                this.exercise.content = this.exercise.content + ';' + s.url
                this.exercise.description = this.exercise.description + ';' + s.desc
            })
        }

        console.log(this.exercise)
        this.exerciseService.save().subscribe(res => {
            if (this.exercise?.id === null || this.exercise?.id === undefined) {
                if (this.selectedSection?.exercices?.length >= 0)
                    this.selectedSection.exercices.push({...res})
                else {
                    this.selectedSection.exercices = new Array<ExerciceDto>()
                    this.selectedSection.exercices.push({...res})
                }
            }
            console.log(this.selectedSection)
            this.refDialog.close()
        })
    }

    onFileSelected(event: any): void {
        var file = event.target.files[0];
        if (!this.isImageFile(file)) {
            this.alert.show('warning', 'Only ".gif", ".jpeg", ".png" extensions are allowed. Please upload an image file')
            this.selectedFile = null
        } else {
            this.selectedFile = file;
            const formData: FormData = new FormData();
            formData.append('img', this.selectedFile);
            const name = generateRandomString(10)
            this.imageService.generate_img_url(name, formData)
                .subscribe(res => {
                    const ulr = {url: res, desc: null}
                    this.imagesList.push(ulr)
                }, error => {
                    if (error?.status === 200) {
                        const ulr = {url: error?.error?.text, desc: null}
                        this.imagesList.push(ulr)
                    } else {
                        this.alert.show('warning', error?.error || 'something went wrong please try again.')
                    }
                })
        }
    }

    private isImageFile(file: File): boolean {
        return ["image/gif", "image/webp", "image/jpeg", "image/png"].includes(file.type);
    }

    removeImage(item: { url; desc }, i: number) {
        this.imagesList.splice(i, 1)
    }
}
