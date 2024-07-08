import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import {ToastModule} from 'primeng/toast';
import {ToolbarModule} from 'primeng/toolbar';
import {TableModule} from 'primeng/table';
import {DropdownModule} from 'primeng/dropdown';
import {InputSwitchModule} from 'primeng/inputswitch';
import {InputTextareaModule} from 'primeng/inputtextarea';
import {EditorModule} from "primeng/editor";

import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { DialogModule } from 'primeng/dialog';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {CalendarModule} from 'primeng/calendar';
import {PanelModule} from 'primeng/panel';
import {InputNumberModule} from 'primeng/inputnumber';
import {BadgeModule} from 'primeng/badge';
import { MultiSelectModule } from 'primeng/multiselect';
import {TranslateModule} from '@ngx-translate/core';
import {FileUploadModule} from 'primeng/fileupload';
import {FullCalendarModule} from '@fullcalendar/angular';
import {CardModule} from "primeng/card";
import {TagModule} from "primeng/tag";

import { FreeTrialConfigurationCreateCollaboratorComponent } from './free-trial-configuration/create/free-trial-configuration-create-collaborator.component';
import { FreeTrialConfigurationEditCollaboratorComponent } from './free-trial-configuration/edit/free-trial-configuration-edit-collaborator.component';
import { FreeTrialConfigurationViewCollaboratorComponent } from './free-trial-configuration/view/free-trial-configuration-view-collaborator.component';
import { FreeTrialConfigurationListCollaboratorComponent } from './free-trial-configuration/list/free-trial-configuration-list-collaborator.component';
import { FreeTrialformuleCreateCollaboratorComponent } from './free-trialformule/create/free-trialformule-create-collaborator.component';
import { FreeTrialformuleEditCollaboratorComponent } from './free-trialformule/edit/free-trialformule-edit-collaborator.component';
import { FreeTrialformuleViewCollaboratorComponent } from './free-trialformule/view/free-trialformule-view-collaborator.component';
import { FreeTrialformuleListCollaboratorComponent } from './free-trialformule/list/free-trialformule-list-collaborator.component';
import { FreeTrialCreateCollaboratorComponent } from './free-trial/create/free-trial-create-collaborator.component';
import { FreeTrialEditCollaboratorComponent } from './free-trial/edit/free-trial-edit-collaborator.component';
import { FreeTrialViewCollaboratorComponent } from './free-trial/view/free-trial-view-collaborator.component';
import { FreeTrialListCollaboratorComponent } from './free-trial/list/free-trial-list-collaborator.component';
import { FreeTrialTeacherWhatsTemplateCreateCollaboratorComponent } from './free-trial-teacher-whats-template/create/free-trial-teacher-whats-template-create-collaborator.component';
import { FreeTrialTeacherWhatsTemplateEditCollaboratorComponent } from './free-trial-teacher-whats-template/edit/free-trial-teacher-whats-template-edit-collaborator.component';
import { FreeTrialTeacherWhatsTemplateViewCollaboratorComponent } from './free-trial-teacher-whats-template/view/free-trial-teacher-whats-template-view-collaborator.component';
import { FreeTrialTeacherWhatsTemplateListCollaboratorComponent } from './free-trial-teacher-whats-template/list/free-trial-teacher-whats-template-list-collaborator.component';
import { StatutFreeTrialCreateCollaboratorComponent } from './statut-free-trial/create/statut-free-trial-create-collaborator.component';
import { StatutFreeTrialEditCollaboratorComponent } from './statut-free-trial/edit/statut-free-trial-edit-collaborator.component';
import { StatutFreeTrialViewCollaboratorComponent } from './statut-free-trial/view/statut-free-trial-view-collaborator.component';
import { StatutFreeTrialListCollaboratorComponent } from './statut-free-trial/list/statut-free-trial-list-collaborator.component';
import { ServicesCreateCollaboratorComponent } from './services/create/services-create-collaborator.component';
import { ServicesEditCollaboratorComponent } from './services/edit/services-edit-collaborator.component';
import { ServicesViewCollaboratorComponent } from './services/view/services-view-collaborator.component';
import { ServicesListCollaboratorComponent } from './services/list/services-list-collaborator.component';
import { FreeTrialDetailCreateCollaboratorComponent } from './free-trial-detail/create/free-trial-detail-create-collaborator.component';
import { FreeTrialDetailEditCollaboratorComponent } from './free-trial-detail/edit/free-trial-detail-edit-collaborator.component';
import { FreeTrialDetailViewCollaboratorComponent } from './free-trial-detail/view/free-trial-detail-view-collaborator.component';
import { FreeTrialDetailListCollaboratorComponent } from './free-trial-detail/list/free-trial-detail-list-collaborator.component';
import { FreeTrialTeacherEmailTemplateCreateCollaboratorComponent } from './free-trial-teacher-email-template/create/free-trial-teacher-email-template-create-collaborator.component';
import { FreeTrialTeacherEmailTemplateEditCollaboratorComponent } from './free-trial-teacher-email-template/edit/free-trial-teacher-email-template-edit-collaborator.component';
import { FreeTrialTeacherEmailTemplateViewCollaboratorComponent } from './free-trial-teacher-email-template/view/free-trial-teacher-email-template-view-collaborator.component';
import { FreeTrialTeacherEmailTemplateListCollaboratorComponent } from './free-trial-teacher-email-template/list/free-trial-teacher-email-template-list-collaborator.component';
import { FreeTrialStudentWhatsTemplateCreateCollaboratorComponent } from './free-trial-student-whats-template/create/free-trial-student-whats-template-create-collaborator.component';
import { FreeTrialStudentWhatsTemplateEditCollaboratorComponent } from './free-trial-student-whats-template/edit/free-trial-student-whats-template-edit-collaborator.component';
import { FreeTrialStudentWhatsTemplateViewCollaboratorComponent } from './free-trial-student-whats-template/view/free-trial-student-whats-template-view-collaborator.component';
import { FreeTrialStudentWhatsTemplateListCollaboratorComponent } from './free-trial-student-whats-template/list/free-trial-student-whats-template-list-collaborator.component';
import { FreeTrialStudentEmailTemplateCreateCollaboratorComponent } from './free-trial-student-email-template/create/free-trial-student-email-template-create-collaborator.component';
import { FreeTrialStudentEmailTemplateEditCollaboratorComponent } from './free-trial-student-email-template/edit/free-trial-student-email-template-edit-collaborator.component';
import { FreeTrialStudentEmailTemplateViewCollaboratorComponent } from './free-trial-student-email-template/view/free-trial-student-email-template-view-collaborator.component';
import { FreeTrialStudentEmailTemplateListCollaboratorComponent } from './free-trial-student-email-template/list/free-trial-student-email-template-list-collaborator.component';

import { PasswordModule } from 'primeng/password';
import { InputTextModule } from 'primeng/inputtext';
import {ButtonModule} from 'primeng/button';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {RouterModule} from '@angular/router';
import {TabViewModule} from 'primeng/tabview';
import { SplitButtonModule } from 'primeng/splitbutton';
import { MessageModule } from 'primeng/message';
import {MessagesModule} from 'primeng/messages';
import {PaginatorModule} from 'primeng/paginator';



@NgModule({
  declarations: [

    FreeTrialConfigurationCreateCollaboratorComponent,
    FreeTrialConfigurationListCollaboratorComponent,
    FreeTrialConfigurationViewCollaboratorComponent,
    FreeTrialConfigurationEditCollaboratorComponent,
    FreeTrialformuleCreateCollaboratorComponent,
    FreeTrialformuleListCollaboratorComponent,
    FreeTrialformuleViewCollaboratorComponent,
    FreeTrialformuleEditCollaboratorComponent,
    FreeTrialCreateCollaboratorComponent,
    FreeTrialListCollaboratorComponent,
    FreeTrialViewCollaboratorComponent,
    FreeTrialEditCollaboratorComponent,
    FreeTrialTeacherWhatsTemplateCreateCollaboratorComponent,
    FreeTrialTeacherWhatsTemplateListCollaboratorComponent,
    FreeTrialTeacherWhatsTemplateViewCollaboratorComponent,
    FreeTrialTeacherWhatsTemplateEditCollaboratorComponent,
    StatutFreeTrialCreateCollaboratorComponent,
    StatutFreeTrialListCollaboratorComponent,
    StatutFreeTrialViewCollaboratorComponent,
    StatutFreeTrialEditCollaboratorComponent,
    ServicesCreateCollaboratorComponent,
    ServicesListCollaboratorComponent,
    ServicesViewCollaboratorComponent,
    ServicesEditCollaboratorComponent,
    FreeTrialDetailCreateCollaboratorComponent,
    FreeTrialDetailListCollaboratorComponent,
    FreeTrialDetailViewCollaboratorComponent,
    FreeTrialDetailEditCollaboratorComponent,
    FreeTrialTeacherEmailTemplateCreateCollaboratorComponent,
    FreeTrialTeacherEmailTemplateListCollaboratorComponent,
    FreeTrialTeacherEmailTemplateViewCollaboratorComponent,
    FreeTrialTeacherEmailTemplateEditCollaboratorComponent,
    FreeTrialStudentWhatsTemplateCreateCollaboratorComponent,
    FreeTrialStudentWhatsTemplateListCollaboratorComponent,
    FreeTrialStudentWhatsTemplateViewCollaboratorComponent,
    FreeTrialStudentWhatsTemplateEditCollaboratorComponent,
    FreeTrialStudentEmailTemplateCreateCollaboratorComponent,
    FreeTrialStudentEmailTemplateListCollaboratorComponent,
    FreeTrialStudentEmailTemplateViewCollaboratorComponent,
    FreeTrialStudentEmailTemplateEditCollaboratorComponent,
  ],
  imports: [
    CommonModule,
    ToastModule,
    ToolbarModule,
    TableModule,
    ConfirmDialogModule,
    DialogModule,
    PasswordModule,
    InputTextModule,
    ButtonModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule,
    SplitButtonModule,
    BrowserAnimationsModule,
    DropdownModule,
    TabViewModule,
    InputSwitchModule,
    InputTextareaModule,
    CalendarModule,
    PanelModule,
    MessageModule,
    MessagesModule,
    InputNumberModule,
    BadgeModule,
    MultiSelectModule,
    PaginatorModule,
    TranslateModule,
    FileUploadModule,
    FullCalendarModule,
    CardModule,
    EditorModule,
    TagModule,


  ],
  exports: [
  FreeTrialConfigurationCreateCollaboratorComponent,
  FreeTrialConfigurationListCollaboratorComponent,
  FreeTrialConfigurationViewCollaboratorComponent,
  FreeTrialConfigurationEditCollaboratorComponent,
  FreeTrialformuleCreateCollaboratorComponent,
  FreeTrialformuleListCollaboratorComponent,
  FreeTrialformuleViewCollaboratorComponent,
  FreeTrialformuleEditCollaboratorComponent,
  FreeTrialCreateCollaboratorComponent,
  FreeTrialListCollaboratorComponent,
  FreeTrialViewCollaboratorComponent,
  FreeTrialEditCollaboratorComponent,
  FreeTrialTeacherWhatsTemplateCreateCollaboratorComponent,
  FreeTrialTeacherWhatsTemplateListCollaboratorComponent,
  FreeTrialTeacherWhatsTemplateViewCollaboratorComponent,
  FreeTrialTeacherWhatsTemplateEditCollaboratorComponent,
  StatutFreeTrialCreateCollaboratorComponent,
  StatutFreeTrialListCollaboratorComponent,
  StatutFreeTrialViewCollaboratorComponent,
  StatutFreeTrialEditCollaboratorComponent,
  ServicesCreateCollaboratorComponent,
  ServicesListCollaboratorComponent,
  ServicesViewCollaboratorComponent,
  ServicesEditCollaboratorComponent,
  FreeTrialDetailCreateCollaboratorComponent,
  FreeTrialDetailListCollaboratorComponent,
  FreeTrialDetailViewCollaboratorComponent,
  FreeTrialDetailEditCollaboratorComponent,
  FreeTrialTeacherEmailTemplateCreateCollaboratorComponent,
  FreeTrialTeacherEmailTemplateListCollaboratorComponent,
  FreeTrialTeacherEmailTemplateViewCollaboratorComponent,
  FreeTrialTeacherEmailTemplateEditCollaboratorComponent,
  FreeTrialStudentWhatsTemplateCreateCollaboratorComponent,
  FreeTrialStudentWhatsTemplateListCollaboratorComponent,
  FreeTrialStudentWhatsTemplateViewCollaboratorComponent,
  FreeTrialStudentWhatsTemplateEditCollaboratorComponent,
  FreeTrialStudentEmailTemplateCreateCollaboratorComponent,
  FreeTrialStudentEmailTemplateListCollaboratorComponent,
  FreeTrialStudentEmailTemplateViewCollaboratorComponent,
  FreeTrialStudentEmailTemplateEditCollaboratorComponent,
  ],
})
export class FreetrialCollaboratorModule { }
