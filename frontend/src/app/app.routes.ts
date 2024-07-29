import {Route} from '@angular/router';
import {initialDataResolver} from 'app/app.resolvers';
import {AuthGuard} from 'app/core/auth/guards/auth.guard';
import {NoAuthGuard} from 'app/core/auth/guards/noAuth.guard';
import {LayoutComponent} from 'app/layout/layout.component';
import {AdminDashboardComponent} from "./modules/admin/admin-dashboard/admin-dashboard.component";
import {ManageInscriptionsComponent} from "./modules/admin/manage-inscriptions/manage-inscriptions.component";
import {ManageSalaryComponent} from "./modules/admin/manage-salary/manage-salary.component";
import {ManagePackPricesComponent} from "./modules/admin/manage-pack-prices/manage-pack-prices.component";

// @formatter:off
/* eslint-disable max-len */
/* eslint-disable @typescript-eslint/explicit-function-return-type */
export const appRoutes: Route[] = [

    // Redirect empty path to '/example'
    {path: '', pathMatch : 'full', redirectTo: 'admin/dashboard'},

    // Redirect signed-in user to the '/example'
    //
    // After the user signs in, the sign-in page will redirect the user to the 'signed-in-redirect'
    // path. Below is another redirection for that path to redirect the user to the desired
    // location. This is a small convenience to keep all main routes together here on this file.
    {path: 'signed-in-redirect', pathMatch : 'full', redirectTo: 'admin/dashboard'},

    // Auth routes for guests
    {
        path: '',
        canActivate: [NoAuthGuard],
        canActivateChild: [NoAuthGuard],
        component: LayoutComponent,
        data: {
            layout: 'empty'
        },
        children: [
            {path: 'confirmation-required', loadChildren: () => import('app/modules/auth/confirmation-required/confirmation-required.routes')},
            {path: 'forgot-password', loadChildren: () => import('app/modules/auth/forgot-password/forgot-password.routes')},
            {path: 'reset-password', loadChildren: () => import('app/modules/auth/reset-password/reset-password.routes')},
            {path: 'sign-in', loadChildren: () => import('app/modules/auth/sign-in/sign-in.routes')},
            {path: 'sign-up', loadChildren: () => import('app/modules/auth/sign-up/sign-up.routes')}
        ]
    },

    // Auth routes for authenticated users
    {
        path: '',
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        component: LayoutComponent,
        data: {
            layout: 'empty'
        },
        children: [
            {path: 'sign-out', loadChildren: () => import('app/modules/auth/sign-out/sign-out.routes')},
            {path: 'unlock-session', loadChildren: () => import('app/modules/auth/unlock-session/unlock-session.routes')}
        ]
    },

    // Landing routes
    {
        path: '',
        component: LayoutComponent,
        data: {
            layout: 'empty'
        },
        children: [
            {path: 'home', loadChildren: () => import('app/modules/landing/home/home.routes')},
        ]
    },

    // Admin routes
    {
        path: 'admin',
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        component: LayoutComponent,
        data: {
            layout: 'dense'
        },
        resolve: {
            initialData: initialDataResolver
        },
        children: [
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
                loadChildren: () => import('app/modules/admin/manage-users/manage-users.module').then(x =>x.ManageUsersModule)
            },
            { path: 'manage-statistics',
                loadChildren: () => import('app/modules/admin/manage-users/manage-users.module').then(x =>x.ManageUsersModule)
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
                loadChildren: () => import('app/modules/admin/schedule/schedule.module').then(x =>x.ScheduleModule)
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
        ]
    }
];
