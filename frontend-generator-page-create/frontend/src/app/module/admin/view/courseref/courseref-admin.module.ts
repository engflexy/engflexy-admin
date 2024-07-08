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

import { CategorieSectionCreateAdminComponent } from './categorie-section/create/categorie-section-create-admin.component';
import { CategorieSectionEditAdminComponent } from './categorie-section/edit/categorie-section-edit-admin.component';
import { CategorieSectionViewAdminComponent } from './categorie-section/view/categorie-section-view-admin.component';
import { CategorieSectionListAdminComponent } from './categorie-section/list/categorie-section-list-admin.component';
import { ContentTypeCreateAdminComponent } from './content-type/create/content-type-create-admin.component';
import { ContentTypeEditAdminComponent } from './content-type/edit/content-type-edit-admin.component';
import { ContentTypeViewAdminComponent } from './content-type/view/content-type-view-admin.component';
import { ContentTypeListAdminComponent } from './content-type/list/content-type-list-admin.component';
import { LevelTestConfigurationCreateAdminComponent } from './level-test-configuration/create/level-test-configuration-create-admin.component';
import { LevelTestConfigurationEditAdminComponent } from './level-test-configuration/edit/level-test-configuration-edit-admin.component';
import { LevelTestConfigurationViewAdminComponent } from './level-test-configuration/view/level-test-configuration-view-admin.component';
import { LevelTestConfigurationListAdminComponent } from './level-test-configuration/list/level-test-configuration-list-admin.component';
import { SuperCategorieSectionCreateAdminComponent } from './super-categorie-section/create/super-categorie-section-create-admin.component';
import { SuperCategorieSectionEditAdminComponent } from './super-categorie-section/edit/super-categorie-section-edit-admin.component';
import { SuperCategorieSectionViewAdminComponent } from './super-categorie-section/view/super-categorie-section-view-admin.component';
import { SuperCategorieSectionListAdminComponent } from './super-categorie-section/list/super-categorie-section-list-admin.component';
import { EtatCoursCreateAdminComponent } from './etat-cours/create/etat-cours-create-admin.component';
import { EtatCoursEditAdminComponent } from './etat-cours/edit/etat-cours-edit-admin.component';
import { EtatCoursViewAdminComponent } from './etat-cours/view/etat-cours-view-admin.component';
import { EtatCoursListAdminComponent } from './etat-cours/list/etat-cours-list-admin.component';

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

    CategorieSectionCreateAdminComponent,
    CategorieSectionListAdminComponent,
    CategorieSectionViewAdminComponent,
    CategorieSectionEditAdminComponent,
    ContentTypeCreateAdminComponent,
    ContentTypeListAdminComponent,
    ContentTypeViewAdminComponent,
    ContentTypeEditAdminComponent,
    LevelTestConfigurationCreateAdminComponent,
    LevelTestConfigurationListAdminComponent,
    LevelTestConfigurationViewAdminComponent,
    LevelTestConfigurationEditAdminComponent,
    SuperCategorieSectionCreateAdminComponent,
    SuperCategorieSectionListAdminComponent,
    SuperCategorieSectionViewAdminComponent,
    SuperCategorieSectionEditAdminComponent,
    EtatCoursCreateAdminComponent,
    EtatCoursListAdminComponent,
    EtatCoursViewAdminComponent,
    EtatCoursEditAdminComponent,
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
  CategorieSectionCreateAdminComponent,
  CategorieSectionListAdminComponent,
  CategorieSectionViewAdminComponent,
  CategorieSectionEditAdminComponent,
  ContentTypeCreateAdminComponent,
  ContentTypeListAdminComponent,
  ContentTypeViewAdminComponent,
  ContentTypeEditAdminComponent,
  LevelTestConfigurationCreateAdminComponent,
  LevelTestConfigurationListAdminComponent,
  LevelTestConfigurationViewAdminComponent,
  LevelTestConfigurationEditAdminComponent,
  SuperCategorieSectionCreateAdminComponent,
  SuperCategorieSectionListAdminComponent,
  SuperCategorieSectionViewAdminComponent,
  SuperCategorieSectionEditAdminComponent,
  EtatCoursCreateAdminComponent,
  EtatCoursListAdminComponent,
  EtatCoursViewAdminComponent,
  EtatCoursEditAdminComponent,
  ],
})
export class CourserefAdminModule { }
