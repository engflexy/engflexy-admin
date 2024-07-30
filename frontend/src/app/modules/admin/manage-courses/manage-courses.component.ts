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
import {FilterMaterialComponent} from "./filter-material/filter-material.component";

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


    constructor(private parcourService: ParcoursAdminService,
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

    }

    createMaterial() {
        this.item = new ParcoursDto()
        this.item.color = colors[Math.floor(Math.random() * colors.length)]
        this._matDialog.open(CreateMaterialComponent, {
            autoFocus: false,
        });
    }


    navigateTo(item: ParcoursDto) {
        this.item = item
        this.router.navigate(['/admin/manage-courses/materials/' + item?.id])
    }

    openFilter() {
        const dialog = this._matDialog.open(FilterMaterialComponent, {
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
}
