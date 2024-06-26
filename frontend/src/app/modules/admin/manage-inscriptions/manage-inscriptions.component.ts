import {Component, OnInit} from '@angular/core';
import {MatTabsModule} from "@angular/material/tabs";
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatPaginatorModule, PageEvent} from "@angular/material/paginator";
import {
    InscriptionCollaboratorService
} from "../../../shared/service/collaborator/grpe/InscriptionCollaborator.service";
import {InscriptionCriteria} from "../../../shared/criteria/grpe/InscriptionCriteria.model";
import {PaginatedList} from "../../../zynerator/dto/PaginatedList.model";
import {InscriptionDto} from "../../../shared/model/grpe/Inscription.model";
import {NgForOf, NgIf, NgOptimizedImage} from "@angular/common";
import {TYPE_INSCRIPTION} from "../../../shared/utils/enums";
import {CreateInscriptionComponent} from "./create-inscription/create-inscription.component";
import {MatDialog} from "@angular/material/dialog";

@Component({
    selector: 'app-manage-inscriptions',
    templateUrl: './manage-inscriptions.component.html',
    imports: [
        MatTabsModule,
        MatButtonModule,
        MatFormFieldModule,
        MatIconModule,
        MatInputModule,
        MatPaginatorModule,
        NgForOf,
        NgIf,
        NgOptimizedImage
    ],
    standalone: true
})
export class ManageInscriptionsComponent implements OnInit {
    status = TYPE_INSCRIPTION
    criteria: PaginatedList<InscriptionDto> = new PaginatedList<InscriptionDto>()
    pageable: InscriptionCriteria = new InscriptionCriteria();

    constructor(private service: InscriptionCollaboratorService,
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
        const dialog = this._matDialog.open(CreateInscriptionComponent, {
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

