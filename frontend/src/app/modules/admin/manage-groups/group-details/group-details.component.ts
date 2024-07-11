import {ChangeDetectorRef, Component, OnInit} from '@angular/core';
import {MatIconModule} from "@angular/material/icon";
import {NgForOf, NgIf} from "@angular/common";
import {MatDialogModule} from "@angular/material/dialog";
import {TranslocoModule} from "@ngneat/transloco";
import {
    GroupeEtudiantDetailCollaboratorService
} from "../../../../shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service";
import {GroupeEtudiantDetailDto} from "../../../../shared/model/grpe/GroupeEtudiantDetail.model";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {FuseConfirmationService} from "../../../../../@fuse/services/confirmation";
import {GroupeEtudiantDto} from "../../../../shared/model/grpe/GroupeEtudiant.model";
import {
    GroupeEtudiantCollaboratorService
} from "../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import {MatButtonModule} from "@angular/material/button";
import {ActivatedRoute, RouterLink} from "@angular/router";

@Component({
    selector: 'app-group-details',
    templateUrl: './group-details.component.html',
    imports: [
        MatIconModule,
        NgForOf,
        NgIf,
        MatDialogModule,
        TranslocoModule,
        MatButtonModule,
        RouterLink
    ],
    standalone: true
})
export class GroupDetailsComponent implements OnInit {
    showMembers: boolean = false

    constructor(private service: GroupeEtudiantDetailCollaboratorService,
                private groupService: GroupeEtudiantCollaboratorService,
                private confirmation: FuseConfirmationService,
                private changeDetector: ChangeDetectorRef,
                private route: ActivatedRoute,
                private alert: FuseAlertService
    ) {
    }

    get item(): GroupeEtudiantDto {
        return this.groupService.item;
    }

    set item(value: GroupeEtudiantDto) {
        this.groupService.item = value;
    }

    get groups(): Array<GroupeEtudiantDetailDto> {
        return this.service.items;
    }

    set groups(value: Array<GroupeEtudiantDetailDto>) {
        this.service.items = value;
    }

    ngOnInit() {
        const id = this.route.snapshot.params['id'];
        if (id && !this.item?.id) {
            this.groupService.findByIdWithAssociatedList(new GroupeEtudiantDto(id))
                .subscribe(res => {
                    this.item = res
                    this.groups = this.item.groupeEtudiantDetails
                    this.changeDetector.markForCheck()
                })
        }
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

        // Subscribe to the confirmation dialog closed action
        confirmation.afterClosed().subscribe((result) => {
            // If the confirmation button pressed...
            if (result === 'confirmed') {
                this.service.delete(item)
                    .subscribe(res => {
                        this.groups.splice(i, 1)
                    }, error => {
                        console.error(error)
                        this.alert.show('info', 'something went wrong, please try again later.');
                    })
            }
        });


    }
}
