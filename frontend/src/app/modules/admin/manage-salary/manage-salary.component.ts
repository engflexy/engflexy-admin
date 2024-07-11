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
import {InscriptionCreateCollaboratorComponent} from "../manage-inscriptions/create/inscription-create-collaborator.component";
import {SalaryDto} from "../../../shared/model/salary/Salary.model";
import {MatSelectModule} from "@angular/material/select";
import {CreateSalaryComponent} from "./create-salary/create-salary.component";
import {SalaryCollaboratorService} from "../../../shared/service/collaborator/salary/SalaryCollaborator.service";
import {InscriptionDto} from "../../../shared/model/grpe/Inscription.model";
import {SalaryCriteria} from "../../../shared/criteria/salary/SalaryCriteria.model";
import {FormsModule} from "@angular/forms";
import {ProfCriteria} from "../../../shared/criteria/prof/ProfCriteria.model";

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
        MatSelectModule,
        FormsModule
    ],
    standalone: true
})
export class ManageSalaryComponent {
    status = TYPE_INSCRIPTION

    criteria: PaginatedList<SalaryDto> = new PaginatedList<SalaryDto>()

    pageable: SalaryCriteria = new SalaryCriteria();

    constructor(private service: SalaryCollaboratorService,
                private _matDialog: MatDialog) {
    }

    ngOnInit() {
        this.pageable.page = 0
        this.pageable.maxResults = 5
        this.pageable.prof = new ProfCriteria();
        this.fetchData()

    }

    private fetchData() {
        this.service.findPaginatedByCriteria(this.pageable).subscribe(res => {
            this.criteria = res
            console.log(res)
        })
    }

    onSearch() {
        console.log('Search criteria:', this.pageable);
        this.fetchData();
    }



    handle_pageable_change(event: PageEvent) {
        this.pageable.page = event?.pageIndex
        this.pageable.maxResults = event?.pageSize
        this.fetchData();
    }

    create() {
        const dialog = this._matDialog.open(CreateSalaryComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe(res => {
            if (res != null) this.criteria.list.unshift({...res})
        })

    }


}
