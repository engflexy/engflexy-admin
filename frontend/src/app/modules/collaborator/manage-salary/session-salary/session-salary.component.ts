import {ChangeDetectorRef, Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA} from "@angular/material/dialog";
import {SalaryDto} from "../../../../shared/model/salary/Salary.model";
import {
    SessionCoursCollaboratorService
} from "../../../../shared/service/collaborator/learning/SessionCoursCollaborator.service";
import {Pageable} from "../../../../shared/utils/Pageable";
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {SessionSalary} from "../../../../core/criteria/Session-Salary";

@Component({
    selector: 'app-collaborator-session-salary',
    templateUrl: './session-salary.component.html',
})
export class SessionSalaryComponent implements OnInit {
    pageable: Pageable = new Pageable(0, 5);
    criteria: PageRequest<SessionSalary> = new PageRequest<SessionSalary>();

    constructor(@Inject(MAT_DIALOG_DATA) public data: SalaryDto,
                private ref: ChangeDetectorRef,
                private service: SessionCoursCollaboratorService
    ) {

    }

    ngOnInit() {
        this.fetchData();
    }

    private fetchData() {
        this.service.get_sessions_by_salary(this.data.id, this.pageable).subscribe(res => {
            this.criteria = res;
        })
    }

    handle_pageable_change($event: any) {
        this.pageable.page = $event.pageIndex;
        this.pageable.size = $event.pageSize;
        this.fetchData();
    }
}
