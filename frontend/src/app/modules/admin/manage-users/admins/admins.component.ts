import {Component} from '@angular/core';
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";
import {PageEvent} from "@angular/material/paginator";
import {CreateCollaboratorComponent} from "../collaborators/create-collaborator/create-collaborator.component";
import {CreateAdminComponent} from "./create-admin/create-admin.component";
import {MatDialog} from "@angular/material/dialog";

@Component({
    selector: 'app-admins',
    templateUrl: './admins.component.html',
    styleUrls: ['./admins.component.scss']
})
export class AdminsComponent {
    criteria: PageRequest<EtudiantDto>

    constructor(private _matDialog: MatDialog,) {

    }

    handle_pageable_change(event: PageEvent) {

    }

    createNew() {
        const dialog = this._matDialog.open(CreateAdminComponent, {
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
}
