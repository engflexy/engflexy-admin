
// const root = environment.rootAppUrl;



import {UserListComponent} from 'src/app/module/security/user/list/user-list.component';
import {ModelPermissionListComponent} from 'src/app/module/security/model-permission/list/model-permission-list.component';
import {ActionPermissionListComponent} from 'src/app/module/security/action-permission/list/action-permission-list.component';
import {ModelPermissionUserListComponent} from 'src/app/module/security/model-permission-utilisateur/list/model-permission-user-list.component';
import {RoleListComponent} from 'src/app/module/security/role/list/role-list.component';



import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import {AuthGuard} from 'src/app/zynerator/security/guards/auth.guard';



import { CategorieSectionListCollaboratorComponent } from './categorie-section/list/categorie-section-list-collaborator.component';
import { ContentTypeListCollaboratorComponent } from './content-type/list/content-type-list-collaborator.component';
import { LevelTestConfigurationListCollaboratorComponent } from './level-test-configuration/list/level-test-configuration-list-collaborator.component';
import { SuperCategorieSectionListCollaboratorComponent } from './super-categorie-section/list/super-categorie-section-list-collaborator.component';
import { EtatCoursListCollaboratorComponent } from './etat-cours/list/etat-cours-list-collaborator.component';
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

                            path: 'categorie-section',
                            children: [
                                {
                                    path: 'list',
                                    component: CategorieSectionListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'content-type',
                            children: [
                                {
                                    path: 'list',
                                    component: ContentTypeListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'level-test-configuration',
                            children: [
                                {
                                    path: 'list',
                                    component: LevelTestConfigurationListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'super-categorie-section',
                            children: [
                                {
                                    path: 'list',
                                    component: SuperCategorieSectionListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'etat-cours',
                            children: [
                                {
                                    path: 'list',
                                    component: EtatCoursListCollaboratorComponent ,
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
export class CourserefCollaboratorRoutingModule { }
