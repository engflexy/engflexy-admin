import {Routes} from '@angular/router';
import {ManageCoursesComponent} from "./manage-courses.component";
import {MaterialDetailComponent} from "./material-detail/material-detail.component";

export default [
    {
        path: '',
        component: ManageCoursesComponent,
    }, {
        path: 'materials/:level',
        component: MaterialDetailComponent,
    }, {
        path: 'materials/:level/courses/:course',
        data: {
            layout: 'modern'
        },
        loadChildren: () => import('app/modules/admin/manage-courses/sections/sections.module').then(x => x.SectionsModule)
    },
] as Routes;
