import {Component} from '@angular/core';
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatPaginatorModule, PageEvent} from "@angular/material/paginator";
import {NgClass, NgForOf, NgIf} from "@angular/common";
import {TYPE_INSCRIPTION} from "../../../shared/utils/enums";
import {PaginatedList} from "../../../zynerator/dto/PaginatedList.model";
import {MatDialog} from "@angular/material/dialog";
import {InscriptionCreateAdminComponent} from "../manage-inscriptions/create-inscription/inscription-create-admin.component";
import {GroupeEtudiantDto} from "../../../shared/model/grpe/GroupeEtudiant.model";
import {
    GroupeEtudiantCollaboratorService
} from "../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import {GroupeEtudiantCriteria} from "../../../shared/criteria/grpe/GroupeEtudiantCriteria.model";

@Component({
    selector: 'app-manage-groups',
    templateUrl: './manage-groups.component.html',
    imports: [
        MatButtonModule,
        MatFormFieldModule,
        MatIconModule,
        MatInputModule,
        MatPaginatorModule,
        NgForOf,
        NgIf,
        NgClass
    ],
    standalone: true
})
export class ManageGroupsComponent {
    status = TYPE_INSCRIPTION
    criteria: PaginatedList<GroupeEtudiantDto> = new PaginatedList<GroupeEtudiantDto>()
    pageable: GroupeEtudiantCriteria = new GroupeEtudiantCriteria();
    active_status = 1;

    constructor(private service: GroupeEtudiantCollaboratorService,
                private _matDialog: MatDialog) {
    }

    ngOnInit() {
        this.pageable.page = 0
        this.pageable.maxResults = 5
        this.fetchData();
    }

    private fetchData() {
        this.service.findPaginatedByCriteria(this.pageable).subscribe(res => {
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
        const dialog = this._matDialog.open(InscriptionCreateAdminComponent, {
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
