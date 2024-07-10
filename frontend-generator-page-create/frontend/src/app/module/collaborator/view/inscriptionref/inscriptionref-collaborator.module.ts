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

import { StatutSocialCreateCollaboratorComponent } from './statut-social/create/statut-social-create-collaborator.component';
import { StatutSocialEditCollaboratorComponent } from './statut-social/edit/statut-social-edit-collaborator.component';
import { StatutSocialViewCollaboratorComponent } from './statut-social/view/statut-social-view-collaborator.component';
import { StatutSocialListCollaboratorComponent } from './statut-social/list/statut-social-list-collaborator.component';
import { SkillCreateCollaboratorComponent } from './skill/create/skill-create-collaborator.component';
import { SkillEditCollaboratorComponent } from './skill/edit/skill-edit-collaborator.component';
import { SkillViewCollaboratorComponent } from './skill/view/skill-view-collaborator.component';
import { SkillListCollaboratorComponent } from './skill/list/skill-list-collaborator.component';
import { InteretEtudiantCreateCollaboratorComponent } from './interet-etudiant/create/interet-etudiant-create-collaborator.component';
import { InteretEtudiantEditCollaboratorComponent } from './interet-etudiant/edit/interet-etudiant-edit-collaborator.component';
import { InteretEtudiantViewCollaboratorComponent } from './interet-etudiant/view/interet-etudiant-view-collaborator.component';
import { InteretEtudiantListCollaboratorComponent } from './interet-etudiant/list/interet-etudiant-list-collaborator.component';
import { LangueCreateCollaboratorComponent } from './langue/create/langue-create-collaborator.component';
import { LangueEditCollaboratorComponent } from './langue/edit/langue-edit-collaborator.component';
import { LangueViewCollaboratorComponent } from './langue/view/langue-view-collaborator.component';
import { LangueListCollaboratorComponent } from './langue/list/langue-list-collaborator.component';
import { EtatInscriptionCreateCollaboratorComponent } from './etat-inscription/create/etat-inscription-create-collaborator.component';
import { EtatInscriptionEditCollaboratorComponent } from './etat-inscription/edit/etat-inscription-edit-collaborator.component';
import { EtatInscriptionViewCollaboratorComponent } from './etat-inscription/view/etat-inscription-view-collaborator.component';
import { EtatInscriptionListCollaboratorComponent } from './etat-inscription/list/etat-inscription-list-collaborator.component';
import { InviteStudentCreateCollaboratorComponent } from './invite-student/create/invite-student-create-collaborator.component';
import { InviteStudentEditCollaboratorComponent } from './invite-student/edit/invite-student-edit-collaborator.component';
import { InviteStudentViewCollaboratorComponent } from './invite-student/view/invite-student-view-collaborator.component';
import { InviteStudentListCollaboratorComponent } from './invite-student/list/invite-student-list-collaborator.component';
import { TeacherLocalityCreateCollaboratorComponent } from './teacher-locality/create/teacher-locality-create-collaborator.component';
import { TeacherLocalityEditCollaboratorComponent } from './teacher-locality/edit/teacher-locality-edit-collaborator.component';
import { TeacherLocalityViewCollaboratorComponent } from './teacher-locality/view/teacher-locality-view-collaborator.component';
import { TeacherLocalityListCollaboratorComponent } from './teacher-locality/list/teacher-locality-list-collaborator.component';
import { EtudiantReviewCreateCollaboratorComponent } from './etudiant-review/create/etudiant-review-create-collaborator.component';
import { EtudiantReviewEditCollaboratorComponent } from './etudiant-review/edit/etudiant-review-edit-collaborator.component';
import { EtudiantReviewViewCollaboratorComponent } from './etudiant-review/view/etudiant-review-view-collaborator.component';
import { EtudiantReviewListCollaboratorComponent } from './etudiant-review/list/etudiant-review-list-collaborator.component';
import { FonctionCreateCollaboratorComponent } from './fonction/create/fonction-create-collaborator.component';
import { FonctionEditCollaboratorComponent } from './fonction/edit/fonction-edit-collaborator.component';
import { FonctionViewCollaboratorComponent } from './fonction/view/fonction-view-collaborator.component';
import { FonctionListCollaboratorComponent } from './fonction/list/fonction-list-collaborator.component';
import { NiveauEtudeCreateCollaboratorComponent } from './niveau-etude/create/niveau-etude-create-collaborator.component';
import { NiveauEtudeEditCollaboratorComponent } from './niveau-etude/edit/niveau-etude-edit-collaborator.component';
import { NiveauEtudeViewCollaboratorComponent } from './niveau-etude/view/niveau-etude-view-collaborator.component';
import { NiveauEtudeListCollaboratorComponent } from './niveau-etude/list/niveau-etude-list-collaborator.component';
import { ConfirmationTokenCreateCollaboratorComponent } from './confirmation-token/create/confirmation-token-create-collaborator.component';
import { ConfirmationTokenEditCollaboratorComponent } from './confirmation-token/edit/confirmation-token-edit-collaborator.component';
import { ConfirmationTokenViewCollaboratorComponent } from './confirmation-token/view/confirmation-token-view-collaborator.component';
import { ConfirmationTokenListCollaboratorComponent } from './confirmation-token/list/confirmation-token-list-collaborator.component';

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

    StatutSocialCreateCollaboratorComponent,
    StatutSocialListCollaboratorComponent,
    StatutSocialViewCollaboratorComponent,
    StatutSocialEditCollaboratorComponent,
    SkillCreateCollaboratorComponent,
    SkillListCollaboratorComponent,
    SkillViewCollaboratorComponent,
    SkillEditCollaboratorComponent,
    InteretEtudiantCreateCollaboratorComponent,
    InteretEtudiantListCollaboratorComponent,
    InteretEtudiantViewCollaboratorComponent,
    InteretEtudiantEditCollaboratorComponent,
    LangueCreateCollaboratorComponent,
    LangueListCollaboratorComponent,
    LangueViewCollaboratorComponent,
    LangueEditCollaboratorComponent,
    EtatInscriptionCreateCollaboratorComponent,
    EtatInscriptionListCollaboratorComponent,
    EtatInscriptionViewCollaboratorComponent,
    EtatInscriptionEditCollaboratorComponent,
    InviteStudentCreateCollaboratorComponent,
    InviteStudentListCollaboratorComponent,
    InviteStudentViewCollaboratorComponent,
    InviteStudentEditCollaboratorComponent,
    TeacherLocalityCreateCollaboratorComponent,
    TeacherLocalityListCollaboratorComponent,
    TeacherLocalityViewCollaboratorComponent,
    TeacherLocalityEditCollaboratorComponent,
    EtudiantReviewCreateCollaboratorComponent,
    EtudiantReviewListCollaboratorComponent,
    EtudiantReviewViewCollaboratorComponent,
    EtudiantReviewEditCollaboratorComponent,
    FonctionCreateCollaboratorComponent,
    FonctionListCollaboratorComponent,
    FonctionViewCollaboratorComponent,
    FonctionEditCollaboratorComponent,
    NiveauEtudeCreateCollaboratorComponent,
    NiveauEtudeListCollaboratorComponent,
    NiveauEtudeViewCollaboratorComponent,
    NiveauEtudeEditCollaboratorComponent,
    ConfirmationTokenCreateCollaboratorComponent,
    ConfirmationTokenListCollaboratorComponent,
    ConfirmationTokenViewCollaboratorComponent,
    ConfirmationTokenEditCollaboratorComponent,
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
  StatutSocialCreateCollaboratorComponent,
  StatutSocialListCollaboratorComponent,
  StatutSocialViewCollaboratorComponent,
  StatutSocialEditCollaboratorComponent,
  SkillCreateCollaboratorComponent,
  SkillListCollaboratorComponent,
  SkillViewCollaboratorComponent,
  SkillEditCollaboratorComponent,
  InteretEtudiantCreateCollaboratorComponent,
  InteretEtudiantListCollaboratorComponent,
  InteretEtudiantViewCollaboratorComponent,
  InteretEtudiantEditCollaboratorComponent,
  LangueCreateCollaboratorComponent,
  LangueListCollaboratorComponent,
  LangueViewCollaboratorComponent,
  LangueEditCollaboratorComponent,
  EtatInscriptionCreateCollaboratorComponent,
  EtatInscriptionListCollaboratorComponent,
  EtatInscriptionViewCollaboratorComponent,
  EtatInscriptionEditCollaboratorComponent,
  InviteStudentCreateCollaboratorComponent,
  InviteStudentListCollaboratorComponent,
  InviteStudentViewCollaboratorComponent,
  InviteStudentEditCollaboratorComponent,
  TeacherLocalityCreateCollaboratorComponent,
  TeacherLocalityListCollaboratorComponent,
  TeacherLocalityViewCollaboratorComponent,
  TeacherLocalityEditCollaboratorComponent,
  EtudiantReviewCreateCollaboratorComponent,
  EtudiantReviewListCollaboratorComponent,
  EtudiantReviewViewCollaboratorComponent,
  EtudiantReviewEditCollaboratorComponent,
  FonctionCreateCollaboratorComponent,
  FonctionListCollaboratorComponent,
  FonctionViewCollaboratorComponent,
  FonctionEditCollaboratorComponent,
  NiveauEtudeCreateCollaboratorComponent,
  NiveauEtudeListCollaboratorComponent,
  NiveauEtudeViewCollaboratorComponent,
  NiveauEtudeEditCollaboratorComponent,
  ConfirmationTokenCreateCollaboratorComponent,
  ConfirmationTokenListCollaboratorComponent,
  ConfirmationTokenViewCollaboratorComponent,
  ConfirmationTokenEditCollaboratorComponent,
  ],
})
export class InscriptionrefCollaboratorModule { }
