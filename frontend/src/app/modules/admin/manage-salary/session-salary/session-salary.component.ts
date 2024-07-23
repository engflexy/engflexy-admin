import {ChangeDetectorRef, Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogModule} from "@angular/material/dialog";
import {Class} from "../../schedule/models/Class";
import {SalaryDto} from "../../../../shared/model/salary/Salary.model";
import {
    SessionCoursCollaboratorService
} from "../../../../shared/service/collaborator/learning/SessionCoursCollaborator.service";
import {Pageable} from "../../../../shared/utils/Pageable";
import {Criteria} from "../../../../zynerator/criteria/BaseCriteria.model";
import {SessionSalary} from "../../../../core/criteria/Session-Salary";
import {DatePipe, NgForOf, NgIf} from "@angular/common";
import {MatPaginatorModule} from "@angular/material/paginator";

@Component({
    selector: 'app-session-salary',
    templateUrl: './session-salary.component.html',
    imports: [
        MatDialogModule,
        DatePipe,
        MatPaginatorModule,
        NgForOf,
        NgIf
    ],
    standalone: true
})
export class SessionSalaryComponent implements OnInit {
    pageable: Pageable = new Pageable(0, 5);
    criteria: Criteria<SessionSalary> = new Criteria<SessionSalary>();

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
