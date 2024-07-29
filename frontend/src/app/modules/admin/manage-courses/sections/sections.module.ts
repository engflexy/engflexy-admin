import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import {
    CommonModule,
    LocationStrategy,
    NgClass,
    NgFor,
    NgIf,
    NgOptimizedImage,
    PathLocationStrategy
} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {MatCheckboxModule} from '@angular/material/checkbox';
import {MatOptionModule} from '@angular/material/core';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import {MatRadioModule} from '@angular/material/radio';
import {MatSelectModule} from '@angular/material/select';
import {MatStepperModule} from '@angular/material/stepper';
import {RouterLink, RouterModule, RouterOutlet} from "@angular/router";
import {MatIconModule} from "@angular/material/icon";
import {MatProgressBarModule} from "@angular/material/progress-bar";
import {MatSidenavModule} from "@angular/material/sidenav";
import {MatButtonModule} from "@angular/material/button";
import {MatTabsModule} from "@angular/material/tabs";
import {CdkScrollable} from "@angular/cdk/scrolling";
import {CdkDrag, CdkDropList, CdkDropListGroup} from "@angular/cdk/drag-drop";
import {MatTooltipModule} from "@angular/material/tooltip";
import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatDialogModule} from "@angular/material/dialog";
import {MatPaginatorModule} from "@angular/material/paginator";
import {MatButtonToggleModule} from "@angular/material/button-toggle";
import {NgApexchartsModule} from "ng-apexcharts";
import {MatMenuModule} from "@angular/material/menu";
import {MatBadgeModule} from "@angular/material/badge";
import {FuseCardComponent} from "../../../../../@fuse/components/card";
import {SectionsRoutes} from "./sections.routes";
import {ClassroomComponent} from "./classroom/classroom.component";
import {TypeExercisesComponent} from './type-exercises/type-exercises.component';
import {MatDividerModule} from "@angular/material/divider";
import {CreateExerciseComponent} from './create-exercise/create-exercise.component';
import {NgImageSliderModule} from "ng-image-slider";
import {DisplayMultiImagesComponent} from './classroom/display-multi-images/display-multi-images.component';
import {DisplayVideoComponent} from './classroom/display-video/display-video.component';
import {SafePipe} from "../../../../shared/utils/safe.pipe";
import {AngularEditorModule} from "@kolkov/angular-editor";
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
import {DividerComponent} from "../../../landing/divider/divider.component";
import {MatExpansionModule} from "@angular/material/expansion";
import { EditAnswersComponent } from './quiz/create-quiz/edit-answers/edit-answers.component';
import { HomeworkComponent } from './homework/homework.component';


@NgModule({
    declarations: [ ClassroomComponent,
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
        CommonModule,
        RouterModule,
        RouterOutlet,
        FormsModule,
        ReactiveFormsModule,
        MatStepperModule,
        MatFormFieldModule,
        MatInputModule,
        MatSelectModule,
        MatOptionModule,
        MatCheckboxModule,
        MatRadioModule,
        MatIconModule,
        MatProgressBarModule,
        MatSidenavModule,
        RouterLink,
        NgIf, NgClass, NgFor, MatButtonModule,
        CdkScrollable,
        MatTabsModule,
        NgOptimizedImage,
        FuseCardComponent,
        CdkDropListGroup,
        CdkDrag,
        CdkDropList,
        MatTooltipModule,
        MatAutocompleteModule, MatDialogModule, MatPaginatorModule,
        MatButtonToggleModule, NgApexchartsModule, MatMenuModule, MatBadgeModule, MatDividerModule,
        NgImageSliderModule, AngularEditorModule, DividerComponent, MatExpansionModule,


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
