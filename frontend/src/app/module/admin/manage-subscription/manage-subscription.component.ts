import {Component, OnInit} from '@angular/core';
import {MenuItem} from "primeng/api";

@Component({
    selector: 'app-manage-subscription',
    templateUrl: './manage-subscription.component.html',
    styleUrls: ['./manage-subscription.component.scss']
})
export class ManageSubscriptionComponent implements OnInit {

    items: MenuItem[] | undefined;
    home: MenuItem | undefined;

    constructor() {
    }


    ngOnInit() {
        this.items = [{label: 'Computer'}, {label: 'Notebook'}, {label: 'Accessories'}, {label: 'Backpacks'}, {label: 'Item'}];

        this.home = {icon: 'pi pi-home', routerLink: '/'};
    }
}
