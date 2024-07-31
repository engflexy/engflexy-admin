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
import {ManageUserDto} from "../../../../core/criteria/manage-user-dto";
import {ActivatedRoute, Router} from "@angular/router";
import {MatSnackBar} from "@angular/material/snack-bar";

@Component({
    selector: 'app-collaborator-students',
    templateUrl: './students.component.html'
})
export class StudentsComponent implements OnInit {

    criteria: PageRequest<ManageUserDto>
    pageable: Pageable = new Pageable(0, 5)

    constructor(private etudiantService: EtudiantCollaboratorService,
                private _matDialog: MatDialog,
                private router: Router,
                private route: ActivatedRoute,
                private auth: AuthService,
                private _snackBar: MatSnackBar) {
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

    navigateToDetail(item: ManageUserDto) {
        this.router.navigate([`student/${item.id}`], {relativeTo: this.route})
    }
    deleteStudent(student: EtudiantDto) {
        this.etudiantService.delete(student).subscribe(() => {
            this.criteria.content = this.criteria.content.filter(s => s.id !== student.id);
            this._snackBar.open('Student deleted successfully', 'Close', {
                duration: 2000,
            });
        });
    }
}
