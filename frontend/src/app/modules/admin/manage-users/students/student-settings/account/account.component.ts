import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnInit, ViewEncapsulation } from '@angular/core';
import { UntypedFormBuilder } from '@angular/forms';
import { EtudiantDto } from "../../../../../../shared/model/inscription/Etudiant.model";
import { EtudiantCollaboratorService } from "../../../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import { ActivatedRoute } from "@angular/router";
import { compareObjects } from "../../../../../../shared/constant/global-funsctions";
import { TeacherLocalityDto } from "../../../../../../shared/model/inscriptionref/TeacherLocality.model";
import { ParcoursDto } from "../../../../../../shared/model/course/Parcours.model";
import { GroupeEtudeDto } from "../../../../../../shared/model/grpe/GroupeEtude.model";
import { PackStudentDto } from "../../../../../../shared/model/pack/PackStudent.model";
import { StatutSocialDto } from "../../../../../../shared/model/inscriptionref/StatutSocial.model";
import { InteretEtudiantDto } from "../../../../../../shared/model/inscriptionref/InteretEtudiant.model";
import { NiveauEtudeDto } from "../../../../../../shared/model/inscriptionref/NiveauEtude.model";
import { SkillDto } from "../../../../../../shared/model/inscriptionref/Skill.model";
import { FonctionDto } from "../../../../../../shared/model/inscriptionref/Fonction.model";
import { LangueDto } from "../../../../../../shared/model/inscriptionref/Langue.model";
import { countries } from "../../../../../../core/countries/data";
import { ImagesService } from "../../../../../../shared/service/public/images.service";
import { FuseAlertService } from "../../../../../../../@fuse/components/alert";
import {PageRequest} from "../../../../../../zynerator/criteria/BaseCriteria.model";
import {ManageUserDto} from "../../../../../../core/criteria/manage-user-dto";

@Component({
    selector: 'settings-account',
    templateUrl: './account.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class SettingsAccountComponent implements OnInit {
    protected readonly compareObjects = compareObjects;
    user: EtudiantDto = new EtudiantDto();
    public teacherLocality: TeacherLocalityDto[];
    public parcours: ParcoursDto[];
    public groupeEtude: GroupeEtudeDto[];
    public packStudent: PackStudentDto[];
    public statutSocial: StatutSocialDto[];
    public interetEtudiant: InteretEtudiantDto[];
    public niveauEtude: NiveauEtudeDto[];
    public skill: SkillDto[];
    public fonction: FonctionDto[];
    public langue: LangueDto[];
    selectedFile: File | null = null;
    countries = countries;

    /**
     * Constructor
     */
    constructor(
        private _formBuilder: UntypedFormBuilder,
        private alert: FuseAlertService,
        private ref: ChangeDetectorRef,
        private etudiantService: EtudiantCollaboratorService,
        private imageService: ImagesService,
        private route: ActivatedRoute,
    ) { }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    ngOnInit(): void {
        const email = this.route.snapshot.params.email;
        if (email) {
            this.etudiantService.findByUserName(email)
                .subscribe(res => {
                    this.user = res;
                    this.ref.markForCheck();
                });
        }

        this.loadData();


    }

    loadData(): void {
        this.imageService.findOptimized('skill').subscribe(response => {
            this.skill = response;
        });

        this.imageService.findOptimized('group-student').subscribe(response => {
            this.groupeEtude = response;
        });

        this.imageService.findOptimized('fonction').subscribe(response => {
            this.fonction = response;
        });

        this.imageService.findOptimized('interets').subscribe(response => {
            this.interetEtudiant = response;
        });

        this.imageService.findOptimized('languages').subscribe(response => {
            this.langue = response;
        });

        this.imageService.findOptimized('niveau').subscribe(response => {
            this.niveauEtude = response;
        });

        this.imageService.findOptimized('packs').subscribe(response => {
            this.packStudent = response;
        });

        this.imageService.findOptimized('levels').subscribe(response => {
            this.parcours = response;
        });

        this.imageService.findOptimized('status').subscribe(response => {

            this.statutSocial = response;

        });
        this.imageService.findOptimized('teacher-locality').subscribe(response => {

            this.teacherLocality = response;

        });
    }

    onFileSelected(event: any): void {
        const file = event.target.files[0];
        if (!this.isImageFile(file)) {
            this.alert.show('warning', 'Only ".gif", ".jpeg", ".png", ".webp" extensions are allowed. Please upload an image file');
            this.selectedFile = null;
        } else {
            this.selectedFile = file;
            this.update_profile();
        }
    }

    private isImageFile(file: File): boolean {
        return ["image/gif", "image/webp", "image/jpeg", "image/png"].includes(file.type);
    }

    update(): void {
        console.log('Sending data:', this.user); // For debugging

        this.etudiantService.update(this.user).subscribe(
            response => {
                console.log('Update successful:', response);
                this.user = response;
                this.alert.show('success', 'Profile updated successfully.');
            },
            error => {
                if (error?.status ==! 200) {
                console.error('Error updating profile:', error);
                this.alert.show('warning', error?.error?.message || 'Something went wrong. Please try again.');
            }}
        );
    }

    update_profile(): void {
        const formData: FormData = new FormData();
        if (this.selectedFile) {
            formData.append('img', this.selectedFile);
            this.imageService.generate_img_url(this.user.email, formData).subscribe(
                response => {
                    this.alert.show('success', 'Avatar updated successfully');
                    this.user.avatar = response;
                    this.ref.detectChanges();
                },
                error => {
                    if (error?.status === 200) {
                        const url: string = error?.error?.text;
                        this.user.avatar = url;
                        this.ref.detectChanges();
                    } else {
                        this.alert.show('warning', error?.error || 'Something went wrong. Please try again.');
                    }
                }
            );
        }
    }
}
