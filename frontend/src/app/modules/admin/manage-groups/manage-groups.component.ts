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
import {CreateInscriptionComponent} from "../manage-inscriptions/create-inscription/create-inscription.component";
import {
    GroupeEtudiantCollaboratorService
} from "../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import {GroupeEtudiantCriteria} from "../../../shared/criteria/grpe/GroupeEtudiantCriteria.model";
import {ParcoursDto} from "../../../shared/model/course/Parcours.model";
import {ProfDto} from "../../../shared/model/prof/Prof.model";
import {GroupeTypeDto} from "../../../shared/model/grpe/GroupeType.model";

@Component({
    selector: 'app-manage-groups',
    templateUrl: './manage-groups.component.html',
    imports: [
        MatButtonModule,
        MatFormFieldModule,
        MatIconModule,
        MatInputModule,
        MatPaginatorModule,
        NgForOf,
        NgIf,
        NgClass
    ],
    standalone: true
})
export class ManageGroupsComponent {
    status = TYPE_INSCRIPTION
    criteria: PaginatedList<any> = new PaginatedList<any>()
    pageable: GroupeEtudiantCriteria = new GroupeEtudiantCriteria();
    active_status = 1;

    constructor(private service: GroupeEtudiantCollaboratorService,
                private _matDialog: MatDialog) {
    }

    ngOnInit() {
        this.pageable.page = 0
        this.pageable.maxResults = 5
        this.criteria =
            {
                dataSize: 10,
                list: [
                    {
                        libelle: 'Lorim upsol',
                        type: 'PAID',
                        nreCourses: 20,
                        parcours: new ParcoursDto('Elementary'),
                        prof: new ProfDto(1, 'Youssef EL MOUDENE'),
                        nombrePlace: 5,
                        nombrePlaceNonVide: 2,
                        nombrePlacevide: 3,
                        groupeType: new GroupeTypeDto('Individual')
                    },
                    {
                        libelle: 'Lorim upsol',
                        type: 'PAID',
                        nreCourses: 20,
                        parcours: new ParcoursDto('Elementary'),
                        prof: new ProfDto(1, 'Youssef EL MOUDENE'),
                        nombrePlace: 1,
                        nombrePlaceNonVide: 1,
                        nombrePlacevide: 0,
                        groupeType: new GroupeTypeDto('Individual')
                    },
                    {
                        libelle: 'Rhoncus nec erat',
                        type: 'TRIAL',
                        nreCourses: 20,
                        parcours: new ParcoursDto('Elementary'),
                        prof: new ProfDto(1, 'Youssef EL MOUDENE'),
                        nombrePlace: 1,
                        nombrePlaceNonVide: 1,
                        nombrePlacevide: 0,
                        groupeType: new GroupeTypeDto('Individual')
                    },
                    {
                        libelle: 'Dictumst ac venenatis',
                        type: 'PAID',
                        nreCourses: 20,
                        parcours: new ParcoursDto('Elementary'),
                        prof: new ProfDto(1, 'Youssef EL MOUDENE'),
                        nombrePlace: 1,
                        nombrePlaceNonVide: 1,
                        nombrePlacevide: 0,
                        groupeType: new GroupeTypeDto('Individual')
                    },
                    {
                        libelle: 'Donec porttitor',
                        type: 'PAID',
                        nreCourses: 20,
                        parcours: new ParcoursDto('Elementary'),
                        prof: new ProfDto(1, 'Youssef EL MOUDENE'),
                        nombrePlace: 1,
                        nombrePlaceNonVide: 1,
                        nombrePlacevide: 0,
                        groupeType: new GroupeTypeDto('Individual')
                    },
                ]
            }
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
