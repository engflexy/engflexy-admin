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
import {UserCriteria} from "../../../../zynerator/security/shared/criteria/UserCriteria.model";

@Component({
    selector: 'app-students',
    templateUrl: './students.component.html'
})
export class StudentsComponent implements OnInit {

    criteria: PageRequest<ManageUserDto>
    pageable: Pageable = new Pageable(0, 5)
    etudiant: EtudiantDto
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

    findUserByUsername(email: string): void {
        this.etudiantService.findByUserName(email) .subscribe(res => {
                this.etudiant = res
                if(res){
                    this.etudiant = res;
                    console.log('Etudiant found:', this.etudiant);
                    //console.log(res)
                    /*this.pageable = {
                    content: [this.etudiant],
                    totalElements: 1,
                    totalPages: 1,
                    size: 1,
                    number: 0,
                    last: true,
                    first: true,
                    numberOfElements: 1,
                    empty: false
                };*/
                }else {
                    console.log('No etudiant found with this email');}},
            error => {

                console.error('Error finding etudiant:', error);
            });
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
        this.router.navigate([`student/${item.email}`], {relativeTo: this.route})
    }
    deleteStudent(id: number): void {
        this.etudiantService.deleteById(id).subscribe({
            next: (response) => {
                console.log(`Deleted student with id: ${id}`);
                // Code to update the UI, e.g., remove the deleted item from the list
            },
            error: (error) => {
                console.error('Error deleting student:', error);
            }
        });
    }
    openFilter() {

    }

}
