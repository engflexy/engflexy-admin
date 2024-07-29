import {RouterModule} from '@angular/router';
import {NgModule} from '@angular/core';
import {AdminDashboardComponent} from "../admin/admin-dashboard/admin-dashboard.component";
import {ManageInscriptionsComponent} from "./manage-inscriptions/manage-inscriptions.component";
import {ManageSalaryComponent} from "./manage-salary/manage-salary.component";
import {ManagePackPricesComponent} from "./manage-pack-prices/manage-pack-prices.component";
import {ScheduleComponent} from "./schedule/schedule.component";

@NgModule({
    imports: [
        RouterModule.forChild(
            [
                {
                    path: 'dashboard',
                    component: AdminDashboardComponent
                },
                {
                    path: 'manage-courses',
                    loadChildren: () => import('app/modules/collaborator/manage-courses/manage-course.routes')
                },
                {
                    path: 'chat',
                    loadChildren: () => import('app/modules/collaborator/chat-component/chat/chat.routes')
                },
                {
                    path: 'manage-users',
                    loadChildren: () => import('app/modules/collaborator/manage-users/manage-users.module').then(x => x.ManageUsersModule)
                },
                {
                    path: 'manage-inscriptions',
                    component: ManageInscriptionsComponent
                },
                {
                    path: 'manage-groups',
                    loadChildren: () => import('app/modules/collaborator/manage-groups/group.routes')
                },
                {
                    path: 'schedule',
                    component: ScheduleComponent
                },
                {
                    path: 'faqs-news',
                    loadChildren: () => import('app/modules/collaborator/manage-faq-news/help-center.routes')
                },
                {
                    path: 'teacher-salary',
                    component: ManageSalaryComponent
                },
                {
                    path: 'manage-pack-prices',
                    component: ManagePackPricesComponent
                },
            ]
        ),
    ],
    exports: [RouterModule],
})
export class CollaboratorRouting {
}

