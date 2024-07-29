import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import {CommonModule, LocationStrategy, NgOptimizedImage, PathLocationStrategy} from '@angular/common';
import {ManageUsersComponent} from "./manage-users.component";
import {FuseCardComponent} from "../../../../@fuse/components/card";
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatTabsModule} from "@angular/material/tabs";
import {Route, RouterModule} from "@angular/router";
import {StudentsComponent} from './students/students.component';
import {TeachersComponent} from './teachers/teachers.component';
import {AdminsComponent} from './admins/admins.component';
import {CollaboratorsComponent} from './collaborators/collaborators.component';
import {MatMenuModule} from "@angular/material/menu";
import {DividerComponent} from "../../landing/divider/divider.component";
import {MatPaginatorModule} from "@angular/material/paginator";
import {CreateStudentComponent} from './students/create-student/create-student.component';
import {AngularEditorModule} from "@kolkov/angular-editor";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {MatDialogModule} from "@angular/material/dialog";
import {MatTooltipModule} from "@angular/material/tooltip";
import {StudentSettingsComponent} from "./students/student-settings/student.settings.component";
import {MatSidenavModule} from "@angular/material/sidenav";
import {SettingsAccountComponent} from "./students/student-settings/account/account.component";
import {SettingsNotificationsComponent} from "./students/student-settings/notifications/notifications.component";
import {SettingsPlanBillingComponent} from "./students/student-settings/plan-billing/plan-billing.component";
import {SettingsSecurityComponent} from "./students/student-settings/security/security.component";
import {SettingsTeamComponent} from "./students/student-settings/team/team.component";
import {MatRadioModule} from "@angular/material/radio";
import {MatSelectModule} from "@angular/material/select";
import {MatSlideToggleModule} from "@angular/material/slide-toggle";
import {ToFixed} from "../../../core/pipes/ToFixed";
import {PriceFormatPipe} from "../../../core/pipes/PriceFormatPipe";
import { CreateTeacherComponent } from './teachers/create-teacher/create-teacher.component';
import { TeacherDetailsComponent } from './teachers/teacher-details/teacher-details.component';
import { TeacherProfileComponent } from './teachers/teacher-details/teacher-profile/teacher-profile.component';
import { CreateCollaboratorComponent } from './collaborators/create-collaborator/create-collaborator.component';
import { CollaboratorDetialsComponent } from './collaborators/collaborator-detials/collaborator-detials.component';
import { CollaboratorProfileComponent } from './collaborators/collaborator-detials/collaborator-profile/collaborator-profile.component';


const userRoutes: Route[] = [
    {path: '', component: ManageUsersComponent},
    {path: 'student/:id', component: StudentSettingsComponent},
    {path: 'teacher/:id', component: TeacherDetailsComponent},
    {path: 'collaborator/:id', component: CollaboratorDetialsComponent},
]

@NgModule({
    declarations: [ManageUsersComponent, StudentsComponent, TeachersComponent,
        AdminsComponent, CollaboratorsComponent, CreateStudentComponent,
        SettingsAccountComponent,
        SettingsNotificationsComponent,
        SettingsPlanBillingComponent,
        SettingsSecurityComponent,
        SettingsTeamComponent, StudentSettingsComponent, CreateTeacherComponent, TeacherDetailsComponent, TeacherProfileComponent, CreateCollaboratorComponent, CollaboratorDetialsComponent, CollaboratorProfileComponent],
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
        MatTooltipModule,
        MatSidenavModule,
        MatRadioModule,
        MatSelectModule,
        MatSlideToggleModule,
        NgOptimizedImage,
        ToFixed,
        PriceFormatPipe
    ],
    schemas: [
        CUSTOM_ELEMENTS_SCHEMA,
        NO_ERRORS_SCHEMA
    ],
    exports: [
        CollaboratorProfileComponent
    ],
    providers: [{provide: LocationStrategy, useClass: PathLocationStrategy},
        Location]
})
export class ManageUsersModule {
}
