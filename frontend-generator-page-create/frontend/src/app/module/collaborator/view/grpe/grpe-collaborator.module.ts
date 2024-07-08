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

import { GroupeEtatCreateCollaboratorComponent } from './groupe-etat/create/groupe-etat-create-collaborator.component';
import { GroupeEtatEditCollaboratorComponent } from './groupe-etat/edit/groupe-etat-edit-collaborator.component';
import { GroupeEtatViewCollaboratorComponent } from './groupe-etat/view/groupe-etat-view-collaborator.component';
import { GroupeEtatListCollaboratorComponent } from './groupe-etat/list/groupe-etat-list-collaborator.component';
import { InscriptionCreateCollaboratorComponent } from './inscription/create/inscription-create-collaborator.component';
import { InscriptionEditCollaboratorComponent } from './inscription/edit/inscription-edit-collaborator.component';
import { InscriptionViewCollaboratorComponent } from './inscription/view/inscription-view-collaborator.component';
import { InscriptionListCollaboratorComponent } from './inscription/list/inscription-list-collaborator.component';
import { GroupeTypeCreateCollaboratorComponent } from './groupe-type/create/groupe-type-create-collaborator.component';
import { GroupeTypeEditCollaboratorComponent } from './groupe-type/edit/groupe-type-edit-collaborator.component';
import { GroupeTypeViewCollaboratorComponent } from './groupe-type/view/groupe-type-view-collaborator.component';
import { GroupeTypeListCollaboratorComponent } from './groupe-type/list/groupe-type-list-collaborator.component';
import { GroupeEtudeCreateCollaboratorComponent } from './groupe-etude/create/groupe-etude-create-collaborator.component';
import { GroupeEtudeEditCollaboratorComponent } from './groupe-etude/edit/groupe-etude-edit-collaborator.component';
import { GroupeEtudeViewCollaboratorComponent } from './groupe-etude/view/groupe-etude-view-collaborator.component';
import { GroupeEtudeListCollaboratorComponent } from './groupe-etude/list/groupe-etude-list-collaborator.component';
import { GroupeEtudiantCreateCollaboratorComponent } from './groupe-etudiant/create/groupe-etudiant-create-collaborator.component';
import { GroupeEtudiantEditCollaboratorComponent } from './groupe-etudiant/edit/groupe-etudiant-edit-collaborator.component';
import { GroupeEtudiantViewCollaboratorComponent } from './groupe-etudiant/view/groupe-etudiant-view-collaborator.component';
import { GroupeEtudiantListCollaboratorComponent } from './groupe-etudiant/list/groupe-etudiant-list-collaborator.component';

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

    GroupeEtatCreateCollaboratorComponent,
    GroupeEtatListCollaboratorComponent,
    GroupeEtatViewCollaboratorComponent,
    GroupeEtatEditCollaboratorComponent,
    InscriptionCreateCollaboratorComponent,
    InscriptionListCollaboratorComponent,
    InscriptionViewCollaboratorComponent,
    InscriptionEditCollaboratorComponent,
    GroupeTypeCreateCollaboratorComponent,
    GroupeTypeListCollaboratorComponent,
    GroupeTypeViewCollaboratorComponent,
    GroupeTypeEditCollaboratorComponent,
    GroupeEtudeCreateCollaboratorComponent,
    GroupeEtudeListCollaboratorComponent,
    GroupeEtudeViewCollaboratorComponent,
    GroupeEtudeEditCollaboratorComponent,
    GroupeEtudiantCreateCollaboratorComponent,
    GroupeEtudiantListCollaboratorComponent,
    GroupeEtudiantViewCollaboratorComponent,
    GroupeEtudiantEditCollaboratorComponent,
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
  GroupeEtatCreateCollaboratorComponent,
  GroupeEtatListCollaboratorComponent,
  GroupeEtatViewCollaboratorComponent,
  GroupeEtatEditCollaboratorComponent,
  InscriptionCreateCollaboratorComponent,
  InscriptionListCollaboratorComponent,
  InscriptionViewCollaboratorComponent,
  InscriptionEditCollaboratorComponent,
  GroupeTypeCreateCollaboratorComponent,
  GroupeTypeListCollaboratorComponent,
  GroupeTypeViewCollaboratorComponent,
  GroupeTypeEditCollaboratorComponent,
  GroupeEtudeCreateCollaboratorComponent,
  GroupeEtudeListCollaboratorComponent,
  GroupeEtudeViewCollaboratorComponent,
  GroupeEtudeEditCollaboratorComponent,
  GroupeEtudiantCreateCollaboratorComponent,
  GroupeEtudiantListCollaboratorComponent,
  GroupeEtudiantViewCollaboratorComponent,
  GroupeEtudiantEditCollaboratorComponent,
  ],
})
export class GrpeCollaboratorModule { }
