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
import {PageRequest} from "../../../zynerator/criteria/BaseCriteria.model";
import {Pageable} from "../../../shared/utils/Pageable";
import {
    PackStudentCollaboratorService
} from "../../../shared/service/collaborator/pack/PackStudentCollaborator.service";
import {PackageCollaboratorDto} from "../../../shared/model/collab/PackageCollaborator.model";
import {
    PackageCollaboratorCollaboratorService
} from "../../../shared/service/collaborator/collab/PackageCollaboratorCollaborator.service";
import {EditPackComponent} from "./edit-pack/edit-pack.component";

@Component({
    selector: 'app-manage-pack-prices',
    templateUrl: './manage-pack-prices.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    standalone: true,
    imports: [MatButtonModule, NgClass, FuseCardComponent, NgIf, MatIconModule, MatFormFieldModule, MatInputModule, MatOptionModule, MatPaginatorModule, MatSelectModule, NgForOf, DatePipe],
})
export class ManagePackPricesComponent implements OnInit{
    yearlyBilling: boolean = true;
    studentsForTeacher: [2, 7, 15, 20, 30, 50]
    studentForSchool: number = 20

    /**
     * Constructor
     */

    status = TYPE_INSCRIPTION
    items: PageRequest<InscriptionCollaboratorDto> = new PageRequest<InscriptionCollaboratorDto>()
    itemsPackages:Array<PackageCollaboratorDto> = new Array<PackageCollaboratorDto>();
    criteria:InscriptionCollaboratorCriteria = new InscriptionCollaboratorCriteria();
    active_status = 1;

    pageable=new Pageable(0,5);
    constructor(private service: InscriptionCollaboratorCollaboratorService,
                public servicePackageCollaborator:PackageCollaboratorCollaboratorService,
                private _fuseConfirmation: FuseConfirmationService,
                private router: Router,
                private route: ActivatedRoute,
                private changeDetector:ChangeDetectorRef,
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
            this.service.findByCollaboratorTypeCollaboratorIdSchool(this.pageable).subscribe(res => {
                this.items = res;
                this.changeDetector.detectChanges();
            });
        } else if(this.active_status===2){
            this.service.findByCollaboratorTypeCollaboratorIdTeacher(this.pageable).subscribe(res => {
                this.items = res;
                this.changeDetector.detectChanges();
            });
        }
        else{
            this.servicePackageCollaborator.findAll().subscribe(res=>{
                this.itemsPackages=res;
                this.changeDetector.detectChanges();
            })
        }
    }

    handle_pageable_change(event: PageEvent) {
        this.pageable.page = event?.pageIndex
        this.pageable.size = event?.pageSize
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
            if (res != null) this.items.content.unshift({...res})
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
            // If the confirmation button pressed...
            if (result === 'confirmed') {
                this.service.delete(item).subscribe(res => {
                    this.items.content.splice(this.items.content.indexOf(item), 1)
                }, error => {
                    this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
                })
            }
        });
    }

    edit(item: InscriptionCollaboratorDto) {
        this.item = item
        const dialogRef =this._matDialog.open(EditComponent, {
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
            if (res != null) {
                this.criteria = res
                this.service.findPaginatedByCriteria(this.criteria).subscribe(res => {
                    this.items.content = res.list
                    this.items.totalElements = res.dataSize
                })
            } else {
                this.criteria = new InscriptionCollaboratorCriteria()
                this.fetchData()
            }
        })
    }

    editPack(item: PackageCollaboratorDto) {
        this.itemPackage = item
        const dialogRef =this._matDialog.open(EditPackComponent, {
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

    openDetailPack(item: PackageCollaboratorDto) {

    }
}
