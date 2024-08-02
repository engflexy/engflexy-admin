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
import {SalaryDto} from "../../../shared/model/salary/Salary.model";
import {MatSelectModule} from "@angular/material/select";
import {CreateSalaryComponent} from "./create-salary/create-salary.component";
import {SalaryCollaboratorService} from "../../../shared/service/collaborator/salary/SalaryCollaborator.service";
import {SalaryCriteria} from "../../../shared/criteria/salary/SalaryCriteria.model";
import {FormsModule} from "@angular/forms";
import {ProfCriteria} from "../../../shared/criteria/prof/ProfCriteria.model";
import {FilterSalaryComponent} from "./filter-salary/filter.salary.component";
import {ProfDto} from "../../../shared/model/prof/Prof.model";
import {SessionSalaryComponent} from "./session-salary/session-salary.component";
import {FuseConfirmationService} from "../../../../@fuse/services/confirmation";
import {FuseAlertService} from "../../../../@fuse/components/alert";
import {EditSalaryComponent} from "./edit-salary/edit-salary.component";

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
    pageable: SalaryCriteria = new SalaryCriteria();

    constructor(private service: SalaryCollaboratorService,
                private _matDialog: MatDialog,
                private _fuseConfirmation: FuseConfirmationService,
                private alert: FuseAlertService,
    ) {
    }

    get criteria(): PaginatedList<SalaryDto> {
        return this.service.criteriaList;
    }

    set criteria(value: PaginatedList<SalaryDto>) {
        this.service.criteriaList = value;
    }

    get item(): SalaryDto {
        return this.service.item;
    }

    set item(value: SalaryDto) {
        this.service.item = value;
    }

    ngOnInit() {
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
            if (res != null) this.criteria.list.push({...res})
        })

    }

    openFilter() {
        const dialog = this._matDialog.open(FilterSalaryComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });

        dialog.afterClosed().subscribe(res => {
            if (res == null) {
                this.pageable = new SalaryCriteria();
                this.fetchData()
            }
        })
    }

    edit(item: SalaryDto) {
        this.item = item
        const dialog = this._matDialog.open(EditSalaryComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%",
        });
        dialog.afterClosed().subscribe(res => {
            if (res != null) {
                const index = this.criteria.list.findIndex(s => s.id === res.id)
                this.criteria.list[index] = {...res}
            }
        })
    }


    displayProf(item: ProfDto): string {
        return item && item.fullName ? item.fullName : "";
    }

    filter(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this.pageable.prof.fullName = value
        } else {
            this.pageable.prof = new ProfCriteria()
        }
    }


    openDetail(item: SalaryDto) {
        const dialog = this._matDialog.open(SessionSalaryComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            maxHeight: "100%",
            data: item
        });

    }

    delete(item: SalaryDto) {
        const confirmation = this._fuseConfirmation.open({
            title: 'delete salary',
            message: 'Are you sure you want to remove this salary?',
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
}
