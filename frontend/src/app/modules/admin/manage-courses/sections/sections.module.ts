import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import {
    CommonModule,
    LocationStrategy,
    NgClass,
    NgFor,
    NgIf,
    NgOptimizedImage,
    PathLocationStrategy
} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {MatCheckboxModule} from '@angular/material/checkbox';
import {MatOptionModule} from '@angular/material/core';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import {MatRadioModule} from '@angular/material/radio';
import {MatSelectModule} from '@angular/material/select';
import {MatStepperModule} from '@angular/material/stepper';
import {RouterLink, RouterModule, RouterOutlet} from "@angular/router";
import {MatIconModule} from "@angular/material/icon";
import {MatProgressBarModule} from "@angular/material/progress-bar";
import {MatSidenavModule} from "@angular/material/sidenav";
import {MatButtonModule} from "@angular/material/button";
import {MatTabsModule} from "@angular/material/tabs";
import {CdkScrollable} from "@angular/cdk/scrolling";
import {CdkDrag, CdkDropList, CdkDropListGroup} from "@angular/cdk/drag-drop";
import {MatTooltipModule} from "@angular/material/tooltip";
import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatDialogModule} from "@angular/material/dialog";
import {MatPaginatorModule} from "@angular/material/paginator";
import {MatButtonToggleModule} from "@angular/material/button-toggle";
import {NgApexchartsModule} from "ng-apexcharts";
import {MatMenuModule} from "@angular/material/menu";
import {MatBadgeModule} from "@angular/material/badge";
import {FuseCardComponent} from "../../../../../@fuse/components/card";
import {SectionsRoutes} from "./sections.routes";
import {ClassroomComponent} from "./classroom/classroom.component";


@NgModule({
    declarations: [ClassroomComponent],
    imports: [
        SectionsRoutes,
        CommonModule,
        RouterModule,
        RouterOutlet,
        FormsModule,
        ReactiveFormsModule,
        MatStepperModule,
        MatFormFieldModule,
        MatInputModule,
        MatSelectModule,
        MatOptionModule,
        MatCheckboxModule,
        MatRadioModule,
        MatIconModule,
        MatProgressBarModule,
        MatSidenavModule,
        RouterLink,
        NgIf, NgClass, NgFor, MatButtonModule,
        CdkScrollable,
        MatTabsModule,
        NgOptimizedImage,
        FuseCardComponent,
        CdkDropListGroup,
        CdkDrag,
        CdkDropList,
        MatTooltipModule,
        MatAutocompleteModule, MatDialogModule, MatPaginatorModule,
        MatButtonToggleModule, NgApexchartsModule, MatMenuModule, MatBadgeModule,


    ],
    exports: [],
    schemas: [
        CUSTOM_ELEMENTS_SCHEMA,
        NO_ERRORS_SCHEMA
    ],
    providers: [{provide: LocationStrategy, useClass: PathLocationStrategy},
        Location]
})
export class SectionsModule {
}
