import {Component, OnInit} from '@angular/core';
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {PageEvent} from "@angular/material/paginator";
import {ProfCollaboratorService} from "../../../../shared/service/collaborator/prof/ProfCollaborator.service";
import {Pageable} from "../../../../shared/utils/Pageable";
import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";
import {ManageUserDto} from "../../../../core/criteria/manage-user-dto";
import {CreateTeacherComponent} from "./create-teacher/create-teacher.component";
import {MatDialog} from "@angular/material/dialog";
import {ActivatedRoute, Router} from "@angular/router";
import {UserCriteria} from "../../../../zynerator/security/shared/criteria/UserCriteria.model";

@Component({
    selector: 'app-teachers',
    templateUrl: './teachers.component.html'
})
export class TeachersComponent implements OnInit {
    items: PageRequest<ManageUserDto>
    criteria: UserCriteria = new UserCriteria()
    pageable: Pageable = new Pageable(0, 5)

    constructor(private profService: ProfCollaboratorService,
                private _matDialog: MatDialog,
                private router: Router,
                private route: ActivatedRoute,
                private auth: AuthService) {
    }

    ngOnInit() {
        this.findByCollaboratorId()
    }

    private findByCollaboratorId() {
        this.profService.findByCollaboratorId(this.auth.authenticatedUser?.id, this.pageable)
            .subscribe(res => {
                this.items = res
                console.log(this.items)
            })
    }

    handle_pageable_change(event: PageEvent) {
        this.pageable = new Pageable(event?.pageIndex, event?.pageSize)
        this.findByCollaboratorId();
    }

    createNew() {
        const dialog = this._matDialog.open(CreateTeacherComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe(res => {
            if (res != null) this.items.content.unshift({...res})
        })
    }

    navigateToDetail(item: ManageUserDto) {
        this.router.navigate([`teacher/${item.id}`], {relativeTo: this.route})
    }

    findPaginatedByCriteria() {

    }

    deleteProf(id: number) {
        this.profService.deleteById(id).subscribe({
            next: (response) => {
                console.log(`Deleted prof with id: ${id}`);
                // Code to update the UI, e.g., remove the deleted item from the list
            },
            error: (error) => {
                console.error('Error deleting prof:', error);
            }
        });
    }

}
