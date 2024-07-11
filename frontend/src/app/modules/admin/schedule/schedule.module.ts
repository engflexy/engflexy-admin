import {Route, RouterModule} from "@angular/router";
import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from "@angular/core";
import {CommonModule, LocationStrategy, NgOptimizedImage, PathLocationStrategy} from "@angular/common";
import {FuseCardComponent} from "../../../../@fuse/components/card";
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatTabsModule} from "@angular/material/tabs";
import {MatMenuModule} from "@angular/material/menu";
import {DividerComponent} from "../../landing/divider/divider.component";
import {MatPaginatorModule} from "@angular/material/paginator";
import {AngularEditorModule} from "@kolkov/angular-editor";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {MatDialogModule} from "@angular/material/dialog";
import {MatTooltipModule} from "@angular/material/tooltip";
import {MatSidenavModule} from "@angular/material/sidenav";
import {MatRadioModule} from "@angular/material/radio";
import {MatSelectModule} from "@angular/material/select";
import {MatSlideToggleModule} from "@angular/material/slide-toggle";
import {ToFixed} from "../../../core/pipes/ToFixed";
import {PriceFormatPipe} from "../../../core/pipes/PriceFormatPipe";
import {ScheduleComponent} from "./schedule.component";
import {ScheduleProfEditComponent} from "./edit/schedule-prof-edit.component";
import {ScheduleProfCreateCollaboratorComponent} from "./create/schedule-prof-create-collaborator.component";
import {FullCalendarModule} from "@fullcalendar/angular";
import {
    NgxMatDatetimePickerModule,
    NgxMatNativeDateAdapter,
    NgxMatTimepickerModule
} from "@angular-material-components/datetime-picker";
import {MatDatepickerModule} from "@angular/material/datepicker";
import {TranslocoModule} from "@ngneat/transloco";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";


const routes: Route[] = [
    {path: '', component: ScheduleComponent}
]

@NgModule({
    declarations: [ScheduleComponent,
        ScheduleProfEditComponent,
        ScheduleProfCreateCollaboratorComponent],
    imports: [
        RouterModule.forChild(routes),
        CommonModule,
        FuseCardComponent,
        FormsModule,
        MatButtonModule,
        MatFormFieldModule,
        MatIconModule,
        MatInputModule,
        FullCalendarModule,
        MatTabsModule,
        MatMenuModule,
        DividerComponent,
        MatPaginatorModule,
        AngularEditorModule,
        MatDialogModule,
        ReactiveFormsModule,
        MatTooltipModule,
        MatSidenavModule,
        MatRadioModule,
        MatSelectModule,
        MatSlideToggleModule,
        NgOptimizedImage,
        ToFixed,
        PriceFormatPipe,
        NgxMatDatetimePickerModule,
        MatDatepickerModule,
        TranslocoModule,
        NgxMatDatetimePickerModule,
        NgxMatTimepickerModule
    ],
    schemas: [
        CUSTOM_ELEMENTS_SCHEMA,
        NO_ERRORS_SCHEMA
    ],
    providers: [{provide: LocationStrategy, useClass: PathLocationStrategy},
        NgxMatNativeDateAdapter,
        Location]
})
export class ScheduleModule {
}
