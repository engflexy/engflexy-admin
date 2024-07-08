
// const root = environment.rootAppUrl;



import {UserListComponent} from 'src/app/module/security/user/list/user-list.component';
import {ModelPermissionListComponent} from 'src/app/module/security/model-permission/list/model-permission-list.component';
import {ActionPermissionListComponent} from 'src/app/module/security/action-permission/list/action-permission-list.component';
import {ModelPermissionUserListComponent} from 'src/app/module/security/model-permission-utilisateur/list/model-permission-user-list.component';
import {RoleListComponent} from 'src/app/module/security/role/list/role-list.component';



import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import {AuthGuard} from 'src/app/zynerator/security/guards/auth.guard';



import { HomeWorkEtudiantListCollaboratorComponent } from './home-work-etudiant/list/home-work-etudiant-list-collaborator.component';
import { HomeWorkQuestionListCollaboratorComponent } from './home-work-question/list/home-work-question-list-collaborator.component';
import { HoweWorkQSTReponseListCollaboratorComponent } from './howe-work-q-s-t-reponse/list/howe-work-q-s-t-reponse-list-collaborator.component';
import { TypeHomeWorkListCollaboratorComponent } from './type-home-work/list/type-home-work-list-collaborator.component';
import { ReponseEtudiantHomeWorkListCollaboratorComponent } from './reponse-etudiant-home-work/list/reponse-etudiant-home-work-list-collaborator.component';
import { HomeWorkListCollaboratorComponent } from './home-work/list/home-work-list-collaborator.component';
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

                            path: 'home-work-etudiant',
                            children: [
                                {
                                    path: 'list',
                                    component: HomeWorkEtudiantListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'home-work-question',
                            children: [
                                {
                                    path: 'list',
                                    component: HomeWorkQuestionListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'howe-work-q-s-t-reponse',
                            children: [
                                {
                                    path: 'list',
                                    component: HoweWorkQSTReponseListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'type-home-work',
                            children: [
                                {
                                    path: 'list',
                                    component: TypeHomeWorkListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'reponse-etudiant-home-work',
                            children: [
                                {
                                    path: 'list',
                                    component: ReponseEtudiantHomeWorkListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'home-work',
                            children: [
                                {
                                    path: 'list',
                                    component: HomeWorkListCollaboratorComponent ,
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
export class HomeworkCollaboratorRoutingModule { }
