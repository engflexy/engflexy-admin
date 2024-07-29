import {Component, OnInit} from '@angular/core';
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";
import {PageEvent} from "@angular/material/paginator";
import {
    EtudiantCollaboratorService
} from "../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";
import {Pageable} from "../../../../shared/utils/Pageable";
import {MatDialog} from "@angular/material/dialog";
import {CreateStudentComponent} from "./create-student/create-student.component";
import {UserCriteria} from "../../../../core/criteria/user-criteria";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
    selector: 'app-students',
    templateUrl: './students.component.html'
})
export class StudentsComponent implements OnInit {

    criteria: PageRequest<UserCriteria>
    pageable: Pageable = new Pageable(0, 5)
    etudiant: UserCriteria
    constructor(private etudiantService: EtudiantCollaboratorService,
                private _matDialog: MatDialog,
                private router: Router,
                private route: ActivatedRoute,
                private auth: AuthService) {
    }

    public get student(): EtudiantDto {
        return this.etudiantService.item
    }

    public set student(item: EtudiantDto) {
        this.etudiantService.item = item
    }

    ngOnInit() {
        this.findByCollaboratorId();

    }

    private findByCollaboratorId() {
        this.etudiantService.findByCollaboratorId(this.auth.authenticatedUser?.id, this.pageable)
            .subscribe(res => {
                this.criteria = res
               // console.log(this.criteria)
            })
    }

    findUserByUsername(username: string): void {
        this.etudiantService.findByUserName(username) .subscribe(res => {
            this.etudiant = res
            console.log(this.etudiant.email)
            if(res){ this.criteria = {
                content: [this.etudiant],
                totalElements: 1,
                totalPages: 1,
                //pageable: this.pageable, // Ensure pageable is correctly initialized
                size: 1,
                number: 0, // Typically the page number starts from 0
                // sort: { /* Initialize sort properties if required */ },
                last: true,
                first: true,
                numberOfElements: 1,
                empty: false // Set to false since we have one element
            };}


            console.log(this.criteria)

        })
    }
    handle_pageable_change(event: PageEvent) {
        this.pageable = new Pageable(event?.pageIndex, event?.pageSize)
        this.findByCollaboratorId();
    }

    createNewStudent() {
        const dialog = this._matDialog.open(CreateStudentComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe(res => {
            if (res != null) this.criteria.content.unshift({...res})
        })
    }

    navigateToDetail(item: UserCriteria) {
        this.router.navigate([`student/${item.id}`], {relativeTo: this.route})
    }

    openFilter() {

    }
}
