import {Component, OnInit} from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { tap } from 'rxjs/operators';
import {MatTabsModule} from "@angular/material/tabs";
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatPaginatorModule, PageEvent} from "@angular/material/paginator";
import {InscriptionCollaboratorService} from "../../../shared/service/collaborator/grpe/InscriptionCollaborator.service";
import {InscriptionCriteria} from "../../../shared/criteria/grpe/InscriptionCriteria.model";
import {PaginatedList} from "../../../zynerator/dto/PaginatedList.model";
import {InscriptionDto} from "../../../shared/model/grpe/Inscription.model";
import {AsyncPipe, NgForOf, NgIf, NgOptimizedImage} from "@angular/common";
import {TYPE_INSCRIPTION} from "../../../shared/utils/enums";
import {InscriptionCreateAdminComponent} from "./create-inscription/inscription-create-admin.component";
import {MatDialog, MatDialogConfig} from "@angular/material/dialog";
import {FuseAlertService} from "../../../../@fuse/components/alert";
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
        AsyncPipe,
        FormsModule
    ],
    standalone: true
})

export class ManageInscriptionsComponent implements OnInit {

    items: InscriptionDto[] = [];

    private criteriaSubject = new BehaviorSubject<PaginatedList<InscriptionDto>>(new PaginatedList<InscriptionDto>());

    criteria$ = this.criteriaSubject.asObservable();

    status = TYPE_INSCRIPTION

    criteria: InscriptionCriteria = new InscriptionCriteria();

    constructor(private service: InscriptionCollaboratorService,
                private dialog: MatDialog,
                private alert: FuseAlertService,
                ) {
    }

    ngOnInit() {
        this.criteria.page = 0
        this.criteria.maxResults = 5;
        this.fetchData();
    }

    private fetchData() {
        this.service.findPaginatedByCriteria(this.criteria).pipe(
            tap(res => console.log(res))
        ).subscribe(res => {
            this.criteriaSubject.next(res);
        });
    }

    findByCriteria(): void {

        //console.log('Criteria recherchés:', this.criteria);

        if ((this.criteria.etudiant && this.criteria.etudiant.fullName) ||
            (this.criteria.etudiant && this.criteria.etudiant.email) ||
            (this.criteria.etudiant && this.criteria.etudiant.phone)) {

            this.service.findByCriteria(this.criteria).subscribe(
                (data) => {
                    this.items = data.filter(item =>
                        (this.criteria.etudiant.fullName && item.etudiant.fullName.toLowerCase().includes(this.criteria.etudiant.fullName.toLowerCase())) ||
                        (this.criteria.etudiant.email && item.etudiant.email.toLowerCase().includes(this.criteria.etudiant.email.toLowerCase())) ||
                        (this.criteria.etudiant.phone && item.etudiant.phone.includes(this.criteria.etudiant.phone))
                    );
                    console.log(this.items);
                },
                (error) => {
                    console.error('Error fetching data by criteria', error);
                }
            );
        } else {
            console.warn('All search criteria are empty.');
        }
    }

    handle_pageable_change(event: PageEvent) {
        this.criteria.page = event?.pageIndex
        this.criteria.maxResults = event?.pageSize
        this.fetchData();
    }

    /**create() {

        const dialog = this._matDialog.open(InscriptionCreateAdminComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });

        dialog.afterClosed().subscribe(res => {
            if (res != null) {
                const currentCriteria = this.criteriaSubject.value;
                currentCriteria.list.unshift({...res});
                this.criteriaSubject.next(currentCriteria);
            }})
    }**/

    create(){
        const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = true;
        dialogConfig.autoFocus = true;
        dialogConfig.width = "60%";
        this.dialog.open(InscriptionCreateAdminComponent, dialogConfig)
    }


    public delete(item: InscriptionDto, index: number) {
        if (confirm('Are you sure you want to delete this inscription?')) {
            this.service.delete(item).subscribe(
                response => {
                    if (response > 0) {
                        const currentCriteria = this.criteriaSubject.value;
                        currentCriteria.list = currentCriteria.list.filter((_, i) => i !== index);
                        this.criteriaSubject.next(currentCriteria);
                        this.alert.show('success', 'Inscription deleted successfully.');
                    } else {
                        this.alert.show('error', 'Failed to delete inscription.');
                    }
                },
                error => {
                    console.error(error);
                    this.alert.show('error', 'An error occurred while deleting the inscription.');
                }
            );
        }
    }
}

