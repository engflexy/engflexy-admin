import {ChangeDetectorRef, Component, OnInit} from '@angular/core';

@Component({
    selector: 'app-manage-users',
    templateUrl: './manage-users.component.html',
})
export class ManageUsersComponent implements OnInit{

    ngOnInit() {
        this.changeDetector.detectChanges();

    }
    constructor(private changeDetector: ChangeDetectorRef,) {

    }
}
