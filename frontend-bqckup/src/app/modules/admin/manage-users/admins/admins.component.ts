import {Component} from '@angular/core';
import {Criteria} from "../../../../zynerator/criteria/BaseCriteria.model";
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";
import {PageEvent} from "@angular/material/paginator";

@Component({
    selector: 'app-admins',
    templateUrl: './admins.component.html',
    styleUrls: ['./admins.component.scss']
})
export class AdminsComponent {
    criteria: Criteria<EtudiantDto>

    constructor() {
    }

    handle_pageable_change(event: PageEvent) {

    }
}
