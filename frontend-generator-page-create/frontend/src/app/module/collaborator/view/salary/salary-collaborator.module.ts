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

import { WorkloadBonusProfCreateCollaboratorComponent } from './workload-bonus-prof/create/workload-bonus-prof-create-collaborator.component';
import { WorkloadBonusProfEditCollaboratorComponent } from './workload-bonus-prof/edit/workload-bonus-prof-edit-collaborator.component';
import { WorkloadBonusProfViewCollaboratorComponent } from './workload-bonus-prof/view/workload-bonus-prof-view-collaborator.component';
import { WorkloadBonusProfListCollaboratorComponent } from './workload-bonus-prof/list/workload-bonus-prof-list-collaborator.component';
import { WorkloadBonusCreateCollaboratorComponent } from './workload-bonus/create/workload-bonus-create-collaborator.component';
import { WorkloadBonusEditCollaboratorComponent } from './workload-bonus/edit/workload-bonus-edit-collaborator.component';
import { WorkloadBonusViewCollaboratorComponent } from './workload-bonus/view/workload-bonus-view-collaborator.component';
import { WorkloadBonusListCollaboratorComponent } from './workload-bonus/list/workload-bonus-list-collaborator.component';
import { SalaryCreateCollaboratorComponent } from './salary/create/salary-create-collaborator.component';
import { SalaryEditCollaboratorComponent } from './salary/edit/salary-edit-collaborator.component';
import { SalaryViewCollaboratorComponent } from './salary/view/salary-view-collaborator.component';
import { SalaryListCollaboratorComponent } from './salary/list/salary-list-collaborator.component';

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

    WorkloadBonusProfCreateCollaboratorComponent,
    WorkloadBonusProfListCollaboratorComponent,
    WorkloadBonusProfViewCollaboratorComponent,
    WorkloadBonusProfEditCollaboratorComponent,
    WorkloadBonusCreateCollaboratorComponent,
    WorkloadBonusListCollaboratorComponent,
    WorkloadBonusViewCollaboratorComponent,
    WorkloadBonusEditCollaboratorComponent,
    SalaryCreateCollaboratorComponent,
    SalaryListCollaboratorComponent,
    SalaryViewCollaboratorComponent,
    SalaryEditCollaboratorComponent,
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
  WorkloadBonusProfCreateCollaboratorComponent,
  WorkloadBonusProfListCollaboratorComponent,
  WorkloadBonusProfViewCollaboratorComponent,
  WorkloadBonusProfEditCollaboratorComponent,
  WorkloadBonusCreateCollaboratorComponent,
  WorkloadBonusListCollaboratorComponent,
  WorkloadBonusViewCollaboratorComponent,
  WorkloadBonusEditCollaboratorComponent,
  SalaryCreateCollaboratorComponent,
  SalaryListCollaboratorComponent,
  SalaryViewCollaboratorComponent,
  SalaryEditCollaboratorComponent,
  ],
})
export class SalaryCollaboratorModule { }
