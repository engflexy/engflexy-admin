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

import { TypeReclamationEtudiantCreateCollaboratorComponent } from './type-reclamation-etudiant/create/type-reclamation-etudiant-create-collaborator.component';
import { TypeReclamationEtudiantEditCollaboratorComponent } from './type-reclamation-etudiant/edit/type-reclamation-etudiant-edit-collaborator.component';
import { TypeReclamationEtudiantViewCollaboratorComponent } from './type-reclamation-etudiant/view/type-reclamation-etudiant-view-collaborator.component';
import { TypeReclamationEtudiantListCollaboratorComponent } from './type-reclamation-etudiant/list/type-reclamation-etudiant-list-collaborator.component';
import { RecommendTeacherCreateCollaboratorComponent } from './recommend-teacher/create/recommend-teacher-create-collaborator.component';
import { RecommendTeacherEditCollaboratorComponent } from './recommend-teacher/edit/recommend-teacher-edit-collaborator.component';
import { RecommendTeacherViewCollaboratorComponent } from './recommend-teacher/view/recommend-teacher-view-collaborator.component';
import { RecommendTeacherListCollaboratorComponent } from './recommend-teacher/list/recommend-teacher-list-collaborator.component';
import { ReclamationProfCreateCollaboratorComponent } from './reclamation-prof/create/reclamation-prof-create-collaborator.component';
import { ReclamationProfEditCollaboratorComponent } from './reclamation-prof/edit/reclamation-prof-edit-collaborator.component';
import { ReclamationProfViewCollaboratorComponent } from './reclamation-prof/view/reclamation-prof-view-collaborator.component';
import { ReclamationProfListCollaboratorComponent } from './reclamation-prof/list/reclamation-prof-list-collaborator.component';
import { ReclamationEtudiantCreateCollaboratorComponent } from './reclamation-etudiant/create/reclamation-etudiant-create-collaborator.component';
import { ReclamationEtudiantEditCollaboratorComponent } from './reclamation-etudiant/edit/reclamation-etudiant-edit-collaborator.component';
import { ReclamationEtudiantViewCollaboratorComponent } from './reclamation-etudiant/view/reclamation-etudiant-view-collaborator.component';
import { ReclamationEtudiantListCollaboratorComponent } from './reclamation-etudiant/list/reclamation-etudiant-list-collaborator.component';
import { TypeReclamationProfCreateCollaboratorComponent } from './type-reclamation-prof/create/type-reclamation-prof-create-collaborator.component';
import { TypeReclamationProfEditCollaboratorComponent } from './type-reclamation-prof/edit/type-reclamation-prof-edit-collaborator.component';
import { TypeReclamationProfViewCollaboratorComponent } from './type-reclamation-prof/view/type-reclamation-prof-view-collaborator.component';
import { TypeReclamationProfListCollaboratorComponent } from './type-reclamation-prof/list/type-reclamation-prof-list-collaborator.component';

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

    TypeReclamationEtudiantCreateCollaboratorComponent,
    TypeReclamationEtudiantListCollaboratorComponent,
    TypeReclamationEtudiantViewCollaboratorComponent,
    TypeReclamationEtudiantEditCollaboratorComponent,
    RecommendTeacherCreateCollaboratorComponent,
    RecommendTeacherListCollaboratorComponent,
    RecommendTeacherViewCollaboratorComponent,
    RecommendTeacherEditCollaboratorComponent,
    ReclamationProfCreateCollaboratorComponent,
    ReclamationProfListCollaboratorComponent,
    ReclamationProfViewCollaboratorComponent,
    ReclamationProfEditCollaboratorComponent,
    ReclamationEtudiantCreateCollaboratorComponent,
    ReclamationEtudiantListCollaboratorComponent,
    ReclamationEtudiantViewCollaboratorComponent,
    ReclamationEtudiantEditCollaboratorComponent,
    TypeReclamationProfCreateCollaboratorComponent,
    TypeReclamationProfListCollaboratorComponent,
    TypeReclamationProfViewCollaboratorComponent,
    TypeReclamationProfEditCollaboratorComponent,
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
  TypeReclamationEtudiantCreateCollaboratorComponent,
  TypeReclamationEtudiantListCollaboratorComponent,
  TypeReclamationEtudiantViewCollaboratorComponent,
  TypeReclamationEtudiantEditCollaboratorComponent,
  RecommendTeacherCreateCollaboratorComponent,
  RecommendTeacherListCollaboratorComponent,
  RecommendTeacherViewCollaboratorComponent,
  RecommendTeacherEditCollaboratorComponent,
  ReclamationProfCreateCollaboratorComponent,
  ReclamationProfListCollaboratorComponent,
  ReclamationProfViewCollaboratorComponent,
  ReclamationProfEditCollaboratorComponent,
  ReclamationEtudiantCreateCollaboratorComponent,
  ReclamationEtudiantListCollaboratorComponent,
  ReclamationEtudiantViewCollaboratorComponent,
  ReclamationEtudiantEditCollaboratorComponent,
  TypeReclamationProfCreateCollaboratorComponent,
  TypeReclamationProfListCollaboratorComponent,
  TypeReclamationProfViewCollaboratorComponent,
  TypeReclamationProfEditCollaboratorComponent,
  ],
})
export class RecomreclaCollaboratorModule { }
