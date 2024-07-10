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

import { EtudiantCreateCollaboratorComponent } from './etudiant/create/etudiant-create-collaborator.component';
import { EtudiantEditCollaboratorComponent } from './etudiant/edit/etudiant-edit-collaborator.component';
import { EtudiantViewCollaboratorComponent } from './etudiant/view/etudiant-view-collaborator.component';
import { EtudiantListCollaboratorComponent } from './etudiant/list/etudiant-list-collaborator.component';
import { DictionaryCreateCollaboratorComponent } from './dictionary/create/dictionary-create-collaborator.component';
import { DictionaryEditCollaboratorComponent } from './dictionary/edit/dictionary-edit-collaborator.component';
import { DictionaryViewCollaboratorComponent } from './dictionary/view/dictionary-view-collaborator.component';
import { DictionaryListCollaboratorComponent } from './dictionary/list/dictionary-list-collaborator.component';

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

    EtudiantCreateCollaboratorComponent,
    EtudiantListCollaboratorComponent,
    EtudiantViewCollaboratorComponent,
    EtudiantEditCollaboratorComponent,
    DictionaryCreateCollaboratorComponent,
    DictionaryListCollaboratorComponent,
    DictionaryViewCollaboratorComponent,
    DictionaryEditCollaboratorComponent,
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
  EtudiantCreateCollaboratorComponent,
  EtudiantListCollaboratorComponent,
  EtudiantViewCollaboratorComponent,
  EtudiantEditCollaboratorComponent,
  DictionaryCreateCollaboratorComponent,
  DictionaryListCollaboratorComponent,
  DictionaryViewCollaboratorComponent,
  DictionaryEditCollaboratorComponent,
  ],
})
export class InscriptionCollaboratorModule { }
