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
import {MatDialog} from "@angular/material/dialog";
import {FuseConfirmationService} from "../../../../@fuse/services/confirmation";
import {FuseAlertService} from "../../../../@fuse/components/alert";
import {EditInscriptionComponent} from "./edit-inscription/edit-inscription.component";
import {InscriptionCreateCollaboratorComponent} from "./create/inscription-create-collaborator.component";
import {FilterInscriptionComponent} from "./filter-inscription/filter-inscription.component";
import {FormsModule} from "@angular/forms";

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
        NgOptimizedImage,
        FormsModule
    ],
    standalone: true
})
export class ManageInscriptionsComponent implements OnInit {
    status = TYPE_INSCRIPTION
    criteria: PaginatedList<InscriptionDto> = new PaginatedList<InscriptionDto>()
    pageable: InscriptionCriteria = new InscriptionCriteria();


    constructor(private service: InscriptionCollaboratorService,
                private _fuseConfirmation: FuseConfirmationService,
                private alert: FuseAlertService,
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
        this.item = new InscriptionDto();
        const dialog = this._matDialog.open(InscriptionCreateCollaboratorComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 400px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe(res => {
            if (res != null) this.criteria.list.unshift({...res})
        })
    }

    delete(item: InscriptionDto) {
        const confirmation = this._fuseConfirmation.open({
            title: 'delete inscription',
            message: 'Are you sure you want to remove this inscription?',
            actions: {
                confirm: {
                    label: 'REMOVE',
                },
            },
        });

        // Subscribe to the confirmation dialog closed action
        confirmation.afterClosed().subscribe((result) => {
            // If the confirmation button pressed...
            if (result === 'confirmed') {
                this.service.delete(item).subscribe(res => {
                    this.criteria.list.splice(this.criteria.list.indexOf(item), 1)
                }, error => {
                    this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
                })
            }
        });
    }

    edit(item: InscriptionDto) {
        this.inscription = item
        const dialog = this._matDialog.open(EditInscriptionComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
    }

    get inscription(): InscriptionDto {
        return this.service.item;
    }

    set inscription(value: InscriptionDto) {
        this.service.item = value;
    }

    openFilter() {
        const dialog = this._matDialog.open(FilterInscriptionComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });

        dialog.afterClosed().subscribe(res => {
            if (res != null) {

            }
        })
    }

    get item(): InscriptionDto {
        return this.service.item;
    }

    set item(value: InscriptionDto) {
        this.service.item = value;
    }

}

