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

import { SectionItemCreateCollaboratorComponent } from './section-item/create/section-item-create-collaborator.component';
import { SectionItemEditCollaboratorComponent } from './section-item/edit/section-item-edit-collaborator.component';
import { SectionItemViewCollaboratorComponent } from './section-item/view/section-item-view-collaborator.component';
import { SectionItemListCollaboratorComponent } from './section-item/list/section-item-list-collaborator.component';
import { ExerciceCreateCollaboratorComponent } from './exercice/create/exercice-create-collaborator.component';
import { ExerciceEditCollaboratorComponent } from './exercice/edit/exercice-edit-collaborator.component';
import { ExerciceViewCollaboratorComponent } from './exercice/view/exercice-view-collaborator.component';
import { ExerciceListCollaboratorComponent } from './exercice/list/exercice-list-collaborator.component';
import { ParcoursCreateCollaboratorComponent } from './parcours/create/parcours-create-collaborator.component';
import { ParcoursEditCollaboratorComponent } from './parcours/edit/parcours-edit-collaborator.component';
import { ParcoursViewCollaboratorComponent } from './parcours/view/parcours-view-collaborator.component';
import { ParcoursListCollaboratorComponent } from './parcours/list/parcours-list-collaborator.component';
import { SectionCreateCollaboratorComponent } from './section/create/section-create-collaborator.component';
import { SectionEditCollaboratorComponent } from './section/edit/section-edit-collaborator.component';
import { SectionViewCollaboratorComponent } from './section/view/section-view-collaborator.component';
import { SectionListCollaboratorComponent } from './section/list/section-list-collaborator.component';
import { CoursCreateCollaboratorComponent } from './cours/create/cours-create-collaborator.component';
import { CoursEditCollaboratorComponent } from './cours/edit/cours-edit-collaborator.component';
import { CoursViewCollaboratorComponent } from './cours/view/cours-view-collaborator.component';
import { CoursListCollaboratorComponent } from './cours/list/cours-list-collaborator.component';

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

    SectionItemCreateCollaboratorComponent,
    SectionItemListCollaboratorComponent,
    SectionItemViewCollaboratorComponent,
    SectionItemEditCollaboratorComponent,
    ExerciceCreateCollaboratorComponent,
    ExerciceListCollaboratorComponent,
    ExerciceViewCollaboratorComponent,
    ExerciceEditCollaboratorComponent,
    ParcoursCreateCollaboratorComponent,
    ParcoursListCollaboratorComponent,
    ParcoursViewCollaboratorComponent,
    ParcoursEditCollaboratorComponent,
    SectionCreateCollaboratorComponent,
    SectionListCollaboratorComponent,
    SectionViewCollaboratorComponent,
    SectionEditCollaboratorComponent,
    CoursCreateCollaboratorComponent,
    CoursListCollaboratorComponent,
    CoursViewCollaboratorComponent,
    CoursEditCollaboratorComponent,
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
  SectionItemCreateCollaboratorComponent,
  SectionItemListCollaboratorComponent,
  SectionItemViewCollaboratorComponent,
  SectionItemEditCollaboratorComponent,
  ExerciceCreateCollaboratorComponent,
  ExerciceListCollaboratorComponent,
  ExerciceViewCollaboratorComponent,
  ExerciceEditCollaboratorComponent,
  ParcoursCreateCollaboratorComponent,
  ParcoursListCollaboratorComponent,
  ParcoursViewCollaboratorComponent,
  ParcoursEditCollaboratorComponent,
  SectionCreateCollaboratorComponent,
  SectionListCollaboratorComponent,
  SectionViewCollaboratorComponent,
  SectionEditCollaboratorComponent,
  CoursCreateCollaboratorComponent,
  CoursListCollaboratorComponent,
  CoursViewCollaboratorComponent,
  CoursEditCollaboratorComponent,
  ],
})
export class CourseCollaboratorModule { }
