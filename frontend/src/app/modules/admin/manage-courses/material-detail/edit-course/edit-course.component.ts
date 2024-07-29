import { Component } from '@angular/core';
import {FormsModule} from "@angular/forms";
import {FuseCardComponent} from "../../../../../../@fuse/components/card";
import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatDividerModule} from "@angular/material/divider";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {MatProgressBarModule} from "@angular/material/progress-bar";
import {NgIf} from "@angular/common";
import {CoursCollaboratorService} from "../../../../../shared/service/collaborator/course/CoursCollaborator.service";
import {FuseAlertService} from "../../../../../../@fuse/components/alert";
import {ImagesService} from "../../../../../shared/service/public/images.service";
import {ActivatedRoute, Router} from "@angular/router";
import {CoursDto} from "../../../../../shared/model/course/Cours.model";
import {generateRandomString} from "../../../../../shared/constant/global-funsctions";

@Component({
  selector: 'app-edit-course',
  templateUrl: './edit-course.component.html',
    imports: [
        FormsModule,
        FuseCardComponent,
        MatButtonModule,
        MatDialogModule,
        MatDividerModule,
        MatFormFieldModule,
        MatInputModule,
        MatProgressBarModule,
        NgIf
    ],
    standalone: true
})
export class EditCourseComponent {
    selectedFile: File | null = null;
    showLoader: boolean = false

    constructor(private courseService: CoursCollaboratorService,
                private alert: FuseAlertService,
                private imageService: ImagesService,
                private route: ActivatedRoute,
                private router: Router,
                private _matDialogRef: MatDialogRef<EditCourseComponent>,) {
    }

    get courses(): CoursDto[] {
        return this.courseService.items
    }

    set courses(item: CoursDto[]) {
        this.courseService.items = item
    }

    get item(): CoursDto {
        return this.courseService.item
    }

    set item(item: CoursDto) {
        this.courseService.item = item
    }

    onFileSelected(event: any): void {
        var file = event.target.files[0];
        if (!this.isImageFile(file)) {
            this.alert.show('warning', 'Only ".gif", ".jpeg", ".png" extensions are allowed. Please upload an image file')
            this.selectedFile = null
        } else {
            this.showLoader = true
            this.selectedFile = file;
            const formData: FormData = new FormData();
            formData.append('img', this.selectedFile);
            const name = generateRandomString(10)
            this.imageService.generate_img_url(name, formData)
                .subscribe(res => {
                    this.showLoader = false
                    this.item.image = res
                }, error => {
                    if (error?.status === 200) {
                        this.alert.show('success', 'image uploaded successfully.')
                        this.item.image = error?.error?.text
                    } else {
                        this.alert.show('warning', error?.error || 'something went wrong please try again.')
                    }
                    this.showLoader = false
                })
        }
    }

    private isImageFile(file: File): boolean {
        return ["image/gif", "image/webp", "image/jpeg", "image/png"].includes(file.type);
    }

    edit(item: CoursDto) {
        this.courseService.item = item
        this.courseService.edit()
            .subscribe(res => {
                console.log(res)
                this._matDialogRef.close()
                this.router.navigate([`admin/manage-courses/materials/${this.item?.parcours?.id}/courses/${res?.id}`]);
            }, error => {
                console.error(error)
                this.alert.show('warning', error?.error || 'something went wrong, please try again.')
            })
    }
}
