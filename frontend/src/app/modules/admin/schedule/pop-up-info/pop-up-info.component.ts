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
                this.dialogRef.close(classe)
            } else {
                this.dialogRef.close(null)
            }
        })

    }

    delete() {

        // const confirmation = this._fuseConfirmation.open({
        //     title: 'delete inscription',
        //     message: 'Are you sure you want to remove this inscription?',
        //     actions: {
        //         confirm: {
        //             label: 'REMOVE',
        //         },
        //     },
        // });
        //
        // // Subscribe to the confirmation dialog closed action
        // confirmation.afterClosed().subscribe((result) => {
        //
        // }
    }
}
