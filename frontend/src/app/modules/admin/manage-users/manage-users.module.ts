import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import {CommonModule, LocationStrategy, PathLocationStrategy} from '@angular/common';
import {ManageUsersComponent} from "./manage-users.component";
import {FuseCardComponent} from "../../../../@fuse/components/card";
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatTabsModule} from "@angular/material/tabs";
import {Route, RouterModule} from "@angular/router";
import { StudentsComponent } from './students/students.component';
import { TeachersComponent } from './teachers/teachers.component';
import { AdminsComponent } from './admins/admins.component';
import { CollaboratorsComponent } from './collaborators/collaborators.component';
import {MatMenuModule} from "@angular/material/menu";
import {DividerComponent} from "../../landing/divider/divider.component";
import {MatPaginatorModule} from "@angular/material/paginator";
import { CreateStudentComponent } from './students/create-student/create-student.component';
import {AngularEditorModule} from "@kolkov/angular-editor";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {MatDialogModule} from "@angular/material/dialog";
import {MatTooltipModule} from "@angular/material/tooltip";
import { StudentDetailComponent } from './students/student-detail/student-detail.component';


const userRoutes: Route[] = [
    {path: '', component: ManageUsersComponent},
    {path: 'student/:id', component: StudentDetailComponent},
]

@NgModule({
    declarations: [ManageUsersComponent, StudentsComponent, TeachersComponent, AdminsComponent, CollaboratorsComponent, CreateStudentComponent, StudentDetailComponent],
    imports: [
        RouterModule.forChild(userRoutes),
        CommonModule,
        FuseCardComponent,
        MatButtonModule,
        MatFormFieldModule,
        MatIconModule,
        MatInputModule,
        MatTabsModule,
        MatMenuModule,
        DividerComponent,
        MatPaginatorModule,
        AngularEditorModule,
        FormsModule,
        MatDialogModule,
        ReactiveFormsModule,
        MatTooltipModule
    ],
    schemas: [
        CUSTOM_ELEMENTS_SCHEMA,
        NO_ERRORS_SCHEMA
    ],
    providers: [{provide: LocationStrategy, useClass: PathLocationStrategy},
        Location]
})
export class ManageUsersModule {
}
