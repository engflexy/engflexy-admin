
// const root = environment.rootAppUrl;



import {UserListComponent} from 'src/app/module/security/user/list/user-list.component';
import {ModelPermissionListComponent} from 'src/app/module/security/model-permission/list/model-permission-list.component';
import {ActionPermissionListComponent} from 'src/app/module/security/action-permission/list/action-permission-list.component';
import {ModelPermissionUserListComponent} from 'src/app/module/security/model-permission-utilisateur/list/model-permission-user-list.component';
import {RoleListComponent} from 'src/app/module/security/role/list/role-list.component';



import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import {AuthGuard} from 'src/app/zynerator/security/guards/auth.guard';



import { GroupeEtatListCollaboratorComponent } from './groupe-etat/list/groupe-etat-list-collaborator.component';
import { InscriptionListCollaboratorComponent } from './inscription/list/inscription-list-collaborator.component';
import { GroupeTypeListCollaboratorComponent } from './groupe-type/list/groupe-type-list-collaborator.component';
import { GroupeEtudeListCollaboratorComponent } from './groupe-etude/list/groupe-etude-list-collaborator.component';
import { GroupeEtudiantListCollaboratorComponent } from './groupe-etudiant/list/groupe-etudiant-list-collaborator.component';
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

                            path: 'groupe-etat',
                            children: [
                                {
                                    path: 'list',
                                    component: GroupeEtatListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'inscription',
                            children: [
                                {
                                    path: 'list',
                                    component: InscriptionListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'groupe-type',
                            children: [
                                {
                                    path: 'list',
                                    component: GroupeTypeListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'groupe-etude',
                            children: [
                                {
                                    path: 'list',
                                    component: GroupeEtudeListCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                            ]
                        },

                        {

                            path: 'groupe-etudiant',
                            children: [
                                {
                                    path: 'list',
                                    component: GroupeEtudiantListCollaboratorComponent ,
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
export class GrpeCollaboratorRoutingModule { }
