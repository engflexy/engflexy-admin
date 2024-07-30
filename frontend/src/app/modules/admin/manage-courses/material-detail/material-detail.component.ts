import {Component, OnInit} from '@angular/core';
import {ActivatedRoute, Router, RouterLink} from "@angular/router";
import {ParcoursDto} from "../../../../shared/model/course/Parcours.model";
import {ParcoursCollaboratorService} from "../../../../shared/service/collaborator/course/ParcoursCollaborator.service";
import {FuseCardComponent} from "../../../../../@fuse/components/card";
import {MatButtonModule} from "@angular/material/button";
import {MatIconModule} from "@angular/material/icon";
import {MatMenuModule} from "@angular/material/menu";
import {NgForOf, NgIf, NgOptimizedImage} from "@angular/common";
import {CoursCollaboratorService} from "../../../../shared/service/collaborator/course/CoursCollaborator.service";
import {CoursDto} from "../../../../shared/model/course/Cours.model";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {CreateCourseComponent} from "./create-course/create-course.component";
import {MatDialog} from "@angular/material/dialog";
import {EditMaterialComponent} from "../edit-material/edit-material.component";
import {FuseConfirmationService} from "../../../../../@fuse/services/confirmation";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {EditCourseComponent} from "./edit-course/edit-course.component";

@Component({
    selector: 'app-material-detail',
    templateUrl: './material-detail.component.html',
    imports: [
        FuseCardComponent,
        MatButtonModule,
        MatIconModule,
        MatMenuModule,
        NgIf,
        NgOptimizedImage,
        RouterLink,
        NgForOf,
        MatFormFieldModule,
        MatInputModule
    ],
    standalone: true
})
export class MaterialDetailComponent implements OnInit {

    constructor(private router: Router,
                private parcourService: ParcoursCollaboratorService,
                private courseService: CoursCollaboratorService,
                private _matDialog: MatDialog,
                private _fuseConfirmation: FuseConfirmationService,
                private alert: FuseAlertService,
                private route: ActivatedRoute) {
    }

    get courses(): CoursDto[] {
        return this.courseService.items
    }

    set courses(item: CoursDto[]) {
        this.courseService.items = item
    }

    get course(): CoursDto {
        return this.courseService.item
    }

    set course(item: CoursDto) {
        this.courseService.item = item
    }

    get item(): ParcoursDto {
        return this.parcourService.item
    }

    set item(item: ParcoursDto) {
        this.parcourService.item = item
    }

    ngOnInit() {
        const level = this.route.snapshot.params.level
        if (level) {
            const parcoursDto: ParcoursDto = new ParcoursDto()
            parcoursDto.id = Number(level)
            this.parcourService.findByIdWithAssociatedList(parcoursDto)
                .subscribe(res => {
                    this.item = res
                    this.courses = this.item?.courss
                })
        }
    }

    createCourse() {
        this.course = new CoursDto()
        this.course.parcours = this.item
        this._matDialog.open(CreateCourseComponent, {
            autoFocus: false,
        });
    }

    editCourse(item: CoursDto) {
        this.course = item
        this._matDialog.open(EditCourseComponent, {
            autoFocus: false,
        });

    }

    deleteCourse() {
        this.courseService.delete(this.course).subscribe(res => {
            this.alert.show('success', 'course deleted successfully.')
            this.courses = this.courses.filter(c => c.id !== this.course.id)
        }, error => {
            this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
        })

    }

    edit(item: ParcoursDto) {
        this.item = item
        this._matDialog.open(EditMaterialComponent, {
            autoFocus: false,
        });
    }

    navigateToSections(item: CoursDto) {
        this.router.navigate([`courses/${item?.id}/lesson`], {relativeTo: this.route});
    }

    delete(item: ParcoursDto) {
            const confirmation = this._fuseConfirmation.open({
                title: 'delete salary',
                message: 'Are you sure you want to remove this material?',
                actions: {
                    confirm: {
                        label: 'REMOVE',
                    },
                },
            });
            // Subscribe to the confirmation dialog closed action
            confirmation.afterClosed().subscribe((result) => {
                // If the confirmation button pressed...
                if (result === 'confirmed') {
                    this.parcourService.delete(item).subscribe(res => {
                        this.alert.show('success', 'course deleted successfully.')
                        this.router.navigate(['/admin/manage-courses'])
                    }, error => {
                        this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
                    })
                }
            });
        }



}
