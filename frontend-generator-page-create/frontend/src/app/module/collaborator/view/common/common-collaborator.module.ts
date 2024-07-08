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

import { NewsCreateCollaboratorComponent } from './news/create/news-create-collaborator.component';
import { NewsEditCollaboratorComponent } from './news/edit/news-edit-collaborator.component';
import { NewsViewCollaboratorComponent } from './news/view/news-view-collaborator.component';
import { NewsListCollaboratorComponent } from './news/list/news-list-collaborator.component';
import { ClassAverageBonusCreateCollaboratorComponent } from './class-average-bonus/create/class-average-bonus-create-collaborator.component';
import { ClassAverageBonusEditCollaboratorComponent } from './class-average-bonus/edit/class-average-bonus-edit-collaborator.component';
import { ClassAverageBonusViewCollaboratorComponent } from './class-average-bonus/view/class-average-bonus-view-collaborator.component';
import { ClassAverageBonusListCollaboratorComponent } from './class-average-bonus/list/class-average-bonus-list-collaborator.component';
import { ContactCreateCollaboratorComponent } from './contact/create/contact-create-collaborator.component';
import { ContactEditCollaboratorComponent } from './contact/edit/contact-edit-collaborator.component';
import { ContactViewCollaboratorComponent } from './contact/view/contact-view-collaborator.component';
import { ContactListCollaboratorComponent } from './contact/list/contact-list-collaborator.component';

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

    NewsCreateCollaboratorComponent,
    NewsListCollaboratorComponent,
    NewsViewCollaboratorComponent,
    NewsEditCollaboratorComponent,
    ClassAverageBonusCreateCollaboratorComponent,
    ClassAverageBonusListCollaboratorComponent,
    ClassAverageBonusViewCollaboratorComponent,
    ClassAverageBonusEditCollaboratorComponent,
    ContactCreateCollaboratorComponent,
    ContactListCollaboratorComponent,
    ContactViewCollaboratorComponent,
    ContactEditCollaboratorComponent,
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
  NewsCreateCollaboratorComponent,
  NewsListCollaboratorComponent,
  NewsViewCollaboratorComponent,
  NewsEditCollaboratorComponent,
  ClassAverageBonusCreateCollaboratorComponent,
  ClassAverageBonusListCollaboratorComponent,
  ClassAverageBonusViewCollaboratorComponent,
  ClassAverageBonusEditCollaboratorComponent,
  ContactCreateCollaboratorComponent,
  ContactListCollaboratorComponent,
  ContactViewCollaboratorComponent,
  ContactEditCollaboratorComponent,
  ],
})
export class CommonCollaboratorModule { }
