import {RouterModule} from '@angular/router';
import {NgModule} from '@angular/core';
import {ClassroomComponent} from "./classroom/classroom.component";

@NgModule({
    imports: [
        RouterModule.forChild(
            [

                {
                    path: '',
                    component: ClassroomComponent
                },
                {
                    path: 'lesson',
                    component: ClassroomComponent
                },
            ]
        ),
    ],
    exports: [RouterModule],
})
export class SectionsRoutes {
}

