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

import { ReponseEtudiantCreateCollaboratorComponent } from './reponse-etudiant/create/reponse-etudiant-create-collaborator.component';
import { ReponseEtudiantEditCollaboratorComponent } from './reponse-etudiant/edit/reponse-etudiant-edit-collaborator.component';
import { ReponseEtudiantViewCollaboratorComponent } from './reponse-etudiant/view/reponse-etudiant-view-collaborator.component';
import { ReponseEtudiantListCollaboratorComponent } from './reponse-etudiant/list/reponse-etudiant-list-collaborator.component';
import { QuizEtudiantCreateCollaboratorComponent } from './quiz-etudiant/create/quiz-etudiant-create-collaborator.component';
import { QuizEtudiantEditCollaboratorComponent } from './quiz-etudiant/edit/quiz-etudiant-edit-collaborator.component';
import { QuizEtudiantViewCollaboratorComponent } from './quiz-etudiant/view/quiz-etudiant-view-collaborator.component';
import { QuizEtudiantListCollaboratorComponent } from './quiz-etudiant/list/quiz-etudiant-list-collaborator.component';

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

    ReponseEtudiantCreateCollaboratorComponent,
    ReponseEtudiantListCollaboratorComponent,
    ReponseEtudiantViewCollaboratorComponent,
    ReponseEtudiantEditCollaboratorComponent,
    QuizEtudiantCreateCollaboratorComponent,
    QuizEtudiantListCollaboratorComponent,
    QuizEtudiantViewCollaboratorComponent,
    QuizEtudiantEditCollaboratorComponent,
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
  ReponseEtudiantCreateCollaboratorComponent,
  ReponseEtudiantListCollaboratorComponent,
  ReponseEtudiantViewCollaboratorComponent,
  ReponseEtudiantEditCollaboratorComponent,
  QuizEtudiantCreateCollaboratorComponent,
  QuizEtudiantListCollaboratorComponent,
  QuizEtudiantViewCollaboratorComponent,
  QuizEtudiantEditCollaboratorComponent,
  ],
})
export class QuizetudiantCollaboratorModule { }
