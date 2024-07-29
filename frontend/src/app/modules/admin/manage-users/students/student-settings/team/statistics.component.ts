import { ChangeDetectionStrategy, Component, Input, OnInit, ViewEncapsulation } from '@angular/core';
import { EtudiantDto } from "../../../../../../shared/model/inscription/Etudiant.model";
import { GroupeEtudiantDto } from "../../../../../../shared/model/grpe/GroupeEtudiant.model";
import {
    GroupeEtudiantCollaboratorService
} from "../../../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import { GroupeEtudiantDetailDto } from "../../../../../../shared/model/grpe/GroupeEtudiantDetail.model";
import {
    GroupeEtudiantDetailCollaboratorService
} from "../../../../../../shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service";
import { FuseConfirmationService } from "../../../../../../../@fuse/services/confirmation";
import {StatisticEtudiant} from "../../../../../../shared/model/grpe/StatisticEtudiant.model";

@Component({
    selector: 'settings-team',
    templateUrl: './statistics.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class SettingsTeamComponent implements OnInit {
    @Input()
    user: EtudiantDto = new EtudiantDto()
    current: Date = new Date();
    total: number = 0
    userCurrency: string = 'MAD'
    showSchedule: boolean = false;
    isLoading: boolean = true; // Variable de contrôle pour l'état de chargement
    totalCourses: number = 0;
    completedCourses: number = 0;
    upcomingCourses: number = 0;
    statisticEtudiant: StatisticEtudiant;
    /**
     * Constructor
     */
    constructor(private groupService: GroupeEtudiantCollaboratorService,
                private service: GroupeEtudiantDetailCollaboratorService,
                private groupeEtudiantCollaboratorService: GroupeEtudiantCollaboratorService,
                private confirmation: FuseConfirmationService) {
    }

    get groups(): Array<GroupeEtudiantDetailDto> {
        return this.service.items;
    }

    set groups(value: Array<GroupeEtudiantDetailDto>) {
        this.service.items = value;
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        // Simuler le chargement des données
        setTimeout(() => {
            this.user?.inscriptions.forEach(s => {
                if (s?.etatInscription?.libelle !== 'Pending') {
                    this.total += s.packStudent?.price?.price;
                    this.totalCourses++;
                    if (s?.etatInscription?.libelle === 'Completed') {
                        this.completedCourses++;
                    } else if (s?.etatInscription?.libelle === 'Upcoming') {
                        this.upcomingCourses++;
                    }
                }
            });
            this.isLoading = false; // Mettre à jour l'état de chargement une fois les données chargées

            // Call calculateStatistics with the dynamic user ID
            if (this.user?.id) {
                this.calculateStatistics(this.user.id);
            }
        }, 2000); // Par exemple, 2 secondes de délai pour simuler le chargement
    }

    calculateStatistics(idEtudiant: number): void {
        this.groupeEtudiantCollaboratorService.calculateStat(idEtudiant).subscribe(
            (data: StatisticEtudiant) => {
                this.statisticEtudiant = data;
                console.log('Statistics for Etudiant ID:', idEtudiant);
                console.log('Total Courses:', data.nreCourses);
                console.log('Courses Coming:', data.nreCoursesComing);
                console.log('Courses Completed:', data.nreCoursesCompleted);
            },
            (error) => {
                console.error('Error fetching statistics', error);
            }
        );
    }



    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------
    get item(): GroupeEtudiantDto {
        return this.groupService.item;
    }

    set item(value: GroupeEtudiantDto) {
        this.groupService.item = value;
    }

    /**
     * Track by function for ngFor loops
     *
     * @param index
     * @param item
     */
    trackByFn(index: number, item: any): any {
        return item.id || index;
    }

    deleteStudent(item: GroupeEtudiantDetailDto, i: number) {
        const confirmation = this.confirmation.open({
            title: 'remove student from group',
            message: 'Are you sure you want to remove the student from group ?',
            actions: {
                confirm: {
                    label: 'REMOVE',
                },
            },
        });
    }


}
