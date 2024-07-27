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
import {
    GroupeEtudiantCollaboratorService
} from "../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import {GroupeEtudiantCriteria} from "../../../shared/criteria/grpe/GroupeEtudiantCriteria.model";
import {GroupeEtudiantCreateCollaboratorComponent} from './create/groupe-etudiant-create-collaborator.component';
import {GroupeEtudeCriteria} from "../../../shared/criteria/grpe/GroupeEtudeCriteria.model";
import {GroupeEtudiantDto} from "../../../shared/model/grpe/GroupeEtudiant.model";
import {FuseConfirmationService} from "../../../../@fuse/services/confirmation";
import {FuseAlertService} from "../../../../@fuse/components/alert";
import {GroupEditComponent} from "./group-edit/group-edit.component";
import {GroupeEtudiantDetailDto} from "../../../shared/model/grpe/GroupeEtudiantDetail.model";
import {
    GroupeEtudiantDetailCollaboratorService
} from "../../../shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service";
import {GroupFilterComponent} from "./group-filter/group-filter.component";
import {ActivatedRoute, Router} from "@angular/router";
import {BreakpointObserver} from "@angular/cdk/layout";

@Component({
    selector: 'app-collaborator-manage-groups',
    templateUrl: './manage-groups.component.html',
})
export class ManageGroupsComponent {
    status = TYPE_INSCRIPTION
    paginatedList = new PaginatedList<GroupeEtudiantDto>()
    criteria = new GroupeEtudiantCriteria();
    active_status = 1;

    constructor(private service: GroupeEtudiantCollaboratorService,
                private _fuseConfirmation: FuseConfirmationService,
                private router: Router,
                private route: ActivatedRoute,
                private breakpointObserver: BreakpointObserver,
                private groupDetailService: GroupeEtudiantDetailCollaboratorService,
                private alert: FuseAlertService,
                private _matDialog: MatDialog) {
    }

    get groupDetails(): Array<GroupeEtudiantDetailDto> {
        return this.groupDetailService.items;
    }

    set groupDetails(value: Array<GroupeEtudiantDetailDto>) {
        this.groupDetailService.items = value;
    }

    ngOnInit() {
        this.findPaginatedByCriteria()
    }


    private findPaginatedByCriteria() {
        if (this.active_status === 1) {
            this.criteria.groupeEtude = new GroupeEtudeCriteria(2, 'group of students')
        } else {
            this.criteria.groupeEtude = new GroupeEtudeCriteria(1, 'individual')
        }
        this.service.findPaginatedByCriteria(this.criteria).subscribe(res => {
            this.paginatedList = res
        })
    }

    handle_pageable_change(event: PageEvent) {
        this.criteria.page = event?.pageIndex
        this.criteria.maxResults = event?.pageSize
        this.findPaginatedByCriteria();
    }

    create() {
        this.item = new GroupeEtudiantDto()
        const dialog = this._matDialog.open(GroupeEtudiantCreateCollaboratorComponent, {
            autoFocus: false,
            height: "auto",
            width: "65vw",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe(res => {
            if (res != null) this.paginatedList.list.unshift({...res})
        })

        /*
           this.breakpointObserver.observe([
      Breakpoints.Handset,
      Breakpoints.Tablet,
      Breakpoints.Web
    ]).subscribe((result: BreakpointState) => {
      if (result.matches) {
        if (this.breakpointObserver.isMatched(Breakpoints.Handset)) {
          console.log('Screen size is small (sm)');
        } else if (this.breakpointObserver.isMatched(Breakpoints.Tablet)) {
          console.log('Screen size is medium (md)');
        } else if (this.breakpointObserver.isMatched(Breakpoints.Web)) {
          console.log('Screen size is large (lg)');
        }
      }
    });
  }
         */
    }

    changeType(index: number) {
        this.active_status = index
        this.criteria = new GroupeEtudiantCriteria()
        this.findPaginatedByCriteria()
    }

    delete(item: GroupeEtudiantDto) {
        const confirmation = this._fuseConfirmation.open({
            title: 'delete group',
            message: `Are you sure you want to remove  <strong> ${item?.libelle} </strong> ?`,
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
                    this.paginatedList.list.splice(this.paginatedList.list.indexOf(item), 1)
                }, error => {
                    this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
                })
            }
        });
    }

    edit(item: GroupeEtudiantDto) {
        this.item = item
        this._matDialog.open(GroupEditComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
    }

    get item(): GroupeEtudiantDto {
        return this.service.item;
    }

    set item(value: GroupeEtudiantDto) {
        this.service.item = value;
    }

    openDetail(item: GroupeEtudiantDto) {
        this.item = item
        this.groupDetails = item.groupeEtudiantDetails
        this.router.navigate([`group-details/${item?.id}`], {relativeTo: this.route});
    }

    openFilter() {
        const dialog = this._matDialog.open(GroupFilterComponent, {
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
                    this.paginatedList = res
                })
            } else {
                this.criteria = new GroupeEtudiantCriteria()
                this.findPaginatedByCriteria()
            }
        })
    }
}
