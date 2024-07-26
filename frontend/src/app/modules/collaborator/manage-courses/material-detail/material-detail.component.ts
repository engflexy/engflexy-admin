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

@Component({
    selector: 'app-collaborator-material-detail',
    templateUrl: './material-detail.component.html'
})
export class MaterialDetailComponent implements OnInit {

    constructor(private router: Router,
                private parcourService: ParcoursCollaboratorService,
                private courseService: CoursCollaboratorService,
                private _matDialog: MatDialog,
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

    navigateToSections(item: CoursDto) {
        this.router.navigate([`courses/${item?.id}/lesson`], {relativeTo: this.route});
    }
}
