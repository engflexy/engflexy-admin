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
        @Inject(MAT_DIALOG_DATA) public data: Class,
    ) {
    }


    edit() {
        this.dialog.open(ScheduleProfEditComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        this.dialogRef.close(null)
    }
}
