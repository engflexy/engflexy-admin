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

import { CategorieSectionCreateCollaboratorComponent } from './categorie-section/create/categorie-section-create-collaborator.component';
import { CategorieSectionEditCollaboratorComponent } from './categorie-section/edit/categorie-section-edit-collaborator.component';
import { CategorieSectionViewCollaboratorComponent } from './categorie-section/view/categorie-section-view-collaborator.component';
import { CategorieSectionListCollaboratorComponent } from './categorie-section/list/categorie-section-list-collaborator.component';
import { ContentTypeCreateCollaboratorComponent } from './content-type/create/content-type-create-collaborator.component';
import { ContentTypeEditCollaboratorComponent } from './content-type/edit/content-type-edit-collaborator.component';
import { ContentTypeViewCollaboratorComponent } from './content-type/view/content-type-view-collaborator.component';
import { ContentTypeListCollaboratorComponent } from './content-type/list/content-type-list-collaborator.component';
import { LevelTestConfigurationCreateCollaboratorComponent } from './level-test-configuration/create/level-test-configuration-create-collaborator.component';
import { LevelTestConfigurationEditCollaboratorComponent } from './level-test-configuration/edit/level-test-configuration-edit-collaborator.component';
import { LevelTestConfigurationViewCollaboratorComponent } from './level-test-configuration/view/level-test-configuration-view-collaborator.component';
import { LevelTestConfigurationListCollaboratorComponent } from './level-test-configuration/list/level-test-configuration-list-collaborator.component';
import { SuperCategorieSectionCreateCollaboratorComponent } from './super-categorie-section/create/super-categorie-section-create-collaborator.component';
import { SuperCategorieSectionEditCollaboratorComponent } from './super-categorie-section/edit/super-categorie-section-edit-collaborator.component';
import { SuperCategorieSectionViewCollaboratorComponent } from './super-categorie-section/view/super-categorie-section-view-collaborator.component';
import { SuperCategorieSectionListCollaboratorComponent } from './super-categorie-section/list/super-categorie-section-list-collaborator.component';
import { EtatCoursCreateCollaboratorComponent } from './etat-cours/create/etat-cours-create-collaborator.component';
import { EtatCoursEditCollaboratorComponent } from './etat-cours/edit/etat-cours-edit-collaborator.component';
import { EtatCoursViewCollaboratorComponent } from './etat-cours/view/etat-cours-view-collaborator.component';
import { EtatCoursListCollaboratorComponent } from './etat-cours/list/etat-cours-list-collaborator.component';

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

    CategorieSectionCreateCollaboratorComponent,
    CategorieSectionListCollaboratorComponent,
    CategorieSectionViewCollaboratorComponent,
    CategorieSectionEditCollaboratorComponent,
    ContentTypeCreateCollaboratorComponent,
    ContentTypeListCollaboratorComponent,
    ContentTypeViewCollaboratorComponent,
    ContentTypeEditCollaboratorComponent,
    LevelTestConfigurationCreateCollaboratorComponent,
    LevelTestConfigurationListCollaboratorComponent,
    LevelTestConfigurationViewCollaboratorComponent,
    LevelTestConfigurationEditCollaboratorComponent,
    SuperCategorieSectionCreateCollaboratorComponent,
    SuperCategorieSectionListCollaboratorComponent,
    SuperCategorieSectionViewCollaboratorComponent,
    SuperCategorieSectionEditCollaboratorComponent,
    EtatCoursCreateCollaboratorComponent,
    EtatCoursListCollaboratorComponent,
    EtatCoursViewCollaboratorComponent,
    EtatCoursEditCollaboratorComponent,
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
  CategorieSectionCreateCollaboratorComponent,
  CategorieSectionListCollaboratorComponent,
  CategorieSectionViewCollaboratorComponent,
  CategorieSectionEditCollaboratorComponent,
  ContentTypeCreateCollaboratorComponent,
  ContentTypeListCollaboratorComponent,
  ContentTypeViewCollaboratorComponent,
  ContentTypeEditCollaboratorComponent,
  LevelTestConfigurationCreateCollaboratorComponent,
  LevelTestConfigurationListCollaboratorComponent,
  LevelTestConfigurationViewCollaboratorComponent,
  LevelTestConfigurationEditCollaboratorComponent,
  SuperCategorieSectionCreateCollaboratorComponent,
  SuperCategorieSectionListCollaboratorComponent,
  SuperCategorieSectionViewCollaboratorComponent,
  SuperCategorieSectionEditCollaboratorComponent,
  EtatCoursCreateCollaboratorComponent,
  EtatCoursListCollaboratorComponent,
  EtatCoursViewCollaboratorComponent,
  EtatCoursEditCollaboratorComponent,
  ],
})
export class CourserefCollaboratorModule { }
