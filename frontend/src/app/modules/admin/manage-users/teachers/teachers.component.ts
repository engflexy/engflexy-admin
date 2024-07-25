import {Component, OnInit} from '@angular/core';
import {Criteria} from "../../../../zynerator/criteria/BaseCriteria.model";
import {PageEvent} from "@angular/material/paginator";
import {ProfCollaboratorService} from "../../../../shared/service/collaborator/prof/ProfCollaborator.service";
import {Pageable} from "../../../../shared/utils/Pageable";
import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";
import {UserCriteria} from "../../../../core/criteria/user-criteria";
import {CreateTeacherComponent} from "./create-teacher/create-teacher.component";
import {MatDialog} from "@angular/material/dialog";
import {ActivatedRoute, Router} from "@angular/router";
import {ProfCriteria} from "../../../../shared/criteria/prof/ProfCriteria.model";

@Component({
    selector: 'app-teachers',
    templateUrl: './teachers.component.html'
})
export class TeachersComponent implements OnInit {
    items: Criteria<UserCriteria>
    pageable: Pageable = new Pageable(0, 5)
    criteria: ProfCriteria = new ProfCriteria()

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

    navigateToDetail(item: UserCriteria) {
        this.router.navigate([`teacher/${item.id}`], {relativeTo: this.route})
    }

    findPaginatedByCriteria() {
        this.profService.findPaginatedByCriteria(this.criteria)
            .subscribe(res => {
                console.log(res)
            })
    }
}
