import {ChangeDetectorRef, Component, Inject, OnInit, ViewChild} from '@angular/core';
import {
    SectionCollaboratorService
} from "../../../../../shared/service/collaborator/course/SectionCollaborator.service";
import {ActivatedRoute, Router} from "@angular/router";
import {
    ParcoursCollaboratorService
} from "../../../../../shared/service/collaborator/course/ParcoursCollaborator.service";
import {CoursCollaboratorService} from "../../../../../shared/service/collaborator/course/CoursCollaborator.service";
import {MatDialog} from "@angular/material/dialog";
import {Subject, takeUntil} from "rxjs";
import {CoursDto} from "../../../../../shared/model/course/Cours.model";
import {SectionDto} from "../../../../../shared/model/course/Section.model";
import {FuseMediaWatcherService} from "../../../../../../@fuse/services/media-watcher";
import {DOCUMENT} from "@angular/common";
import {TypeExercisesComponent} from "../type-exercises/type-exercises.component";
import {MatTabGroup} from "@angular/material/tabs";
import {FuseAlertService} from "../../../../../../@fuse/components/alert";
import {ContentType} from "../../../../../shared/utils/enums";
import {ExerciceDto} from "../../../../../shared/model/course/Exercice.model";
import {QuizDto} from "../../../../../shared/model/quiz/Quiz.model";
import {QuizCollaboratorService} from "../../../../../shared/service/collaborator/quiz/QuizCollaborator.service";
import {
    ExerciceCollaboratorService
} from "../../../../../shared/service/collaborator/course/ExerciceCollaborator.service";
import {CreateExerciseComponent} from "../create-exercise/create-exercise.component";
import {FuseConfirmationService} from "../../../../../../@fuse/services/confirmation";

@Component({
    selector: 'app-classroom',
    templateUrl: './classroom.component.html',
})
export class ClassroomComponent implements OnInit {
    @ViewChild('courseSteps', {static: true}) courseSteps: MatTabGroup;

    private courseId: number
    drawerMode: 'over' | 'side' = 'side';
    drawerOpened: boolean = true;
    private _unsubscribeAll: Subject<any> = new Subject<any>();
    currentStep: number = 0
    editSection: string


    constructor(private sectionService: SectionCollaboratorService,
                private courseService: CoursCollaboratorService,
                private alert: FuseAlertService,
                private router: Router,
                private _fuseMediaWatcherService: FuseMediaWatcherService,
                private _changeDetectorRef: ChangeDetectorRef,
                @Inject(DOCUMENT) private _document: Document,
                private parcourService: ParcoursCollaboratorService,
                private _matDialog: MatDialog,
                private quizService: QuizCollaboratorService,
                private exerciseService: ExerciceCollaboratorService,
                private route: ActivatedRoute,
                private _fuseConfirmation: FuseConfirmationService,


    ) {
    }

    get quiz(): QuizDto {
        return this.quizService.item
    }

    set quiz(item: QuizDto) {
        this.quizService.item = item
    }

    get exercise(): ExerciceDto {
        return this.exerciseService.item
    }

    set exercise(item: ExerciceDto) {
        this.exerciseService.item = item
    }

    get sections(): SectionDto[] {
        return this.sectionService.items
    }

    set sections(item: SectionDto[]) {
        this.sectionService.items = item
    }

    get selectedCourse(): CoursDto {
        return this.courseService.item
    }

    set selectedCourse(item: CoursDto) {
        this.courseService.item = item
    }

    get selectedSection(): SectionDto {
        return this.sectionService.item
    }

    set selectedSection(item: SectionDto) {
        this.sectionService.item = item
    }

    ngOnInit() {
        this.drawer_mode()
        this.courseId = this.route.snapshot.params.course
        if (this.courseId) {
            const course = new CoursDto()
            course.id = this.courseId
            this.courseService.findByIdWithAssociatedList(course)
                .subscribe(res => {
                    this.selectedCourse = res
                    this.sections = res?.sections
                    console.log(this.sections)
                })
        } else {
            this.router.navigate(['/admin/manage-courses']);
        }
    }

    trackByFn(index: number, item: any): any {
        return item?.numero || index;
    }

    /**
     * Go to given step
     *
     * @param step
     */
    goToStep(step: number): void {
        // Set the current step
        this.currentStep = step;

        // Go to the step
        this.courseSteps.selectedIndex = this.currentStep;

        //extract content of the section
        this.selectedSection = this.sections.at(step)
        if (this.selectedSection.exercices) {
            this.selectedSection.exercices = this.sections.at(step).exercices.sort((a, b) => a.numero - b.numero)
        }
        console.log(this.selectedSection)
        // Mark for check
        this._changeDetectorRef.markForCheck();
    }


    /**
     * Go to previous step
     */
    goToPreviousStep(): void {
        // Return if we already on the first step
        if (this.currentStep === 0) {
            return;
        }

        // Go to step
        this.goToStep(this.currentStep - 1);

        // Scroll the current step selector from sidenav into view
        this._scrollCurrentStepElementIntoView();
    }

    /**
     * Go to next step
     */
    goToNextStep(): void {
        // Return if we already on the last step
        if (this.currentStep === this.sections.length - 1) {
            return;
        }

        // Go to step
        this.goToStep(this.currentStep + 1);

        // Scroll the current step selector from sidenav into view
        this._scrollCurrentStepElementIntoView();
    }


    createNewSection() {
        this.selectedSection = new SectionDto()
        this.selectedSection.numero = Number(this.sections?.length) + 1
        this.selectedSection.libelle = 'section ' + this.selectedSection.numero
        this.selectedSection.description = null
        this.selectedSection.cours = this.selectedCourse
        this.sectionService.save().subscribe(res => {
            this.sections.push({...res})
            this.selectedSection = res
            this.goToStep(this.sections.length)
            console.log(res)
        }, error => {
            console.error(error)
            this.alert.show('warning', error?.error?.message || 'something went wrong, please try again.')
        })
    }

    private drawer_mode() {
        this._fuseMediaWatcherService.onMediaChange$
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe(({matchingAliases}) => {
                // Set the drawerMode and drawerOpened
                if (matchingAliases.includes('lg')) {
                    this.drawerMode = 'side';
                    this.drawerOpened = true;
                } else {
                    this.drawerMode = 'over';
                    this.drawerOpened = false;
                }

                // Mark for check
                this._changeDetectorRef.markForCheck();
            });
    }

    addExercise(selectedSection: SectionDto) {
        this.selectedSection = selectedSection
        this._matDialog.open(TypeExercisesComponent, {
            autoFocus: false,
            data: selectedSection
        });
    }


    /**
     * Scrolls the current step element from
     * sidenav into the view. This only happens when
     * previous/next buttons pressed as we don't want
     * to change the scroll position of the sidebar
     * when the user actually clicks around the sidebar.
     *
     * @private
     */
    private _scrollCurrentStepElementIntoView(): void {
        // Wrap everything into setTimeout so we can make sure that the 'current-step' class points to correct element
        setTimeout(() => {
            // Get the current step element and scroll it into view
            const currentStepElement = this._document.getElementsByClassName('current-step')[0];
            if (currentStepElement) {
                currentStepElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start',
                });
            }
        });
    }

    protected readonly ContentType = ContentType;

    edit(exercise: ExerciceDto, section) {
        let quizType = null
        this.exercise = exercise
        this.selectedSection = section
        if (exercise?.quiz) {
            this.quiz = exercise.quiz
            quizType = exercise.quiz?.questions?.at(0)?.typeDeQuestion?.ref
        }

        this._matDialog.open(CreateExerciseComponent, {
            autoFocus: false,
            data: {type: exercise.contentType.code, quizType: quizType},
            height: "auto",
            width: "calc(100% - 30px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
    }

    updateFields(section: SectionDto) {
        this.editSection = null
        this.sectionService.updateFields(section).subscribe()
    }

    deleteExercise(exercise: ExerciceDto) {
        const confirmation = this._fuseConfirmation.open({
            title: 'delete exercise',
            message: 'Are you sure you want to remove this exercise?',
            actions: {
                confirm: {
                    label: 'REMOVE',
                },
            },
        });
        // Subscribe to the confirmation dialog closed action
        confirmation.afterClosed().subscribe((result) => {
            // If the confirmation button pressed...
            if (result === 'confirmed') {
                this.exerciseService.delete(exercise).subscribe(res => {
                    this.selectedSection.exercices = this.selectedSection.exercices.filter(e => e.id !== exercise.id)
                    this.goToStep(this.currentStep)
                }, error => {
                    this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
                })
            }
        });
    }

    deleteSection(section: SectionDto) {
        const confirmation = this._fuseConfirmation.open({
            title: 'delete section',
            message: 'Are you sure you want to remove this section?',
            actions: {
                confirm: {
                    label: 'REMOVE',
                },
            },
        });
        // Subscribe to the confirmation dialog closed action
        confirmation.afterClosed().subscribe((result) => {
            // If the confirmation button pressed...
            if (result === 'confirmed') {
                this.sectionService.delete(section).subscribe(res => {
                    this.sections = this.sections.filter(s => s.id !== section.id)
                    this.goToStep(0)
                }, error => {
                    this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
                })
            }
        });

    }
}
//        <button mat-mini-fab color="accent">
//           <mat-icon svgIcon="heroicons_solid:trash"></mat-icon>
//         </button>
