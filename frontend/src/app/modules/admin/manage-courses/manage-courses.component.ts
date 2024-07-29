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
import {EditMaterialComponent} from "./edit-material/edit-material.component";

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
        NgIf
    ]
})
export class ManageCoursesComponent implements OnInit {

    constructor(private parcourService: ParcoursAdminService,
                private router: Router,
                private _matDialog: MatDialog,) {
    }

    get item(): ParcoursDto {
        return this.parcourService.item
    }

    set item(item: ParcoursDto) {
        this.parcourService.item = item
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
}
