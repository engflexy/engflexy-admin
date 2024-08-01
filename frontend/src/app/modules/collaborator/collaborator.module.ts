import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from "@angular/core";
import {CommonModule, LocationStrategy, NgOptimizedImage, PathLocationStrategy} from "@angular/common";
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatTabsModule} from "@angular/material/tabs";
import {MatMenuModule} from "@angular/material/menu";
import {MatPaginatorModule} from "@angular/material/paginator";
import {AngularEditorModule} from "@kolkov/angular-editor";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {MatDialogModule} from "@angular/material/dialog";
import {MatTooltipModule} from "@angular/material/tooltip";
import {MatSidenavModule} from "@angular/material/sidenav";
import {MatRadioModule} from "@angular/material/radio";
import {MatSelectModule} from "@angular/material/select";
import {MatSlideToggleModule} from "@angular/material/slide-toggle";
import {FullCalendarModule} from "@fullcalendar/angular";
import {MatDatepickerModule} from "@angular/material/datepicker";
import {TranslocoModule} from "@ngneat/transloco";
import {OwlDateTimeModule, OwlNativeDateTimeModule} from '@danielmoncada/angular-datetime-picker';
import {CollaboratorDashboardComponent} from "./collaborator-dashboard/collaborator-dashboard.component";
import {CollaboratorRouting} from "./collaborator.routing";
import {FuseCardComponent} from "../../../@fuse/components/card";
import {DividerComponent} from "../landing/divider/divider.component";
import {ToFixed} from "../../core/pipes/ToFixed";
import {PriceFormatPipe} from "../../core/pipes/PriceFormatPipe";
import {ScheduleComponent} from "./schedule/schedule.component";
import {ScheduleProfCreateCollaboratorComponent} from "./schedule/create/schedule-prof-create-collaborator.component";
import {PopUpInfoComponent} from "./schedule/pop-up-info/pop-up-info.component";
import {ScheduleProfEditComponent} from "./schedule/edit/schedule-prof-edit.component";
import {ManageUsersModule} from "./manage-users/manage-users.module";
import {ManageInscriptionsComponent} from "./manage-inscriptions/manage-inscriptions.component";
import {FilterInscriptionComponent} from "./manage-inscriptions/filter-inscription/filter-inscription.component";
import {EditInscriptionComponent} from "./manage-inscriptions/edit-inscription/edit-inscription.component";
import {
    InscriptionCreateCollaboratorComponent
} from "./manage-inscriptions/create/inscription-create-collaborator.component";
import {ManageGroupsComponent} from "./manage-groups/manage-groups.component";
import {GroupFilterComponent} from "./manage-groups/group-filter/group-filter.component";
import {GroupEditComponent} from "./manage-groups/group-edit/group-edit.component";
import {GroupDetailsComponent} from "./manage-groups/group-details/group-details.component";
import {
    GroupeEtudiantCreateCollaboratorComponent
} from "./manage-groups/create/groupe-etudiant-create-collaborator.component";
import {ManageFaqNewsComponent} from "./manage-faq-news/manage-faq-news.component";
import {FaqEditAdminComponent} from "./manage-faq-news/edit/faq-edit-admin.component";
import {FaqCreateAdminComponent} from "./manage-faq-news/create/faq-create-admin.component";
import {ManageCoursesComponent} from "./manage-courses/manage-courses.component";
import {MaterialDetailComponent} from "./manage-courses/material-detail/material-detail.component";
import {CreateCourseComponent} from "./manage-courses/material-detail/create-course/create-course.component";
import {CreateMaterialComponent} from "./manage-courses/create-material/create-material.component";
import {ChatComponent} from "./chat-component/chat/chat.component";
import {ProfileComponent} from "./chat-component/chat/profile/profile.component";
import {NewChatComponent} from "./chat-component/chat/new-chat/new-chat.component";
import {EmptyConversationComponent} from "./chat-component/chat/empty-conversation/empty-conversation.component";
import {ConversationComponent} from "./chat-component/chat/conversation/conversation.component";
import {ContactInfoComponent} from "./chat-component/chat/contact-info/contact-info.component";
import {ChatsComponent} from "./chat-component/chat/chats/chats.component";
import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {SafePipe} from "../../shared/utils/safe.pipe";
import {ManageSalaryComponent} from "./manage-salary/manage-salary.component";
import {SessionSalaryComponent} from "./manage-salary/session-salary/session-salary.component";
import {CreateSalaryComponent} from "./manage-salary/create-salary/create-salary.component";
import {FilterSalaryComponent} from "./manage-salary/filter-salary/filter.salary.component";
import {EditSalaryComponent} from "./manage-salary/edit-salary/edit-salary.component";
import { CollaboratorSubscriptionComponent } from './collaborator-subscription/collaborator-subscription.component';


@NgModule({
    declarations: [
        CollaboratorDashboardComponent,
        ScheduleComponent,
        ScheduleProfCreateCollaboratorComponent,
        PopUpInfoComponent,
        ScheduleProfEditComponent,
        ManageSalaryComponent,
        SessionSalaryComponent,
        CreateSalaryComponent,
        FilterSalaryComponent,
        EditSalaryComponent,
        ManageInscriptionsComponent,
        FilterInscriptionComponent,
        EditInscriptionComponent,
        InscriptionCreateCollaboratorComponent,
        ManageGroupsComponent,
        GroupFilterComponent,
        GroupEditComponent,
        GroupDetailsComponent,
        GroupeEtudiantCreateCollaboratorComponent,
        ManageFaqNewsComponent,
        FaqEditAdminComponent,
        FaqCreateAdminComponent,
        ManageCoursesComponent,
        MaterialDetailComponent,
        CreateCourseComponent,
        CreateMaterialComponent,
        ChatComponent,
        ProfileComponent,
        NewChatComponent,
        EmptyConversationComponent,
        ConversationComponent,
        ContactInfoComponent,
        ChatsComponent, SafePipe, CollaboratorSubscriptionComponent,

    ],
    imports: [
        CollaboratorRouting,
        ManageUsersModule,
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
        MatDatepickerModule,
        TranslocoModule,
        OwlDateTimeModule,
        OwlNativeDateTimeModule,
        MatAutocompleteModule,
        MatCheckboxModule,
    ],
    schemas: [
        CUSTOM_ELEMENTS_SCHEMA,
        NO_ERRORS_SCHEMA
    ],
    exports: [
        ScheduleComponent,
        SafePipe
    ],
    providers: [{provide: LocationStrategy, useClass: PathLocationStrategy},
        Location]
})
export class CollaboratorModule {
}
