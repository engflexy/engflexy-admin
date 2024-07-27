import {Routes} from "@angular/router";
import {AdminDashboardComponent} from "./admin-dashboard/admin-dashboard.component";
import {ManageInscriptionsComponent} from "./manage-inscriptions/manage-inscriptions.component";
import {ManageSalaryComponent} from "./manage-salary/manage-salary.component";
import {ManagePackPricesComponent} from "./manage-pack-prices/manage-pack-prices.component";

export default [
    {
        path: 'dashboard',
        component: AdminDashboardComponent
    },
    {
        path: 'manage-courses',
        loadChildren: () => import('app/modules/admin/manage-courses/manage-course.routes')
    },
    {
        path: 'chat',
        loadChildren: () => import('app/modules/admin/chat-component/chat/chat.routes')
    },
    {
        path: 'manage-users',
        loadChildren: () => import('app/modules/admin/manage-users/manage-users.module').then(x => x.ManageUsersModule)
    },
    {
        path: 'manage-inscriptions',
        component: ManageInscriptionsComponent
    },
    {
        path: 'manage-groups',
        loadChildren: () => import('app/modules/admin/manage-groups/group.routes')
    },
    {
        path: 'schedule',
        loadChildren: () => import('app/modules/admin/schedule/schedule.module').then(x => x.ScheduleModule)
    },
    {
        path: 'faqs-news',
        loadChildren: () => import('app/modules/admin/manage-faq-news/help-center.routes')
    },
    {
        path: 'teacher-salary',
        component: ManageSalaryComponent
    },
    {
        path: 'manage-pack-prices',
        component: ManagePackPricesComponent
    },
] as Routes;
