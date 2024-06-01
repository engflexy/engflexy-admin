import { Component } from '@angular/core';
import {Criteria} from "../../../../zynerator/criteria/BaseCriteria.model";
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";
import {PageEvent} from "@angular/material/paginator";

@Component({
  selector: 'app-teachers',
  templateUrl: './teachers.component.html',
  styleUrls: ['./teachers.component.scss']
})
export class TeachersComponent {
    criteria: Criteria<EtudiantDto>

    constructor() {
    }

    handle_pageable_change(event: PageEvent) {

    }
}
