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
import { GroupeEtudiantCollaboratorService } from "../../../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import { GroupeEtudiantDto } from "../../../../../../shared/model/grpe/GroupeEtudiant.model";

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
    isLoading: boolean = true;
    totalCourses: number = 0;
    completedCourses: number = 0;
    upcomingCourses: number = 0;
    statisticEtudiant: StatisticEtudiant;
    groupes: Array<GroupeEtudiantDetailDto> = [];
    selectedGroup: GroupeEtudiantDto = null;

    constructor(
        private groupService: GroupeEtudiantCollaboratorService,
        private service: GroupeEtudiantDetailCollaboratorService,
        private confirmation: FuseConfirmationService,
        private cdr: ChangeDetectorRef,
        private zone: NgZone
    ) {}

    ngOnInit(): void {
        setTimeout(() => {
            if (this.user && Array.isArray(this.user.inscriptions)) {
                this.user.inscriptions.forEach(s => {
                    if (s?.etatInscription?.libelle !== 'Pending') {
                        this.total += s.packStudent?.price?.price || 0;
                        this.totalCourses++;
                        if (s?.etatInscription?.libelle === 'Completed') {
                            this.completedCourses++;
                        } else if (s?.etatInscription?.libelle === 'Upcoming') {
                            this.upcomingCourses++;
                        }
                    }
                });
            }

            this.isLoading = false;
            this.cdr.markForCheck();

            if (this.user?.id) {
                this.calculateStatistics(this.user.id);
                this.loadGroupes(this.user.id);
            }
        }, 2000);
    }

    loadGroupes(idEtudiant: number): void {
        this.isLoading = true;
        this.service.getGroupesByEtudiantId(idEtudiant).subscribe(
            (data: GroupeEtudiantDetailDto[]) => {
                this.zone.run(() => {
                    this.groupes = data;
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

    get item(): GroupeEtudiantDto {
        return this.groupService.item;
    }

    set item(value: GroupeEtudiantDto) {
        this.groupService.item = value;
    }

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

        confirmation.afterClosed().subscribe(result => {
            if (result === 'confirmed') {
                // Logic to delete the student from the group
            }
        });
    }

    onGroupSelect(group: GroupeEtudiantDto) {
        this.selectedGroup = group;
    }

}
