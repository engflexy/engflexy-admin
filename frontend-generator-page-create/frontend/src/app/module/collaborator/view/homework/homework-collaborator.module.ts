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

import { HomeWorkEtudiantCreateCollaboratorComponent } from './home-work-etudiant/create/home-work-etudiant-create-collaborator.component';
import { HomeWorkEtudiantEditCollaboratorComponent } from './home-work-etudiant/edit/home-work-etudiant-edit-collaborator.component';
import { HomeWorkEtudiantViewCollaboratorComponent } from './home-work-etudiant/view/home-work-etudiant-view-collaborator.component';
import { HomeWorkEtudiantListCollaboratorComponent } from './home-work-etudiant/list/home-work-etudiant-list-collaborator.component';
import { HomeWorkQuestionCreateCollaboratorComponent } from './home-work-question/create/home-work-question-create-collaborator.component';
import { HomeWorkQuestionEditCollaboratorComponent } from './home-work-question/edit/home-work-question-edit-collaborator.component';
import { HomeWorkQuestionViewCollaboratorComponent } from './home-work-question/view/home-work-question-view-collaborator.component';
import { HomeWorkQuestionListCollaboratorComponent } from './home-work-question/list/home-work-question-list-collaborator.component';
import { HoweWorkQSTReponseCreateCollaboratorComponent } from './howe-work-q-s-t-reponse/create/howe-work-q-s-t-reponse-create-collaborator.component';
import { HoweWorkQSTReponseEditCollaboratorComponent } from './howe-work-q-s-t-reponse/edit/howe-work-q-s-t-reponse-edit-collaborator.component';
import { HoweWorkQSTReponseViewCollaboratorComponent } from './howe-work-q-s-t-reponse/view/howe-work-q-s-t-reponse-view-collaborator.component';
import { HoweWorkQSTReponseListCollaboratorComponent } from './howe-work-q-s-t-reponse/list/howe-work-q-s-t-reponse-list-collaborator.component';
import { TypeHomeWorkCreateCollaboratorComponent } from './type-home-work/create/type-home-work-create-collaborator.component';
import { TypeHomeWorkEditCollaboratorComponent } from './type-home-work/edit/type-home-work-edit-collaborator.component';
import { TypeHomeWorkViewCollaboratorComponent } from './type-home-work/view/type-home-work-view-collaborator.component';
import { TypeHomeWorkListCollaboratorComponent } from './type-home-work/list/type-home-work-list-collaborator.component';
import { ReponseEtudiantHomeWorkCreateCollaboratorComponent } from './reponse-etudiant-home-work/create/reponse-etudiant-home-work-create-collaborator.component';
import { ReponseEtudiantHomeWorkEditCollaboratorComponent } from './reponse-etudiant-home-work/edit/reponse-etudiant-home-work-edit-collaborator.component';
import { ReponseEtudiantHomeWorkViewCollaboratorComponent } from './reponse-etudiant-home-work/view/reponse-etudiant-home-work-view-collaborator.component';
import { ReponseEtudiantHomeWorkListCollaboratorComponent } from './reponse-etudiant-home-work/list/reponse-etudiant-home-work-list-collaborator.component';
import { HomeWorkCreateCollaboratorComponent } from './home-work/create/home-work-create-collaborator.component';
import { HomeWorkEditCollaboratorComponent } from './home-work/edit/home-work-edit-collaborator.component';
import { HomeWorkViewCollaboratorComponent } from './home-work/view/home-work-view-collaborator.component';
import { HomeWorkListCollaboratorComponent } from './home-work/list/home-work-list-collaborator.component';

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

    HomeWorkEtudiantCreateCollaboratorComponent,
    HomeWorkEtudiantListCollaboratorComponent,
    HomeWorkEtudiantViewCollaboratorComponent,
    HomeWorkEtudiantEditCollaboratorComponent,
    HomeWorkQuestionCreateCollaboratorComponent,
    HomeWorkQuestionListCollaboratorComponent,
    HomeWorkQuestionViewCollaboratorComponent,
    HomeWorkQuestionEditCollaboratorComponent,
    HoweWorkQSTReponseCreateCollaboratorComponent,
    HoweWorkQSTReponseListCollaboratorComponent,
    HoweWorkQSTReponseViewCollaboratorComponent,
    HoweWorkQSTReponseEditCollaboratorComponent,
    TypeHomeWorkCreateCollaboratorComponent,
    TypeHomeWorkListCollaboratorComponent,
    TypeHomeWorkViewCollaboratorComponent,
    TypeHomeWorkEditCollaboratorComponent,
    ReponseEtudiantHomeWorkCreateCollaboratorComponent,
    ReponseEtudiantHomeWorkListCollaboratorComponent,
    ReponseEtudiantHomeWorkViewCollaboratorComponent,
    ReponseEtudiantHomeWorkEditCollaboratorComponent,
    HomeWorkCreateCollaboratorComponent,
    HomeWorkListCollaboratorComponent,
    HomeWorkViewCollaboratorComponent,
    HomeWorkEditCollaboratorComponent,
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
  HomeWorkEtudiantCreateCollaboratorComponent,
  HomeWorkEtudiantListCollaboratorComponent,
  HomeWorkEtudiantViewCollaboratorComponent,
  HomeWorkEtudiantEditCollaboratorComponent,
  HomeWorkQuestionCreateCollaboratorComponent,
  HomeWorkQuestionListCollaboratorComponent,
  HomeWorkQuestionViewCollaboratorComponent,
  HomeWorkQuestionEditCollaboratorComponent,
  HoweWorkQSTReponseCreateCollaboratorComponent,
  HoweWorkQSTReponseListCollaboratorComponent,
  HoweWorkQSTReponseViewCollaboratorComponent,
  HoweWorkQSTReponseEditCollaboratorComponent,
  TypeHomeWorkCreateCollaboratorComponent,
  TypeHomeWorkListCollaboratorComponent,
  TypeHomeWorkViewCollaboratorComponent,
  TypeHomeWorkEditCollaboratorComponent,
  ReponseEtudiantHomeWorkCreateCollaboratorComponent,
  ReponseEtudiantHomeWorkListCollaboratorComponent,
  ReponseEtudiantHomeWorkViewCollaboratorComponent,
  ReponseEtudiantHomeWorkEditCollaboratorComponent,
  HomeWorkCreateCollaboratorComponent,
  HomeWorkListCollaboratorComponent,
  HomeWorkViewCollaboratorComponent,
  HomeWorkEditCollaboratorComponent,
  ],
})
export class HomeworkCollaboratorModule { }
