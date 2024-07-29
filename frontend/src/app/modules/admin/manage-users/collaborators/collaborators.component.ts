import {Component, OnInit} from '@angular/core';
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {PageEvent} from "@angular/material/paginator";
import {ManageUserDto} from "../../../../core/criteria/manage-user-dto";
import {Pageable} from "../../../../shared/utils/Pageable";
import {MatDialog} from "@angular/material/dialog";
import {ActivatedRoute, Router} from "@angular/router";
import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";
import {CollaboratorAdminService} from "../../../../shared/service/admin/vocab/CollaboratorAdmin.service";
import {CreateCollaboratorComponent} from "./create-collaborator/create-collaborator.component";

@Component({
    selector: 'app-collaborators',
    templateUrl: './collaborators.component.html'
})
export class CollaboratorsComponent implements OnInit {
    criteria: PageRequest<ManageUserDto>
    pageable: Pageable = new Pageable(0, 5)

    constructor(private profService: CollaboratorAdminService,
                private _matDialog: MatDialog,
                private router: Router,
                private route: ActivatedRoute,
                private auth: AuthService) {
    }

    ngOnInit() {
        this.findAllByCriteria()
    }

    private findAllByCriteria() {
        this.profService.findAllByCriteria(this.pageable)
            .subscribe(res => {
                this.criteria = res
                console.log(this.criteria)
            })
    }

    handle_pageable_change(event: PageEvent) {
        this.pageable = new Pageable(event?.pageIndex, event?.pageSize)
        this.findAllByCriteria();
    }

    createNew() {
        const dialog = this._matDialog.open(CreateCollaboratorComponent, {
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

    navigateToDetail(item: ManageUserDto) {
        this.router.navigate([`collaborator/${item.id}`], {relativeTo: this.route})
    }
}
