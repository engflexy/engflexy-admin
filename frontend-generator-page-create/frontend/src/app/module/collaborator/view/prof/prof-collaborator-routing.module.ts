
// const root = environment.rootAppUrl;



import {UserListComponent} from 'src/app/module/security/user/list/user-list.component';
import {ModelPermissionListComponent} from 'src/app/module/security/model-permission/list/model-permission-list.component';
import {ActionPermissionListComponent} from 'src/app/module/security/action-permission/list/action-permission-list.component';
import {ModelPermissionUserListComponent} from 'src/app/module/security/model-permission-utilisateur/list/model-permission-user-list.component';
import {RoleListComponent} from 'src/app/module/security/role/list/role-list.component';



import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import {AuthGuard} from 'src/app/zynerator/security/guards/auth.guard';



import { ScheduleProfListCollaboratorComponent } from './schedule-prof/list/schedule-prof-list-collaborator.component';
import { ProfListCollaboratorComponent } from './prof/list/prof-list-collaborator.component';
import { TypeCollaboratorListCollaboratorComponent } from './type-collaborator/list/type-collaborator-list-collaborator.component';
import { CategorieProfListCollaboratorComponent } from './categorie-prof/list/categorie-prof-list-collaborator.component';
import { ClassAverageBonusProfListCollaboratorComponent } from './class-average-bonus-prof/list/class-average-bonus-prof-list-collaborator.component';
import { TypeTeacherListCollaboratorComponent } from './type-teacher/list/type-teacher-list-collaborator.component';
import { TrancheHoraireProfListCollaboratorComponent } from './tranche-horaire-prof/list/tranche-horaire-prof-list-collaborator.component';
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

                            path: 'schedule-prof',
                            children: [
                                {
                                    path: 'list',
                                    component: ScheduleProfListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'prof',
                            children: [
                                {
                                    path: 'list',
                                    component: ProfListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'type-collaborator',
                            children: [
                                {
                                    path: 'list',
                                    component: TypeCollaboratorListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'categorie-prof',
                            children: [
                                {
                                    path: 'list',
                                    component: CategorieProfListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'class-average-bonus-prof',
                            children: [
                                {
                                    path: 'list',
                                    component: ClassAverageBonusProfListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'type-teacher',
                            children: [
                                {
                                    path: 'list',
                                    component: TypeTeacherListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'tranche-horaire-prof',
                            children: [
                                {
                                    path: 'list',
                                    component: TrancheHoraireProfListCollaboratorComponent ,
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
export class ProfCollaboratorRoutingModule { }
