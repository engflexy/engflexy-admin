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

import { SectionItemCreateAdminComponent } from './section-item/create/section-item-create-admin.component';
import { SectionItemEditAdminComponent } from './section-item/edit/section-item-edit-admin.component';
import { SectionItemViewAdminComponent } from './section-item/view/section-item-view-admin.component';
import { SectionItemListAdminComponent } from './section-item/list/section-item-list-admin.component';
import { ExerciceCreateAdminComponent } from './exercice/create/exercice-create-admin.component';
import { ExerciceEditAdminComponent } from './exercice/edit/exercice-edit-admin.component';
import { ExerciceViewAdminComponent } from './exercice/view/exercice-view-admin.component';
import { ExerciceListAdminComponent } from './exercice/list/exercice-list-admin.component';
import { ParcoursCreateAdminComponent } from './parcours/create/parcours-create-admin.component';
import { ParcoursEditAdminComponent } from './parcours/edit/parcours-edit-admin.component';
import { ParcoursViewAdminComponent } from './parcours/view/parcours-view-admin.component';
import { ParcoursListAdminComponent } from './parcours/list/parcours-list-admin.component';
import { SectionCreateAdminComponent } from './section/create/section-create-admin.component';
import { SectionEditAdminComponent } from './section/edit/section-edit-admin.component';
import { SectionViewAdminComponent } from './section/view/section-view-admin.component';
import { SectionListAdminComponent } from './section/list/section-list-admin.component';
import { CoursCreateAdminComponent } from './cours/create/cours-create-admin.component';
import { CoursEditAdminComponent } from './cours/edit/cours-edit-admin.component';
import { CoursViewAdminComponent } from './cours/view/cours-view-admin.component';
import { CoursListAdminComponent } from './cours/list/cours-list-admin.component';

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

    SectionItemCreateAdminComponent,
    SectionItemListAdminComponent,
    SectionItemViewAdminComponent,
    SectionItemEditAdminComponent,
    ExerciceCreateAdminComponent,
    ExerciceListAdminComponent,
    ExerciceViewAdminComponent,
    ExerciceEditAdminComponent,
    ParcoursCreateAdminComponent,
    ParcoursListAdminComponent,
    ParcoursViewAdminComponent,
    ParcoursEditAdminComponent,
    SectionCreateAdminComponent,
    SectionListAdminComponent,
    SectionViewAdminComponent,
    SectionEditAdminComponent,
    CoursCreateAdminComponent,
    CoursListAdminComponent,
    CoursViewAdminComponent,
    CoursEditAdminComponent,
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
  SectionItemCreateAdminComponent,
  SectionItemListAdminComponent,
  SectionItemViewAdminComponent,
  SectionItemEditAdminComponent,
  ExerciceCreateAdminComponent,
  ExerciceListAdminComponent,
  ExerciceViewAdminComponent,
  ExerciceEditAdminComponent,
  ParcoursCreateAdminComponent,
  ParcoursListAdminComponent,
  ParcoursViewAdminComponent,
  ParcoursEditAdminComponent,
  SectionCreateAdminComponent,
  SectionListAdminComponent,
  SectionViewAdminComponent,
  SectionEditAdminComponent,
  CoursCreateAdminComponent,
  CoursListAdminComponent,
  CoursViewAdminComponent,
  CoursEditAdminComponent,
  ],
})
export class CourseAdminModule { }
