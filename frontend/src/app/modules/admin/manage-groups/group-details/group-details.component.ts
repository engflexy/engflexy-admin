import {Component, OnInit} from '@angular/core';
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

@Component({
    selector: 'app-group-details',
    templateUrl: './group-details.component.html',
    imports: [
        MatIconModule,
        NgForOf,
        NgIf,
        MatDialogModule,
        TranslocoModule
    ],
    standalone: true
})
export class GroupDetailsComponent implements OnInit {

    constructor(private service: GroupeEtudiantDetailCollaboratorService,
                private confirmation: FuseConfirmationService,
                private alert: FuseAlertService
    ) {
    }

    get groups(): Array<GroupeEtudiantDetailDto> {
        return this.service.items;
    }

    set groups(value: Array<GroupeEtudiantDetailDto>) {
        this.service.items = value;
    }

    ngOnInit() {
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
