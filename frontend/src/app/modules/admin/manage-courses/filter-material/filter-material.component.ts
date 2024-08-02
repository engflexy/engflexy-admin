import { Component } from '@angular/core';
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";
import {ParcoursDto} from "../../../../shared/model/course/Parcours.model";
import {EtatInscriptionDto} from "../../../../shared/model/inscriptionref/EtatInscription.model";
import {GroupeEtudeDto} from "../../../../shared/model/grpe/GroupeEtude.model";
import {PackStudentDto} from "../../../../shared/model/pack/PackStudent.model";
import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {ParcoursCollaboratorService} from "../../../../shared/service/collaborator/course/ParcoursCollaborator.service";
import {
    PackStudentCollaboratorService
} from "../../../../shared/service/collaborator/pack/PackStudentCollaborator.service";
import {
    EtatInscriptionCollaboratorService
} from "../../../../shared/service/collaborator/inscriptionref/EtatInscriptionCollaborator.service";
import {
    GroupeEtudeCollaboratorService
} from "../../../../shared/service/collaborator/grpe/GroupeEtudeCollaborator.service";
import {
    EtudiantCollaboratorService
} from "../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {
    InscriptionCollaboratorService
} from "../../../../shared/service/collaborator/grpe/InscriptionCollaborator.service";
import {InscriptionDto} from "../../../../shared/model/grpe/Inscription.model";
import {MatButtonModule} from "@angular/material/button";
import {MatSelectModule} from "@angular/material/select";
import {FormsModule} from "@angular/forms";
import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatInputModule} from "@angular/material/input";
import {ParcoursCriteria} from "../../../../shared/criteria/course/ParcoursCriteria.model";
import {DatePipe, NgForOf} from "@angular/common";

@Component({
    selector: 'app-filter-material',
    templateUrl: './filter-material.component.html',
    standalone: true,
    imports: [
        MatDialogModule,
        MatButtonModule,
        MatSelectModule,
        FormsModule,
        MatAutocompleteModule,
        MatInputModule,
        DatePipe,
        NgForOf
    ]
})
export class FilterMaterialComponent {

    parcourItems: Array<ParcoursDto> = [];

    constructor(
        private auth: AuthService,
        private alert: FuseAlertService,
        private parcoursService: ParcoursCollaboratorService,
        public refDialog: MatDialogRef<FilterMaterialComponent>,
    ) {
    }

    get item(): ParcoursDto {
        return this.parcoursService.item
    }

    set item(item: ParcoursDto) {
        this.parcoursService.item = item
    }

    get items(): Array<ParcoursDto> {
        return this.parcoursService.items
    }

    set items(items: Array<ParcoursDto>) {
        this.parcoursService.items = items
    }


    ngOnInit() {
        this.parcoursService.findAllOptimized().subscribe(
            (data) => {
                this.items = data;
                this.parcourItems = [...data];
            },
            (error) => {
                this.alert.show('Error','Error fetching data');
            }
        );
    }

    // filter(value: string, type: string) {
    //     if (value && value.length > 0) {
    //         if (type === 'DATECREATION') {
    //             const filterDate = new Date(value);
    //             this.items = this.parcourItems.filter(s => {
    //                 const itemDate = new Date(s.dateCreation);
    //                 return itemDate.toDateString() === filterDate.toDateString();
    //             });
    //         } else if (type === 'CODE') {
    //             const lowerValue = value.toLowerCase();
    //             this.items = this.parcourItems.filter(s => s.code?.toLowerCase().includes(lowerValue));
    //         }
    //     } else {
    //         this.items = [...this.parcourItems];
    //     }
    // }

    displayFn(item: ParcoursDto): string {
        return item && item.libelle ? item.libelle : '';
    }



    applyFilter() {
        this.refDialog.close(this.item);
    }

}
