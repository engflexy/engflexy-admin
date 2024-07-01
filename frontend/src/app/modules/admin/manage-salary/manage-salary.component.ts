import {Component} from '@angular/core';
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatPaginatorModule, PageEvent} from "@angular/material/paginator";
import {NgClass, NgForOf, NgIf} from "@angular/common";
import {TYPE_INSCRIPTION} from "../../../shared/utils/enums";
import {PaginatedList} from "../../../zynerator/dto/PaginatedList.model";
import {GroupeEtudiantCriteria} from "../../../shared/criteria/grpe/GroupeEtudiantCriteria.model";
import {
    GroupeEtudiantCollaboratorService
} from "../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import {MatDialog} from "@angular/material/dialog";
import {ParcoursDto} from "../../../shared/model/course/Parcours.model";
import {ProfDto} from "../../../shared/model/prof/Prof.model";
import {GroupeTypeDto} from "../../../shared/model/grpe/GroupeType.model";
import {CreateInscriptionComponent} from "../manage-inscriptions/create-inscription/create-inscription.component";
import {SalaryDto} from "../../../shared/model/salary/Salary.model";
import {MatSelectModule} from "@angular/material/select";

@Component({
    selector: 'app-manage-salary',
    templateUrl: './manage-salary.component.html',
    imports: [
        MatButtonModule,
        MatFormFieldModule,
        MatIconModule,
        MatInputModule,
        MatPaginatorModule,
        NgForOf,
        NgIf,
        NgClass,
        MatSelectModule
    ],
    standalone: true
})
export class ManageSalaryComponent {
    status = TYPE_INSCRIPTION
    criteria: Array<any> = new Array<any>()
    pageable: GroupeEtudiantCriteria = new GroupeEtudiantCriteria();

    constructor(private service: GroupeEtudiantCollaboratorService,
                private _matDialog: MatDialog) {
    }

    ngOnInit() {
        this.pageable.page = 0
        this.pageable.maxResults = 5
        this.fetchData()

    }

    private fetchData() {
        this.service.findAllSalary().subscribe(res => {
            this.criteria = res
            console.log(res)
        })
    }

    handle_pageable_change(event: PageEvent) {
        this.pageable.page = event?.pageIndex
        this.pageable.maxResults = event?.pageSize
        this.fetchData();
    }

    create() {

    }
}
