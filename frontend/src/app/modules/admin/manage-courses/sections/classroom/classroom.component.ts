import {Component, OnInit} from '@angular/core';
import {
    SectionCollaboratorService
} from "../../../../../shared/service/collaborator/course/SectionCollaborator.service";
import {ActivatedRoute, Router} from "@angular/router";
import {
    ParcoursCollaboratorService
} from "../../../../../shared/service/collaborator/course/ParcoursCollaborator.service";
import {CoursCollaboratorService} from "../../../../../shared/service/collaborator/course/CoursCollaborator.service";
import {MatDialog} from "@angular/material/dialog";

@Component({
    selector: 'app-classroom',
    templateUrl: './classroom.component.html',
})
export class ClassroomComponent implements OnInit {
    private courseId: number

    constructor(private sectionService: SectionCollaboratorService,
                private router: Router,
                private parcourService: ParcoursCollaboratorService,
                private courseService: CoursCollaboratorService,
                private _matDialog: MatDialog,
                private route: ActivatedRoute
    ) {
    }

    ngOnInit() {
        this.courseId = this.route.snapshot.params.course
        if (this.courseId) {
            this.sectionService.findAllByCourseId(this.courseId)
                .subscribe(res => {
                    console.log(res)
                })
        } else {
            this.router.navigate(['/admin/manage-courses']);
        }
    }
}
