
// const root = environment.rootAppUrl;

import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import {AuthGuard} from 'src/app/zynerator/security/guards/auth.guard';

import { LoginCollaboratorComponent } from './login-collaborator/login-collaborator.component';
import { RegisterCollaboratorComponent } from './register-collaborator/register-collaborator.component';

@NgModule({
    imports: [
        RouterModule.forChild(
            [
                {
                    path: '',
                    children: [
                        {
                            path: 'login',
                            children: [
                                {
                                    path: '',
                                    component: LoginCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                              ]
                        },
                        {
                            path: 'register',
                            children: [
                                {
                                    path: '',
                                    component: RegisterCollaboratorComponent ,
                                    canActivate: [AuthGuard]
                                }
                              ]
                        },
                        {
                            path: 'quiz',
                            loadChildren: () => import('./view/quiz/quiz-collaborator-routing.module').then(x => x.QuizCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'recomrecla',
                            loadChildren: () => import('./view/recomrecla/recomrecla-collaborator-routing.module').then(x => x.RecomreclaCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'paiement',
                            loadChildren: () => import('./view/paiement/paiement-collaborator-routing.module').then(x => x.PaiementCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'inscriptionref',
                            loadChildren: () => import('./view/inscriptionref/inscriptionref-collaborator-routing.module').then(x => x.InscriptionrefCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'courseref',
                            loadChildren: () => import('./view/courseref/courseref-collaborator-routing.module').then(x => x.CourserefCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'learning',
                            loadChildren: () => import('./view/learning/learning-collaborator-routing.module').then(x => x.LearningCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'prof',
                            loadChildren: () => import('./view/prof/prof-collaborator-routing.module').then(x => x.ProfCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'pack',
                            loadChildren: () => import('./view/pack/pack-collaborator-routing.module').then(x => x.PackCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'salary',
                            loadChildren: () => import('./view/salary/salary-collaborator-routing.module').then(x => x.SalaryCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'grpe',
                            loadChildren: () => import('./view/grpe/grpe-collaborator-routing.module').then(x => x.GrpeCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'faq',
                            loadChildren: () => import('./view/faq/faq-collaborator-routing.module').then(x => x.FaqCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'common',
                            loadChildren: () => import('./view/common/common-collaborator-routing.module').then(x => x.CommonCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'inscription',
                            loadChildren: () => import('./view/inscription/inscription-collaborator-routing.module').then(x => x.InscriptionCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'price',
                            loadChildren: () => import('./view/price/price-collaborator-routing.module').then(x => x.PriceCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'vocab',
                            loadChildren: () => import('./view/vocab/vocab-collaborator-routing.module').then(x => x.VocabCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'course',
                            loadChildren: () => import('./view/course/course-collaborator-routing.module').then(x => x.CourseCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'freetrial',
                            loadChildren: () => import('./view/freetrial/freetrial-collaborator-routing.module').then(x => x.FreetrialCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'review',
                            loadChildren: () => import('./view/review/review-collaborator-routing.module').then(x => x.ReviewCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'homework',
                            loadChildren: () => import('./view/homework/homework-collaborator-routing.module').then(x => x.HomeworkCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'quizref',
                            loadChildren: () => import('./view/quizref/quizref-collaborator-routing.module').then(x => x.QuizrefCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'quizetudiant',
                            loadChildren: () => import('./view/quizetudiant/quizetudiant-collaborator-routing.module').then(x => x.QuizetudiantCollaboratorRoutingModule),
                            canActivate: [AuthGuard],
                        },
                        {
                            path: 'security',
                            loadChildren: () => import('../security/security-routing.module').then(x => x.SecurityRoutingModule),
                            canActivate: [AuthGuard],
                        }
                    ]
                },
            ]
        ),
    ],
    exports: [RouterModule],
})
export class CollaboratorRoutingModule { }
