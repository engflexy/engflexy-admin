import {NgClass, NgForOf, NgIf} from '@angular/common';
import {ChangeDetectionStrategy, Component, OnInit, ViewEncapsulation} from '@angular/core';
import {MatButtonModule} from '@angular/material/button';
import {MatIconModule} from '@angular/material/icon';
import {FuseCardComponent} from '@fuse/components/card';
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {MatOptionModule} from "@angular/material/core";
import {MatPaginatorModule, PageEvent} from "@angular/material/paginator";
import {MatSelectModule} from "@angular/material/select";
import {TYPE_INSCRIPTION} from "../../../shared/utils/enums";
import {PaginatedList} from "../../../zynerator/dto/PaginatedList.model";
import {GroupeEtudiantCriteria} from "../../../shared/criteria/grpe/GroupeEtudiantCriteria.model";
import {
    GroupeEtudiantCollaboratorService
} from "../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import {FuseConfirmationService} from "../../../../@fuse/services/confirmation";
import {ActivatedRoute, Router} from "@angular/router";
import {BreakpointObserver} from "@angular/cdk/layout";
import {
    GroupeEtudiantDetailCollaboratorService
} from "../../../shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service";
import {FuseAlertService} from "../../../../@fuse/components/alert";
import {MatDialog} from "@angular/material/dialog";
import {GroupeEtudiantDetailDto} from "../../../shared/model/grpe/GroupeEtudiantDetail.model";
import {GroupeEtudeCriteria} from "../../../shared/criteria/grpe/GroupeEtudeCriteria.model";
import {GroupeEtudiantDto} from "../../../shared/model/grpe/GroupeEtudiant.model";
import {
    GroupeEtudiantCreateCollaboratorComponent
} from "../manage-groups/create/groupe-etudiant-create-collaborator.component";
import {GroupEditComponent} from "../manage-groups/group-edit/group-edit.component";
import {GroupFilterComponent} from "../manage-groups/group-filter/group-filter.component";
import {
    InscriptionCollaboratorCollaboratorService
} from "../../../shared/service/collaborator/collab/InscriptionCollaboratorCollaborator.service";
import {InscriptionCollaboratorCriteria} from "../../../shared/criteria/collab/InscriptionCollaboratorCriteria.model";
import {TypeCollaboratorDto} from "../../../shared/model/prof/TypeCollaborator.model";
import {InscriptionCollaboratorDto} from "../../../shared/model/collab/InscriptionCollaborator.model";
import {TypeCollaboratorCriteria} from "../../../shared/criteria/prof/TypeCollaboratorCriteria.model";
import {CollaboratorDto} from "../../../shared/model/vocab/Collaborator.model";
import {CollaboratorCriteria} from "../../../shared/criteria/vocab/CollaboratorCriteria.model";
import {CreateComponent} from "./create/create.component";
import {EditComponent} from "./edit/edit.component";
import {FilterComponent} from "./filter/filter.component";

@Component({
    selector: 'app-manage-pack-prices',
    templateUrl: './manage-pack-prices.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    standalone: true,
    imports: [MatButtonModule, NgClass, FuseCardComponent, NgIf, MatIconModule, MatFormFieldModule, MatInputModule, MatOptionModule, MatPaginatorModule, MatSelectModule, NgForOf],
})
export class ManagePackPricesComponent implements OnInit{
    yearlyBilling: boolean = true;
    studentsForTeacher: [2, 7, 15, 20, 30, 50]
    studentForSchool: number = 20

    /**
     * Constructor
     */
    status = TYPE_INSCRIPTION
    criteria: PaginatedList<any> = new PaginatedList<any>()
    pageable:InscriptionCollaboratorCriteria = new InscriptionCollaboratorCriteria();
    active_status = 1;

    constructor(private service: InscriptionCollaboratorCollaboratorService,
                private _fuseConfirmation: FuseConfirmationService,
                private router: Router,
                private route: ActivatedRoute,

                private breakpointObserver: BreakpointObserver,
                private groupDetailService: GroupeEtudiantDetailCollaboratorService,
                private alert: FuseAlertService,
                private _matDialog: MatDialog) {
    }


    ngOnInit() {
        this.fetchData()

    }


    private fetchData() {
        if (this.active_status === 1) {
            this.service.findByCollaboratorTypeCollaboratorIdSchool().subscribe(res => {
                this.criteria.list = res;
            });
        } else {
            this.service.findByCollaboratorTypeCollaboratorIdTeacher().subscribe(res => {
                this.criteria.list = res;
            });
        }
    }

    handle_pageable_change(event: PageEvent) {
        this.pageable.page = event?.pageIndex
        this.pageable.maxResults = event?.pageSize
        this.fetchData();
    }

    create() {
        this.item = new InscriptionCollaboratorDto()
        const dialog = this._matDialog.open(CreateComponent, {
            autoFocus: false,
            height: "auto",
            width: "65vw",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe(res => {
            if (res != null) this.criteria.list.unshift({...res})
        })
    }

    changeType(index: number) {
        this.active_status = index
        this.pageable = new InscriptionCollaboratorCriteria()
        this.fetchData()
    }

    delete(item: InscriptionCollaboratorDto) {
        const confirmation = this._fuseConfirmation.open({
            title: 'delete inscription',
            message: `Are you sure you want to remove  <strong> ${item?.collaborator?.username} </strong> ?`,
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

    edit(item: InscriptionCollaboratorDto) {
        this.item = item
        this._matDialog.open(EditComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
    }

    get item(): InscriptionCollaboratorDto {
        return this.service.item;
    }

    set item(value: InscriptionCollaboratorDto) {
        this.service.item = value;
    }

    openDetail(item: InscriptionCollaboratorDto) {
        this.item = item
      }

    openFilter() {
        const dialog = this._matDialog.open(FilterComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe(res => {
            if (res != null) {
                this.pageable = res
                this.service.findPaginatedByCriteria(this.pageable).subscribe(res => {
                    this.criteria = res
                })
            } else {
                this.pageable = new InscriptionCollaboratorCriteria()
                this.fetchData()
            }
        })
    }
}
