import { Component } from '@angular/core';
import {Criteria} from "../../../../zynerator/criteria/BaseCriteria.model";
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";
import {PageEvent} from "@angular/material/paginator";

@Component({
  selector: 'app-collaborators',
  templateUrl: './collaborators.component.html',
  styleUrls: ['./collaborators.component.scss']
})
export class CollaboratorsComponent {
    criteria: Criteria<EtudiantDto>

    constructor() {
    }

    handle_pageable_change(event: PageEvent) {

    }
}
