import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import {LocationStrategy, NgClass, NgForOf, NgIf, NgOptimizedImage, PathLocationStrategy} from '@angular/common';
import {SectionsRoutes} from "./sections.routes";
import {ClassroomComponent} from "./classroom/classroom.component";
import {TypeExercisesComponent} from './type-exercises/type-exercises.component';
import {CreateExerciseComponent} from './create-exercise/create-exercise.component';
import {DisplayMultiImagesComponent} from './classroom/display-multi-images/display-multi-images.component';
import {DisplayVideoComponent} from './classroom/display-video/display-video.component';
import {SafePipe} from "../../../../shared/utils/safe.pipe";
import {CreateQuizComponent} from './quiz/create-quiz/create-quiz.component';
import {TypesQuestionComponent} from './quiz/types-question/types-question.component';
import {QuizComponent} from "./quiz/quiz/quiz.component";
import {CorrectTheMistakeComponent} from "./quiz/quiz/correct-the-mistake/correct-the-mistake.component";
import {
    ChooseCorrectAlternativeComponent
} from "./quiz/quiz/choose-correct-alternative/choose-correct-alternative.component";
import {DragAndDropComponent} from "./quiz/quiz/drag-and-drop/drag-and-drop.component";
import {PutInOrderComponent} from "./quiz/quiz/put-in-order/put-in-order.component";
import {TranslatePhraseComponent} from "./quiz/quiz/translate-phrase/translate-phrase.component";
import {TrueOrFalseComponent} from "./quiz/quiz/true-or-false/true-or-false.component";
import {WriteCorrectFormComponent} from "./quiz/quiz/write-correct-form/write-correct-form.component";
import {EditAnswersComponent} from './quiz/create-quiz/edit-answers/edit-answers.component';
import {HomeworkComponent} from './homework/homework.component';
import {MatSidenavModule} from "@angular/material/sidenav";
import {MatIconModule} from "@angular/material/icon";
import {MatProgressBarModule} from "@angular/material/progress-bar";
import {MatTabsModule} from "@angular/material/tabs";
import {MatFormFieldModule} from "@angular/material/form-field";
import {FormsModule} from "@angular/forms";
import {MatButtonModule} from "@angular/material/button";
import {MatInputModule} from "@angular/material/input";
import {MatDialogModule} from "@angular/material/dialog";
import {FuseCardComponent} from "../../../../../@fuse/components/card";
import {AngularEditorModule} from "@kolkov/angular-editor";
import {NgImageSliderModule} from "ng-image-slider";
import {CollaboratorModule} from "../../collaborator.module";
import {MatSelectModule} from "@angular/material/select";
import {DividerComponent} from "../../../landing/divider/divider.component";


@NgModule({
    declarations: [
        ClassroomComponent,
        TypeExercisesComponent, CreateExerciseComponent,
        DisplayMultiImagesComponent, DisplayVideoComponent
        , CreateQuizComponent, TypesQuestionComponent,
        QuizComponent,
        CorrectTheMistakeComponent,
        ChooseCorrectAlternativeComponent,
        DragAndDropComponent,
        PutInOrderComponent,
        TranslatePhraseComponent,
        TrueOrFalseComponent,
        WriteCorrectFormComponent,
        EditAnswersComponent,
        HomeworkComponent
    ],
    imports: [
        SectionsRoutes,
        MatSidenavModule,
        MatIconModule,
        NgClass,
        MatProgressBarModule,
        MatTabsModule,
        MatFormFieldModule,
        FormsModule,
        MatButtonModule,
        NgForOf,
        NgIf,
        MatInputModule,
        MatDialogModule,
        FuseCardComponent,
        NgOptimizedImage,
        AngularEditorModule,
        NgImageSliderModule,
        CollaboratorModule,
        MatSelectModule,
        DividerComponent,
    ],
    exports: [],
    schemas: [
        CUSTOM_ELEMENTS_SCHEMA,
        NO_ERRORS_SCHEMA
    ],
    providers: [{provide: LocationStrategy, useClass: PathLocationStrategy},
        Location]
})
export class SectionsModule {
}
