import {
    ChangeDetectionStrategy,
    ChangeDetectorRef,
    Component,
    Input,
    NgZone,
    OnInit,
    ViewEncapsulation
} from '@angular/core';
import { EtudiantDto } from "../../../../../../shared/model/inscription/Etudiant.model";
import { GroupeEtudiantDetailDto } from "../../../../../../shared/model/grpe/GroupeEtudiantDetail.model";
import { GroupeEtudiantDetailCollaboratorService } from "../../../../../../shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service";
import { FuseConfirmationService } from "../../../../../../../@fuse/services/confirmation";
import { StatisticEtudiant } from "../../../../../../shared/model/grpe/StatisticEtudiant.model";
import {
    GroupeEtudiantCollaboratorService
} from "../../../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import {GroupeEtudiantDto} from "../../../../../../shared/model/grpe/GroupeEtudiant.model";

@Component({
    selector: 'settings-team',
    templateUrl: './statistics.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class SettingsTeamComponent implements OnInit {
    @Input()
    user: EtudiantDto = new EtudiantDto();
    current: Date = new Date();
    total: number = 0;
    userCurrency: string = 'MAD';
    showSchedule: boolean = false;
    isLoading: boolean = true; // Variable de contrôle pour l'état de chargement
    totalCourses: number = 0;
    completedCourses: number = 0;
    upcomingCourses: number = 0;
    statisticEtudiant: StatisticEtudiant;
    groupes: Array<GroupeEtudiantDetailDto> = []; // Liste des groupes
    selectedGroup: GroupeEtudiantDto = null;
    /**
     * Constructor
     */
    constructor(
        private groupService: GroupeEtudiantCollaboratorService,
        private service: GroupeEtudiantDetailCollaboratorService,
        private confirmation: FuseConfirmationService,
        private cdr: ChangeDetectorRef,
        private zone: NgZone
    ) {}

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        // Simulate data loading
        setTimeout(() => {
            // Check if user and inscriptions are defined
            if (this.user && Array.isArray(this.user.inscriptions)) {
                this.user.inscriptions.forEach(s => {
                    if (s?.etatInscription?.libelle !== 'Pending') {
                        this.total += s.packStudent?.price?.price || 0; // Use a default value if price is undefined
                        this.totalCourses++;
                        if (s?.etatInscription?.libelle === 'Completed') {
                            this.completedCourses++;
                        } else if (s?.etatInscription?.libelle === 'Upcoming') {
                            this.upcomingCourses++;
                        }
                    }
                });
            }

            this.isLoading = false; // Update loading state once data is loaded
            this.cdr.markForCheck();
            // Call calculateStatistics with the dynamic user ID
            if (this.user?.id) {
                this.calculateStatistics(this.user.id);
                this.loadGroupes(this.user.id); // Charge les groupes
            }
        }, 2000); // Simulate 2 seconds of loading time
    }

    /**
     * Méthode pour charger les groupes par ID d'étudiant
     */
    loadGroupes(idEtudiant: number): void {
        this.isLoading = true;
        this.service.getGroupesByEtudiantId(idEtudiant).subscribe(
            (data: GroupeEtudiantDetailDto[]) => {
              /*  console.log('Nombre de groupes reçus:', data.length);
                console.log('Groupes reçus (détaillé):', JSON.stringify(data, null, 2));*/


                this.zone.run(() => {
                    this.groupes = data;
/*
                    console.log('Nombre de groupes après assignation:', this.groupes.length);
*/ console.log('Groupes Data:', this.groupes);

                    this.isLoading = false;
                    this.cdr.detectChanges();
                });
            },
            (error) => {
                console.error('Error fetching groups', error);
                this.isLoading = false;
            }
        );
    }

    /**
     * Méthode pour calculer les statistiques
     */
    calculateStatistics(idEtudiant: number): void {
        this.isLoading = true;
        this.groupService.calculateStat(idEtudiant).subscribe(
            (data: StatisticEtudiant) => {
                this.statisticEtudiant = data;
                this.isLoading = false;
                this.cdr.detectChanges();
            },
            (error) => {
                console.error('Error fetching statistics', error);
                this.isLoading = false;
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
            title: 'Remove student from group',
            message: 'Are you sure you want to remove the student from group?',
            actions: {
                confirm: {
                    label: 'REMOVE',
                },
            },
        });
    }
    onGroupSelect(group: GroupeEtudiantDto) {
        this.selectedGroup = group;
    }


}
