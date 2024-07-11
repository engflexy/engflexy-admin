import {NgClass, NgForOf, NgIf} from '@angular/common';
import {ChangeDetectionStrategy, Component, ViewEncapsulation} from '@angular/core';
import {MatButtonModule} from '@angular/material/button';
import {MatIconModule} from '@angular/material/icon';
import {FuseCardComponent} from '@fuse/components/card';
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {MatOptionModule} from "@angular/material/core";
import {MatPaginatorModule} from "@angular/material/paginator";
import {MatSelectModule} from "@angular/material/select";

@Component({
    selector: 'app-manage-pack-prices',
    templateUrl: './manage-pack-prices.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    standalone: true,
    imports: [MatButtonModule, NgClass, FuseCardComponent, NgIf, MatIconModule, MatFormFieldModule, MatInputModule, MatOptionModule, MatPaginatorModule, MatSelectModule, NgForOf],
})
export class ManagePackPricesComponent {
    yearlyBilling: boolean = true;
    studentsForTeacher: [2, 7, 15, 20, 30, 50]
    studentForSchool: number = 20

    /**
     * Constructor
     */
    constructor() {
    }

    public create() {

    }
}
