import {ChangeDetectorRef, Component, OnInit} from '@angular/core';
import {LangueDto} from "../../../../../../shared/model/inscriptionref/Langue.model";
import {FuseAlertService} from "../../../../../../../@fuse/components/alert";
import {ImagesService} from "../../../../../../shared/service/public/images.service";
import {ActivatedRoute} from "@angular/router";
import {compareObjects} from "../../../../../../shared/constant/global-funsctions";
import {countries} from 'app/core/countries/data';
import {ProfDto} from "../../../../../../shared/model/prof/Prof.model";
import {ProfCollaboratorService} from "../../../../../../shared/service/collaborator/prof/ProfCollaborator.service";

@Component({
    selector: 'app-collaborator-teacher-profile',
    templateUrl: './teacher-profile.component.html'
})
export class TeacherProfileComponent
    implements OnInit {
    protected readonly compareObjects = compareObjects;
    user: ProfDto = new ProfDto();
    selectedFile: File | null = null;
    countries = countries;
    public langues: LangueDto[];

    /**
     * Constructor
     */
    constructor(
        private alert: FuseAlertService,
        private ref: ChangeDetectorRef,
        private service: ProfCollaboratorService,
        private imageService: ImagesService,
        private route: ActivatedRoute,
    ) {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    ngOnInit(): void {
        const id = this.route.snapshot.params.id
        if (id) {
            this.service.findByIdWithAssociatedList(new ProfDto(id))
                .subscribe(res => {
                    this.user = res
                    this.ref.markForCheck()
                })
        }
        this.imageService.findOptimized('languages')
            .subscribe(response => {
                this.langues = response;
            })
    }

    onFileSelected(event: any): void {
        var file = event.target.files[0];
        if (!this.isImageFile(file)) {
            this.alert.show('warning', 'Only ".gif", ".jpeg", ".png", ".webp" extensions are allowed. Please upload an image file')
            this.selectedFile = null
        } else {
            this.selectedFile = file;
            this.update_profile()
        }
    }

    private isImageFile(file: File): boolean {
        return ["image/gif", "image/webp", "image/jpeg", "image/png"].includes(file.type);
    }

    update() {
        console.log(this.user)
        this.service.update(this.user)
            .subscribe(response => {
                this.user = response;
                this.alert.show('success', 'profile updated successfully.')

            }, error => {
                this.alert.show('warning', error?.error?.message || 'something went wrong please try again.')
            })
    }

    update_profile() {
        const formData: FormData = new FormData();
        formData.append('img', this.selectedFile);
        if (this.selectedFile) {
            this.imageService.generate_img_url(this.user.email, formData)
                .subscribe(response => {
                    this.alert.show('success', 'avatar updated successfully')
                    this.user.avatar = response
                    this.ref.detectChanges()
                }, error => {
                    if (error?.status === 200) {
                        const url: string = error?.error?.text
                        this.user.avatar = url
                        this.ref.detectChanges()
                    } else {
                        this.alert.show('warning', error?.error || 'something went wrong please try again.')
                    }
                })
        }
    }
}
