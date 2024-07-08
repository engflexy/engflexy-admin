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

import { ScheduleProfCreateCollaboratorComponent } from './schedule-prof/create/schedule-prof-create-collaborator.component';
import { ScheduleProfEditCollaboratorComponent } from './schedule-prof/edit/schedule-prof-edit-collaborator.component';
import { ScheduleProfViewCollaboratorComponent } from './schedule-prof/view/schedule-prof-view-collaborator.component';
import { ScheduleProfListCollaboratorComponent } from './schedule-prof/list/schedule-prof-list-collaborator.component';
import { ProfCreateCollaboratorComponent } from './prof/create/prof-create-collaborator.component';
import { ProfEditCollaboratorComponent } from './prof/edit/prof-edit-collaborator.component';
import { ProfViewCollaboratorComponent } from './prof/view/prof-view-collaborator.component';
import { ProfListCollaboratorComponent } from './prof/list/prof-list-collaborator.component';
import { TypeCollaboratorCreateCollaboratorComponent } from './type-collaborator/create/type-collaborator-create-collaborator.component';
import { TypeCollaboratorEditCollaboratorComponent } from './type-collaborator/edit/type-collaborator-edit-collaborator.component';
import { TypeCollaboratorViewCollaboratorComponent } from './type-collaborator/view/type-collaborator-view-collaborator.component';
import { TypeCollaboratorListCollaboratorComponent } from './type-collaborator/list/type-collaborator-list-collaborator.component';
import { CategorieProfCreateCollaboratorComponent } from './categorie-prof/create/categorie-prof-create-collaborator.component';
import { CategorieProfEditCollaboratorComponent } from './categorie-prof/edit/categorie-prof-edit-collaborator.component';
import { CategorieProfViewCollaboratorComponent } from './categorie-prof/view/categorie-prof-view-collaborator.component';
import { CategorieProfListCollaboratorComponent } from './categorie-prof/list/categorie-prof-list-collaborator.component';
import { ClassAverageBonusProfCreateCollaboratorComponent } from './class-average-bonus-prof/create/class-average-bonus-prof-create-collaborator.component';
import { ClassAverageBonusProfEditCollaboratorComponent } from './class-average-bonus-prof/edit/class-average-bonus-prof-edit-collaborator.component';
import { ClassAverageBonusProfViewCollaboratorComponent } from './class-average-bonus-prof/view/class-average-bonus-prof-view-collaborator.component';
import { ClassAverageBonusProfListCollaboratorComponent } from './class-average-bonus-prof/list/class-average-bonus-prof-list-collaborator.component';
import { TypeTeacherCreateCollaboratorComponent } from './type-teacher/create/type-teacher-create-collaborator.component';
import { TypeTeacherEditCollaboratorComponent } from './type-teacher/edit/type-teacher-edit-collaborator.component';
import { TypeTeacherViewCollaboratorComponent } from './type-teacher/view/type-teacher-view-collaborator.component';
import { TypeTeacherListCollaboratorComponent } from './type-teacher/list/type-teacher-list-collaborator.component';
import { TrancheHoraireProfCreateCollaboratorComponent } from './tranche-horaire-prof/create/tranche-horaire-prof-create-collaborator.component';
import { TrancheHoraireProfEditCollaboratorComponent } from './tranche-horaire-prof/edit/tranche-horaire-prof-edit-collaborator.component';
import { TrancheHoraireProfViewCollaboratorComponent } from './tranche-horaire-prof/view/tranche-horaire-prof-view-collaborator.component';
import { TrancheHoraireProfListCollaboratorComponent } from './tranche-horaire-prof/list/tranche-horaire-prof-list-collaborator.component';

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

    ScheduleProfCreateCollaboratorComponent,
    ScheduleProfListCollaboratorComponent,
    ScheduleProfViewCollaboratorComponent,
    ScheduleProfEditCollaboratorComponent,
    ProfCreateCollaboratorComponent,
    ProfListCollaboratorComponent,
    ProfViewCollaboratorComponent,
    ProfEditCollaboratorComponent,
    TypeCollaboratorCreateCollaboratorComponent,
    TypeCollaboratorListCollaboratorComponent,
    TypeCollaboratorViewCollaboratorComponent,
    TypeCollaboratorEditCollaboratorComponent,
    CategorieProfCreateCollaboratorComponent,
    CategorieProfListCollaboratorComponent,
    CategorieProfViewCollaboratorComponent,
    CategorieProfEditCollaboratorComponent,
    ClassAverageBonusProfCreateCollaboratorComponent,
    ClassAverageBonusProfListCollaboratorComponent,
    ClassAverageBonusProfViewCollaboratorComponent,
    ClassAverageBonusProfEditCollaboratorComponent,
    TypeTeacherCreateCollaboratorComponent,
    TypeTeacherListCollaboratorComponent,
    TypeTeacherViewCollaboratorComponent,
    TypeTeacherEditCollaboratorComponent,
    TrancheHoraireProfCreateCollaboratorComponent,
    TrancheHoraireProfListCollaboratorComponent,
    TrancheHoraireProfViewCollaboratorComponent,
    TrancheHoraireProfEditCollaboratorComponent,
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
  ScheduleProfCreateCollaboratorComponent,
  ScheduleProfListCollaboratorComponent,
  ScheduleProfViewCollaboratorComponent,
  ScheduleProfEditCollaboratorComponent,
  ProfCreateCollaboratorComponent,
  ProfListCollaboratorComponent,
  ProfViewCollaboratorComponent,
  ProfEditCollaboratorComponent,
  TypeCollaboratorCreateCollaboratorComponent,
  TypeCollaboratorListCollaboratorComponent,
  TypeCollaboratorViewCollaboratorComponent,
  TypeCollaboratorEditCollaboratorComponent,
  CategorieProfCreateCollaboratorComponent,
  CategorieProfListCollaboratorComponent,
  CategorieProfViewCollaboratorComponent,
  CategorieProfEditCollaboratorComponent,
  ClassAverageBonusProfCreateCollaboratorComponent,
  ClassAverageBonusProfListCollaboratorComponent,
  ClassAverageBonusProfViewCollaboratorComponent,
  ClassAverageBonusProfEditCollaboratorComponent,
  TypeTeacherCreateCollaboratorComponent,
  TypeTeacherListCollaboratorComponent,
  TypeTeacherViewCollaboratorComponent,
  TypeTeacherEditCollaboratorComponent,
  TrancheHoraireProfCreateCollaboratorComponent,
  TrancheHoraireProfListCollaboratorComponent,
  TrancheHoraireProfViewCollaboratorComponent,
  TrancheHoraireProfEditCollaboratorComponent,
  ],
})
export class ProfCollaboratorModule { }
