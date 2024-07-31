import {Component, OnInit} from '@angular/core';
import {MatTabsModule} from "@angular/material/tabs";
import {MatInputModule} from "@angular/material/input";
import {MatIconModule} from "@angular/material/icon";
import {NgClass, NgForOf, NgIf} from "@angular/common";
import {MatButtonModule} from "@angular/material/button";
import {FuseCardComponent} from "../../../../@fuse/components/card";
import {ParcoursDto} from "../../../shared/model/course/Parcours.model";
import {ParcoursAdminService} from "../../../shared/service/admin/course/ParcoursAdmin.service";
import {colors} from "../../../shared/constant/colors";
import {MatDialog} from "@angular/material/dialog";
import {CreateMaterialComponent} from "./create-material/create-material.component";
import {Router} from "@angular/router";
import {ParcoursCriteria} from "../../../shared/criteria/course/ParcoursCriteria.model";
import {FormsModule} from "@angular/forms";
import {ParcoursCollaboratorService} from "../../../shared/service/collaborator/course/ParcoursCollaborator.service";

@Component({
    selector: 'app-manage-courses',
    templateUrl: './manage-courses.component.html',
    standalone: true,
    imports: [
        MatTabsModule,
        MatInputModule,
        MatIconModule,
        NgClass,
        MatButtonModule,
        FuseCardComponent,
        NgForOf,
        NgIf,
        FormsModule
    ]
})
export class ManageCoursesComponent implements OnInit {

    personalParcours: ParcoursDto[] = [];
    catalogParcours: ParcoursDto[] = [];

    constructor(private parcourService: ParcoursCollaboratorService,
                private router: Router,
                private _matDialog: MatDialog,) {
    }

    public findPaginatedByCriteria() {
        this.parcourService.findPaginatedByCriteria(this.criteria).subscribe(paginatedItems => {
            this.levels = paginatedItems.list
            console.log(this.levels)
        }, error => console.log(error));
    }

    get item(): ParcoursDto {
        return this.parcourService.item
    }

    set item(item: ParcoursDto) {
        this.parcourService.item = item
    }


    get criteria(): ParcoursCriteria {
        return this.parcourService.criteria;
    }

    set criteria(value: ParcoursCriteria) {
        this.parcourService.criteria = value;
    }

    get levels(): ParcoursDto[] {
        return this.parcourService.items
    }

    set levels(items: ParcoursDto[]) {
        this.parcourService.items = items
    }

    ngOnInit() {
        this.parcourService.findAll().subscribe(res => {
            this.levels = res
            console.log(this.levels)
        })

        this.parcourService.findForCurrentCollaborator().subscribe(res => {
            this.personalParcours = res;
            console.log(this.personalParcours);
        }, error => console.log(error));

        this.parcourService.findByForExgFlexy().subscribe(res => {
            this.catalogParcours = res;
            console.log(this.catalogParcours);
        }, error => console.log(error));
    }

    createMaterial() {
        this.item = new ParcoursDto()
        this.item.color = colors[Math.floor(Math.random() * colors.length)]
        const diqlog = this._matDialog.open(CreateMaterialComponent, {
            autoFocus: false,
        });
        diqlog.afterClosed().subscribe(res => {
            if (res != null) {
                this.personalParcours.unshift({...res})
            }
        })
    }


    navigateTo(item: ParcoursDto) {
        this.item = item
        this.router.navigate(['/admin/manage-courses/materials/' + item?.id])
    }


  searchParcoursForEngFlexy(libelle: string) {
    this.parcourService.findByLibelleLikeForEngFlexy(libelle).subscribe(res => {
        this.personalParcours = res;
    }, error => console.log(error));
}

    searchParcoursForCurrent(libelle: string) {
    this.parcourService.findByLibelleLikeForCurrent(libelle).subscribe(res => {
        this.personalParcours = res;
    }, error => console.log(error));
    }





}
