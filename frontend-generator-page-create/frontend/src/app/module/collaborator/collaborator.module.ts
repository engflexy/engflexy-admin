import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import {ToastModule} from 'primeng/toast';
import {ToolbarModule} from 'primeng/toolbar';
import {TableModule} from 'primeng/table';
import {DropdownModule} from 'primeng/dropdown';
import {InputSwitchModule} from 'primeng/inputswitch';
import {InputTextareaModule} from 'primeng/inputtextarea';

import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { DialogModule } from 'primeng/dialog';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {CalendarModule} from 'primeng/calendar';
import {PanelModule} from 'primeng/panel';
import {InputNumberModule} from 'primeng/inputnumber';
import {BadgeModule} from 'primeng/badge';
import { MultiSelectModule } from 'primeng/multiselect';

import { PasswordModule } from 'primeng/password';
import { InputTextModule } from 'primeng/inputtext';
import {ButtonModule} from 'primeng/button';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {RouterModule} from '@angular/router';
import {TabViewModule} from 'primeng/tabview';
import { SplitButtonModule } from 'primeng/splitbutton';
import { MessageModule } from 'primeng/message';
import {MessagesModule} from 'primeng/messages';

import { LoginCollaboratorComponent } from './login-collaborator/login-collaborator.component';
import { RegisterCollaboratorComponent } from './register-collaborator/register-collaborator.component';
import { ChangePasswordCollaboratorComponent } from './change-password-collaborator/change-password-collaborator.component';


import { QuizCollaboratorModule } from './view/quiz/quiz-collaborator.module';
import { QuizCollaboratorRoutingModule } from './view/quiz/quiz-collaborator-routing.module';
import { RecomreclaCollaboratorModule } from './view/recomrecla/recomrecla-collaborator.module';
import { RecomreclaCollaboratorRoutingModule } from './view/recomrecla/recomrecla-collaborator-routing.module';
import { PaiementCollaboratorModule } from './view/paiement/paiement-collaborator.module';
import { PaiementCollaboratorRoutingModule } from './view/paiement/paiement-collaborator-routing.module';
import { InscriptionrefCollaboratorModule } from './view/inscriptionref/inscriptionref-collaborator.module';
import { InscriptionrefCollaboratorRoutingModule } from './view/inscriptionref/inscriptionref-collaborator-routing.module';
import { CourserefCollaboratorModule } from './view/courseref/courseref-collaborator.module';
import { CourserefCollaboratorRoutingModule } from './view/courseref/courseref-collaborator-routing.module';
import { LearningCollaboratorModule } from './view/learning/learning-collaborator.module';
import { LearningCollaboratorRoutingModule } from './view/learning/learning-collaborator-routing.module';
import { ProfCollaboratorModule } from './view/prof/prof-collaborator.module';
import { ProfCollaboratorRoutingModule } from './view/prof/prof-collaborator-routing.module';
import { PackCollaboratorModule } from './view/pack/pack-collaborator.module';
import { PackCollaboratorRoutingModule } from './view/pack/pack-collaborator-routing.module';
import { SalaryCollaboratorModule } from './view/salary/salary-collaborator.module';
import { SalaryCollaboratorRoutingModule } from './view/salary/salary-collaborator-routing.module';
import { GrpeCollaboratorModule } from './view/grpe/grpe-collaborator.module';
import { GrpeCollaboratorRoutingModule } from './view/grpe/grpe-collaborator-routing.module';
import { FaqCollaboratorModule } from './view/faq/faq-collaborator.module';
import { FaqCollaboratorRoutingModule } from './view/faq/faq-collaborator-routing.module';
import { CommonCollaboratorModule } from './view/common/common-collaborator.module';
import { CommonCollaboratorRoutingModule } from './view/common/common-collaborator-routing.module';
import { InscriptionCollaboratorModule } from './view/inscription/inscription-collaborator.module';
import { InscriptionCollaboratorRoutingModule } from './view/inscription/inscription-collaborator-routing.module';
import { PriceCollaboratorModule } from './view/price/price-collaborator.module';
import { PriceCollaboratorRoutingModule } from './view/price/price-collaborator-routing.module';
import { VocabCollaboratorModule } from './view/vocab/vocab-collaborator.module';
import { VocabCollaboratorRoutingModule } from './view/vocab/vocab-collaborator-routing.module';
import { CourseCollaboratorModule } from './view/course/course-collaborator.module';
import { CourseCollaboratorRoutingModule } from './view/course/course-collaborator-routing.module';
import { FreetrialCollaboratorModule } from './view/freetrial/freetrial-collaborator.module';
import { FreetrialCollaboratorRoutingModule } from './view/freetrial/freetrial-collaborator-routing.module';
import { ReviewCollaboratorModule } from './view/review/review-collaborator.module';
import { ReviewCollaboratorRoutingModule } from './view/review/review-collaborator-routing.module';
import { HomeworkCollaboratorModule } from './view/homework/homework-collaborator.module';
import { HomeworkCollaboratorRoutingModule } from './view/homework/homework-collaborator-routing.module';
import { QuizrefCollaboratorModule } from './view/quizref/quizref-collaborator.module';
import { QuizrefCollaboratorRoutingModule } from './view/quizref/quizref-collaborator-routing.module';
import { QuizetudiantCollaboratorModule } from './view/quizetudiant/quizetudiant-collaborator.module';
import { QuizetudiantCollaboratorRoutingModule } from './view/quizetudiant/quizetudiant-collaborator-routing.module';

import {SecurityModule} from 'src/app/module/security/security.module';
import {SecurityRoutingModule} from 'src/app/module/security/security-routing.module';


@NgModule({
  declarations: [
   LoginCollaboratorComponent,
   RegisterCollaboratorComponent,
   ChangePasswordCollaboratorComponent
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
  QuizCollaboratorModule,
  QuizCollaboratorRoutingModule,
  RecomreclaCollaboratorModule,
  RecomreclaCollaboratorRoutingModule,
  PaiementCollaboratorModule,
  PaiementCollaboratorRoutingModule,
  InscriptionrefCollaboratorModule,
  InscriptionrefCollaboratorRoutingModule,
  CourserefCollaboratorModule,
  CourserefCollaboratorRoutingModule,
  LearningCollaboratorModule,
  LearningCollaboratorRoutingModule,
  ProfCollaboratorModule,
  ProfCollaboratorRoutingModule,
  PackCollaboratorModule,
  PackCollaboratorRoutingModule,
  SalaryCollaboratorModule,
  SalaryCollaboratorRoutingModule,
  GrpeCollaboratorModule,
  GrpeCollaboratorRoutingModule,
  FaqCollaboratorModule,
  FaqCollaboratorRoutingModule,
  CommonCollaboratorModule,
  CommonCollaboratorRoutingModule,
  InscriptionCollaboratorModule,
  InscriptionCollaboratorRoutingModule,
  PriceCollaboratorModule,
  PriceCollaboratorRoutingModule,
  VocabCollaboratorModule,
  VocabCollaboratorRoutingModule,
  CourseCollaboratorModule,
  CourseCollaboratorRoutingModule,
  FreetrialCollaboratorModule,
  FreetrialCollaboratorRoutingModule,
  ReviewCollaboratorModule,
  ReviewCollaboratorRoutingModule,
  HomeworkCollaboratorModule,
  HomeworkCollaboratorRoutingModule,
  QuizrefCollaboratorModule,
  QuizrefCollaboratorRoutingModule,
  QuizetudiantCollaboratorModule,
  QuizetudiantCollaboratorRoutingModule,
  SecurityModule,
  SecurityRoutingModule
  ],
  exports: [
  LoginCollaboratorComponent,
  RegisterCollaboratorComponent,

    QuizCollaboratorModule,
    RecomreclaCollaboratorModule,
    PaiementCollaboratorModule,
    InscriptionrefCollaboratorModule,
    CourserefCollaboratorModule,
    LearningCollaboratorModule,
    ProfCollaboratorModule,
    PackCollaboratorModule,
    SalaryCollaboratorModule,
    GrpeCollaboratorModule,
    FaqCollaboratorModule,
    CommonCollaboratorModule,
    InscriptionCollaboratorModule,
    PriceCollaboratorModule,
    VocabCollaboratorModule,
    CourseCollaboratorModule,
    FreetrialCollaboratorModule,
    ReviewCollaboratorModule,
    HomeworkCollaboratorModule,
    QuizrefCollaboratorModule,
    QuizetudiantCollaboratorModule,
  SecurityModule
  ],

})
export class CollaboratorModule { }
