import {DatePipe, NgClass, NgForOf, NgIf} from '@angular/common';
import {ChangeDetectionStrategy, ChangeDetectorRef, Component, OnInit, ViewEncapsulation} from '@angular/core';
import {MatButtonModule} from '@angular/material/button';
import {MatIconModule} from '@angular/material/icon';
import {FuseCardComponent} from '@fuse/components/card';
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {MatOptionModule} from "@angular/material/core";
import {MatPaginatorModule, PageEvent} from "@angular/material/paginator";
import {MatSelectModule} from "@angular/material/select";
import {TYPE_INSCRIPTION} from "../../../shared/utils/enums";
import {FuseConfirmationService} from "../../../../@fuse/services/confirmation";
import {ActivatedRoute, Router} from "@angular/router";
import {BreakpointObserver} from "@angular/cdk/layout";
import {
    GroupeEtudiantDetailCollaboratorService
} from "../../../shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service";
import {FuseAlertService} from "../../../../@fuse/components/alert";
import {MatDialog} from "@angular/material/dialog";
import {
    InscriptionCollaboratorCollaboratorService
} from "../../../shared/service/collaborator/collab/InscriptionCollaboratorCollaborator.service";
import {InscriptionCollaboratorCriteria} from "../../../shared/criteria/collab/InscriptionCollaboratorCriteria.model";
import {InscriptionCollaboratorDto} from "../../../shared/model/collab/InscriptionCollaborator.model";
import {CreateComponent} from "./create/create.component";
import {EditComponent} from "./edit/edit.component";
import {FilterComponent} from "./filter/filter.component";
import {PageRequest} from "../../../zynerator/criteria/BaseCriteria.model";
import {Pageable} from "../../../shared/utils/Pageable";
import {PackageCollaboratorDto} from "../../../shared/model/collab/PackageCollaborator.model";
import {
    PackageCollaboratorCollaboratorService
} from "../../../shared/service/collaborator/collab/PackageCollaboratorCollaborator.service";
import {EditPackComponent} from "./edit-pack/edit-pack.component";
import {PaginatedList} from "../../../zynerator/dto/PaginatedList.model";
import {CreatePackComponent} from "./create-pack/create-pack.component";
import {PackageCollaboratorCriteria} from "../../../shared/criteria/collab/PackageCollaboratorCriteria.model";
import {MatExpansionModule} from "@angular/material/expansion";
import {MatMenuModule} from "@angular/material/menu";
import {compareObjects} from "../../../zynerator/util/Gloabl";
import {FormsModule} from "@angular/forms";
import {MatAutocompleteModule} from "@angular/material/autocomplete";

@Component({
    selector: 'app-manage-pack-prices',
    templateUrl: './manage-pack-prices.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    standalone: true,
    imports: [MatButtonModule, NgClass, FuseCardComponent, NgIf, MatIconModule, MatFormFieldModule, MatInputModule, MatOptionModule, MatPaginatorModule, MatSelectModule, NgForOf, DatePipe, MatExpansionModule, MatMenuModule, FormsModule, MatAutocompleteModule],
})
export class ManagePackPricesComponent implements OnInit {
    yearlyBilling: boolean = true;
    studentsForTeacher: [2, 7, 15, 20, 30, 50]
    studentForSchool: number = 20

    /**
     * Constructor
     */

    status = TYPE_INSCRIPTION
    items: PageRequest<InscriptionCollaboratorDto> = new PageRequest<InscriptionCollaboratorDto>()
    itemsPackages: Array<PackageCollaboratorDto> = new Array<PackageCollaboratorDto>();
    panelOpenState: boolean;

    constructor(private service: InscriptionCollaboratorCollaboratorService,
                public servicePackageCollaborator: PackageCollaboratorCollaboratorService,
                private _fuseConfirmation: FuseConfirmationService,
                private router: Router,
                private route: ActivatedRoute,
                private changeDetector: ChangeDetectorRef,
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
            this.service.findByCollaboratorTypeCollaboratorIdSchool(this.criteria).subscribe(res => {
                this.pageable.list = res.content;
                this.changeDetector.detectChanges();
            });
        } else if (this.active_status === 2) {
            this.service.findByCollaboratorTypeCollaboratorIdTeacher(this.criteria).subscribe(res => {
                this.pageable.list = res.content;
                this.changeDetector.detectChanges();
            });
        } else if (this.active_status === 3) {
            this.servicePackageCollaborator.findByPackageTypeSchool(this.criteriaPack).subscribe(res => {
                this.pageablePack.list = res.content;
                this.changeDetector.detectChanges();
            });
        }
        else if (this.active_status === 4) {
            this.servicePackageCollaborator.findByPackageTypeTeacher(this.criteriaPack).subscribe(res => {
                this.pageablePack.list = res.content;
                this.changeDetector.detectChanges();
            });
        }
    }

    handle_pageable_change(event: PageEvent) {
        this.criteria.page = event?.pageIndex
        this.criteria.maxResults = event?.pageSize
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
            this.fetchData()

        })
    }

    changeType(index: number) {
        this.active_status = index
        this.criteria = new InscriptionCollaboratorCriteria()
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
            this.changeDetector.detectChanges();
            // If the confirmation button pressed...
            if (result === 'confirmed') {
                this.service.delete(item).subscribe(res => {
                    this.items.content.splice(this.items.content.indexOf(item), 1)
                    this.alert.show('info', 'Inscription successfully deleted!')

                }, error => {
                    this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
                })
            }
        });


    }

    edit(item: InscriptionCollaboratorDto) {
        this.item = item
        const dialogRef = this._matDialog.open(EditComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialogRef.afterClosed().subscribe(result => {
            this.changeDetector.detectChanges();
        });
    }

    get item(): InscriptionCollaboratorDto {
        return this.service.item;
    }


    set item(value: InscriptionCollaboratorDto) {
        this.service.item = value;
    }

    get itemPackage(): PackageCollaboratorDto {
        return this.servicePackageCollaborator.item;
    }


    set itemPackage(value: PackageCollaboratorDto) {
        this.servicePackageCollaborator.item = value;
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
            if (res == null) {
                console.log('hana f after close')
                this.criteria = new InscriptionCollaboratorCriteria();
                this.fetchData()
            }
        })
    }

    editPack(item: PackageCollaboratorDto) {
        this.itemPackage = item
        const dialogRef = this._matDialog.open(EditPackComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialogRef.afterClosed().subscribe(result => {
            this.changeDetector.detectChanges();
            this.fetchData();
        });

    }

    openDetailPack(item: PackageCollaboratorDto) {

    }

    get active_status(): number {
        return this.service.active_status;
    }

    set active_status(value: number) {
        this.service.active_status = value;
    }

    get criteria(): InscriptionCollaboratorCriteria {
        return this.service.criteria;
    }

    set criteria(value: InscriptionCollaboratorCriteria) {
        this.service.criteria = value;
    }
    get criteriaPack(): PackageCollaboratorCriteria {
        return this.servicePackageCollaborator.criteria;
    }

    set criteriaPack(value: PackageCollaboratorCriteria) {
        this.servicePackageCollaborator.criteria = value;
    }

    get pageable(): PaginatedList<InscriptionCollaboratorDto> {
        if (this.service.pageable == null) {
            this.service.pageable = new PaginatedList<InscriptionCollaboratorDto>()
        }
        return this.service.pageable;
    }

    set pageable(value: PaginatedList<InscriptionCollaboratorDto>) {
        this.service.pageable = value;
    }

    get pageablePack(): PaginatedList<PackageCollaboratorDto> {
        if (this.servicePackageCollaborator.pageable == null) {
            this.servicePackageCollaborator.pageable = new PaginatedList<PackageCollaboratorDto>()
        }
        return this.servicePackageCollaborator.pageable;
    }

    set pageablePack(value: PaginatedList<PackageCollaboratorDto>) {
        this.servicePackageCollaborator.pageable = value;
    }

    createPack() {
        const dialogRef = this._matDialog.open(CreatePackComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialogRef.afterClosed().subscribe(result => {
            this.fetchData()
            this.changeDetector.detectChanges();
        });
    }

    deletePack(item: PackageCollaboratorDto) {
        const confirmation = this._fuseConfirmation.open({
            title: 'delete inscription',
            message: `Are you sure you want to remove  <strong> ${item?.libelle} </strong> ?`,
            actions: {
                confirm: {
                    label: 'REMOVE',
                },
            },
        });

        // Subscribe to the confirmation dialog closed action
        confirmation.afterClosed().subscribe((result) => {
            this.changeDetector.detectChanges();
            // If the confirmation button pressed...
            if (result === 'confirmed') {
                this.servicePackageCollaborator.delete(item).subscribe(res => {
                    this.alert.show('info', 'Inscription successfully deleted!')

                    this.fetchData()
                }, error => {
                    this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
                })
            }
        });

    }

    createInscription() {
        console.log(this.service.active_status)

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
            this.fetchData()

        })
    }

    protected readonly compareObjects = compareObjects;
}
