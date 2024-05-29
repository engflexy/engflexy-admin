import {RouterModule} from '@angular/router';
import {NgModule} from '@angular/core';
import {ClassroomComponent} from "./classroom/classroom.component";
import {HomeworkComponent} from "./homework/homework.component";

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
                {
                    path: 'homework',
                    component: HomeworkComponent
                },
            ]
        ),
    ],
    exports: [RouterModule],
})
export class SectionsRoutes {
}

