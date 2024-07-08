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

import { FaqEtudiantCreateCollaboratorComponent } from './faq-etudiant/create/faq-etudiant-create-collaborator.component';
import { FaqEtudiantEditCollaboratorComponent } from './faq-etudiant/edit/faq-etudiant-edit-collaborator.component';
import { FaqEtudiantViewCollaboratorComponent } from './faq-etudiant/view/faq-etudiant-view-collaborator.component';
import { FaqEtudiantListCollaboratorComponent } from './faq-etudiant/list/faq-etudiant-list-collaborator.component';
import { FaqTypeCreateCollaboratorComponent } from './faq-type/create/faq-type-create-collaborator.component';
import { FaqTypeEditCollaboratorComponent } from './faq-type/edit/faq-type-edit-collaborator.component';
import { FaqTypeViewCollaboratorComponent } from './faq-type/view/faq-type-view-collaborator.component';
import { FaqTypeListCollaboratorComponent } from './faq-type/list/faq-type-list-collaborator.component';
import { FaqProfCreateCollaboratorComponent } from './faq-prof/create/faq-prof-create-collaborator.component';
import { FaqProfEditCollaboratorComponent } from './faq-prof/edit/faq-prof-edit-collaborator.component';
import { FaqProfViewCollaboratorComponent } from './faq-prof/view/faq-prof-view-collaborator.component';
import { FaqProfListCollaboratorComponent } from './faq-prof/list/faq-prof-list-collaborator.component';
import { FaqCreateCollaboratorComponent } from './faq/create/faq-create-collaborator.component';
import { FaqEditCollaboratorComponent } from './faq/edit/faq-edit-collaborator.component';
import { FaqViewCollaboratorComponent } from './faq/view/faq-view-collaborator.component';
import { FaqListCollaboratorComponent } from './faq/list/faq-list-collaborator.component';

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

    FaqEtudiantCreateCollaboratorComponent,
    FaqEtudiantListCollaboratorComponent,
    FaqEtudiantViewCollaboratorComponent,
    FaqEtudiantEditCollaboratorComponent,
    FaqTypeCreateCollaboratorComponent,
    FaqTypeListCollaboratorComponent,
    FaqTypeViewCollaboratorComponent,
    FaqTypeEditCollaboratorComponent,
    FaqProfCreateCollaboratorComponent,
    FaqProfListCollaboratorComponent,
    FaqProfViewCollaboratorComponent,
    FaqProfEditCollaboratorComponent,
    FaqCreateCollaboratorComponent,
    FaqListCollaboratorComponent,
    FaqViewCollaboratorComponent,
    FaqEditCollaboratorComponent,
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
  FaqEtudiantCreateCollaboratorComponent,
  FaqEtudiantListCollaboratorComponent,
  FaqEtudiantViewCollaboratorComponent,
  FaqEtudiantEditCollaboratorComponent,
  FaqTypeCreateCollaboratorComponent,
  FaqTypeListCollaboratorComponent,
  FaqTypeViewCollaboratorComponent,
  FaqTypeEditCollaboratorComponent,
  FaqProfCreateCollaboratorComponent,
  FaqProfListCollaboratorComponent,
  FaqProfViewCollaboratorComponent,
  FaqProfEditCollaboratorComponent,
  FaqCreateCollaboratorComponent,
  FaqListCollaboratorComponent,
  FaqViewCollaboratorComponent,
  FaqEditCollaboratorComponent,
  ],
})
export class FaqCollaboratorModule { }
