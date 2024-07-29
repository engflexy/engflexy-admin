import { Component } from '@angular/core';
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatButtonModule} from "@angular/material/button";
import {MatInputModule} from "@angular/material/input";
import {MatIconModule} from "@angular/material/icon";
import {MatSelectModule} from "@angular/material/select";
import {MatRadioModule} from "@angular/material/radio";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatDividerModule} from "@angular/material/divider";
import {FuseCardComponent} from "../../../../../@fuse/components/card";
import {NgIf} from "@angular/common";
import {FormsModule} from "@angular/forms";
import {MatProgressBarModule} from "@angular/material/progress-bar";
import {ParcoursAdminService} from "../../../../shared/service/admin/course/ParcoursAdmin.service";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {ImagesService} from "../../../../shared/service/public/images.service";
import {ParcoursDto} from "../../../../shared/model/course/Parcours.model";
import {generateRandomString} from "../../../../shared/constant/global-funsctions";

@Component({
  selector: 'app-edit-material',
  templateUrl: './edit-material.component.html',
    imports: [
        MatDialogModule,
        MatButtonModule,
        MatInputModule,
        MatIconModule,
        MatSelectModule,
        MatRadioModule,
        MatCheckboxModule,
        MatDividerModule,
        FuseCardComponent,
        NgIf,
        FormsModule,
        MatProgressBarModule
    ],
    standalone: true
})
export class EditMaterialComponent {

    selectedFile: File | null = null;
    showLoader: boolean = false

    constructor(private parcourService: ParcoursAdminService,
                private alert: FuseAlertService,
                private _matDialogRef: MatDialogRef<EditMaterialComponent>,
                private imageService: ImagesService) {
    }


    get item(): ParcoursDto {
        return this.parcourService.item
    }

    set item(item: ParcoursDto) {
        this.parcourService.item = item
    }

    get levels(): ParcoursDto[] {
        return this.parcourService.items
    }

    set levels(items: ParcoursDto[]) {
        this.parcourService.items = items
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
                    this.item.url = res
                }, error => {
                    if (error?.status === 200) {
                        this.alert.show('success', 'image uploaded successfully.')
                        this.item.url = error?.error?.text
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

    edit() {
        console.log(this.item)
        this.parcourService.edit()
            .subscribe(res => {
                console.log(res)
                this._matDialogRef.close()
            }, error => {
                console.error(error)
                this.alert.show('warning', error?.error || 'something went wrong, please try again.')
            })
    }




}
