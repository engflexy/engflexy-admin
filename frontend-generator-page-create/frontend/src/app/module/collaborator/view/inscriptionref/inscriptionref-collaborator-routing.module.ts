
// const root = environment.rootAppUrl;



import {UserListComponent} from 'src/app/module/security/user/list/user-list.component';
import {ModelPermissionListComponent} from 'src/app/module/security/model-permission/list/model-permission-list.component';
import {ActionPermissionListComponent} from 'src/app/module/security/action-permission/list/action-permission-list.component';
import {ModelPermissionUserListComponent} from 'src/app/module/security/model-permission-utilisateur/list/model-permission-user-list.component';
import {RoleListComponent} from 'src/app/module/security/role/list/role-list.component';



import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import {AuthGuard} from 'src/app/zynerator/security/guards/auth.guard';



import { StatutSocialListCollaboratorComponent } from './statut-social/list/statut-social-list-collaborator.component';
import { SkillListCollaboratorComponent } from './skill/list/skill-list-collaborator.component';
import { InteretEtudiantListCollaboratorComponent } from './interet-etudiant/list/interet-etudiant-list-collaborator.component';
import { LangueListCollaboratorComponent } from './langue/list/langue-list-collaborator.component';
import { EtatInscriptionListCollaboratorComponent } from './etat-inscription/list/etat-inscription-list-collaborator.component';
import { InviteStudentListCollaboratorComponent } from './invite-student/list/invite-student-list-collaborator.component';
import { TeacherLocalityListCollaboratorComponent } from './teacher-locality/list/teacher-locality-list-collaborator.component';
import { EtudiantReviewListCollaboratorComponent } from './etudiant-review/list/etudiant-review-list-collaborator.component';
import { FonctionListCollaboratorComponent } from './fonction/list/fonction-list-collaborator.component';
import { NiveauEtudeListCollaboratorComponent } from './niveau-etude/list/niveau-etude-list-collaborator.component';
import { ConfirmationTokenListCollaboratorComponent } from './confirmation-token/list/confirmation-token-list-collaborator.component';
@NgModule({
    imports: [
        RouterModule.forChild(
            [
                {
                    path: '',
                    children: [
                        {

                            path: 'action-permission',
                            children: [
                                {
                                    path: 'list',
                                    component: ActionPermissionListComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'model-permission-user',
                            children: [
                                {
                                    path: 'list',
                                    component: ModelPermissionUserListComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },
                        {

                            path: 'role',
                            children: [
                                {
                                    path: 'list',
                                    component: RoleListComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },
                        {

                            path: 'user',
                            children: [
                                {
                                    path: 'list',
                                    component: UserListComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'model-permission',
                            children: [
                                {
                                    path: 'list',
                                    component: ModelPermissionListComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },


                        {

                            path: 'statut-social',
                            children: [
                                {
                                    path: 'list',
                                    component: StatutSocialListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'skill',
                            children: [
                                {
                                    path: 'list',
                                    component: SkillListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'interet-etudiant',
                            children: [
                                {
                                    path: 'list',
                                    component: InteretEtudiantListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'langue',
                            children: [
                                {
                                    path: 'list',
                                    component: LangueListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'etat-inscription',
                            children: [
                                {
                                    path: 'list',
                                    component: EtatInscriptionListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'invite-student',
                            children: [
                                {
                                    path: 'list',
                                    component: InviteStudentListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'teacher-locality',
                            children: [
                                {
                                    path: 'list',
                                    component: TeacherLocalityListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'etudiant-review',
                            children: [
                                {
                                    path: 'list',
                                    component: EtudiantReviewListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'fonction',
                            children: [
                                {
                                    path: 'list',
                                    component: FonctionListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'niveau-etude',
                            children: [
                                {
                                    path: 'list',
                                    component: NiveauEtudeListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'confirmation-token',
                            children: [
                                {
                                    path: 'list',
                                    component: ConfirmationTokenListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                    ]
                },
            ]
        ),
    ],
    exports: [RouterModule],
})
export class InscriptionrefCollaboratorRoutingModule { }
