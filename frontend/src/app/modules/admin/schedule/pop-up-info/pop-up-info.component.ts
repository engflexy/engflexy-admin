import {Component, Inject} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialog, MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {FormsModule} from "@angular/forms";
import {MatButtonModule} from "@angular/material/button";
import {DatePipe} from "@angular/common";
import {MatIconModule} from "@angular/material/icon";
import {Class} from "../models/Class";
import {ScheduleProfEditComponent} from "../edit/schedule-prof-edit.component";
import {FuseConfirmationService} from "../../../../../@fuse/services/confirmation";
import {
    ScheduleProfCollaboratorService
} from "../../../../shared/service/collaborator/prof/ScheduleProfCollaborator.service";
import {ScheduleProfDto} from "../../../../shared/model/prof/ScheduleProf.model";
import {FuseAlertService} from "../../../../../@fuse/components/alert";

@Component({
    selector: 'app-pop-up-info',
    templateUrl: './pop-up-info.component.html',
    standalone: true,
    imports: [MatDialogModule, MatFormFieldModule, MatInputModule, FormsModule, MatButtonModule, DatePipe, MatIconModule],
})
export class PopUpInfoComponent {

    constructor(
        public dialogRef: MatDialogRef<PopUpInfoComponent>,
        private dialog: MatDialog,
        private service: ScheduleProfCollaboratorService,
        private alert: FuseAlertService,
        private confirmation: FuseConfirmationService,
        @Inject(MAT_DIALOG_DATA) public data: Class,
    ) {
    }


    edit() {
        const dialog = this.dialog.open(ScheduleProfEditComponent, {
            data: this.data,
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe(res => {
            if (res !== null) {
                console.log(res)
                const classe: Class = new Class();
                classe.id = res.id;
                classe.end = res.endTime;
                classe.start = res.startTime;
                classe.title = res.cours.libelle;
                classe.group = res.groupeEtudiant.libelle;
                classe.teacher = res.prof.fullName;
                this.data = classe
                this.dialogRef.close({data: classe, type: 'create'})
            } else {
                this.dialogRef.close(null)
            }
        })

    }

    delete() {

        const confirmation = this.confirmation.open({
            title: 'delete class',
            message: 'Are you sure you want to remove this class ?',
            actions: {
                confirm: {
                    label: 'REMOVE',
                },
            },
        });

        // Subscribe to the confirmation dialog closed action
        confirmation.afterClosed().subscribe((result) => {
            this.service.delete(new ScheduleProfDto(this.data.id))
                .subscribe(res => {
                    this.alert.show('success', `Class deleted successfully.`);
                    this.dialogRef.close({data: this.data, type: 'remove'})
                }, error => {
                    console.error(error)
                    this.alert.show('info', `something went wrong, please try again.`);
                })
        })
    }
}
