import {RouterModule} from '@angular/router';
import {NgModule} from '@angular/core';
import {AuthGuard} from "src/app/zynerator/security/guards/auth.guard";
import {AppLayoutComponent} from "src/app/layout/app.layout.component";

import {PreloadpageComponent} from "./public/preloadpage/preloadpage.component";

import {LoginAdminComponent} from 'src/app/module/admin/login-admin/login-admin.component';
import {RegisterAdminComponent} from 'src/app/module/admin/register-admin/register-admin.component';
import {ChangePasswordAdminComponent} from 'src/app/module/admin/change-password-admin/change-password-admin.component';
import {LoginCollaboratorComponent} from 'src/app/module/collaborator/login-collaborator/login-collaborator.component';
import {RegisterCollaboratorComponent} from 'src/app/module/collaborator/register-collaborator/register-collaborator.component';
import {ChangePasswordCollaboratorComponent} from 'src/app/module/collaborator/change-password-collaborator/change-password-collaborator.component';

@NgModule({
    imports: [
        RouterModule.forRoot(
            [
                {path: '', component: PreloadpageComponent},
                {path: 'admin/login', component: LoginAdminComponent },
                {path: 'admin/register', component: RegisterAdminComponent },
                {path: 'admin/changePassword', component: ChangePasswordAdminComponent },
                {path: 'collaborator/login', component: LoginCollaboratorComponent },
                {path: 'collaborator/register', component: RegisterCollaboratorComponent },
                {path: 'collaborator/changePassword', component: ChangePasswordCollaboratorComponent },
                {
                    path: 'app',
                    component: AppLayoutComponent,
                    children: [
                        {
                            path: 'admin',
                            loadChildren: () => import( './module/admin/admin-routing.module').then(x => x.AdminRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'collaborator',
                            loadChildren: () => import( './module/collaborator/collaborator-routing.module').then(x => x.CollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                    ],
                    canActivate: [AuthGuard]
                },
            ],
                { scrollPositionRestoration: 'enabled' }
            ),
        ],
    exports: [RouterModule],
    })
export class AppRoutingModule { }
