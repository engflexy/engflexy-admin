import {Component, OnInit} from '@angular/core';
import {GroupeEtudiantCriteria} from "../../../../shared/criteria/grpe/GroupeEtudiantCriteria.model";
import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatOptionModule} from "@angular/material/core";
import {MatSelectModule} from "@angular/material/select";
import {NgForOf, NgIf} from "@angular/common";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {TranslocoModule} from "@ngneat/transloco";
import {GroupeEtudeDto} from "../../../../shared/model/grpe/GroupeEtude.model";
import {ProfDto} from "../../../../shared/model/prof/Prof.model";
import {ParcoursDto} from "../../../../shared/model/course/Parcours.model";
import {EtudiantDto} from "../../../../shared/model/inscription/Etudiant.model";
import {
    EtudiantCollaboratorService
} from "../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service";
import {
    GroupeEtudeCollaboratorService
} from "../../../../shared/service/collaborator/grpe/GroupeEtudeCollaborator.service";
import {ProfCollaboratorService} from "../../../../shared/service/collaborator/prof/ProfCollaborator.service";
import {ParcoursCollaboratorService} from "../../../../shared/service/collaborator/course/ParcoursCollaborator.service";
import {
    GroupeEtudiantCollaboratorService
} from "../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service";
import {compareObjects} from "../../../../shared/constant/global-funsctions";

@Component({
    selector: 'app-collaborator-group-filter',
    templateUrl: './group-filter.component.html',
})
export class GroupFilterComponent implements OnInit {
    item: GroupeEtudiantCriteria = new GroupeEtudiantCriteria();
    _groupeEtudesFilter: GroupeEtudeDto[];
    _parcourssFilter: ParcoursDto[];
    _profsFilter: ProfDto[];
    _etudiantsFilter: EtudiantDto[];
    selectedEtudiants: Array<EtudiantDto> = new Array<EtudiantDto>()

    constructor(public refDialog: MatDialogRef<GroupFilterComponent>,
                private etudiantService: EtudiantCollaboratorService,
                private groupeEtudeService: GroupeEtudeCollaboratorService,
                private profService: ProfCollaboratorService,
                private parcoursService: ParcoursCollaboratorService,
                private service: GroupeEtudiantCollaboratorService
    ) {
    }

    get groupeEtudes(): Array<GroupeEtudeDto> {
        return this.groupeEtudeService.items;
    }

    set groupeEtudes(value: Array<GroupeEtudeDto>) {
        this.groupeEtudeService.items = value;
    }

    get etudiants(): Array<EtudiantDto> {
        return this.etudiantService.items;
    }

    set etudiants(value: Array<EtudiantDto>) {
        this.etudiantService.items = value;
    }

    get parcourss(): Array<ParcoursDto> {
        return this.parcoursService.items;
    }

    set parcourss(value: Array<ParcoursDto>) {
        this.parcoursService.items = value;
    }

    get profs(): Array<ProfDto> {
        return this.profService.items;
    }

    set profs(value: Array<ProfDto>) {
        this.profService.items = value;
    }

    ngOnInit() {
        this.etudiantService.findAll().subscribe((data) => {
            this.etudiants = data
            this._etudiantsFilter = [...this.etudiants]
            console.log(data)
        });

        this.groupeEtudeService.findAll().subscribe((data) => {
            this.groupeEtudes = data;
            this._groupeEtudesFilter = [...this.groupeEtudes];
        });

        this.parcoursService.findAll().subscribe((data) => {
            this.parcourss = data;
            this._parcourssFilter = [...this.parcourss];
        });
        this.profService.findAll().subscribe((data) => {
            this.profs = data;
            this._profsFilter = [...this.profs];
        });
    }

    filter() {
        this.refDialog.close(this.item)
    }


    displayGroupeEtude(item: GroupeEtudeDto): string {
        return item && item.libelle ? item.libelle : '';
    }

    filterGroupeEtude(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._groupeEtudesFilter = this.groupeEtudes.filter((s) =>
                s.libelle?.toLowerCase()?.includes(value)
            );
        } else {
            this._groupeEtudesFilter = this.groupeEtudes;
        }
    }

    filterStudents(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._etudiantsFilter = this.etudiants.filter((s) =>
                s.fullName?.toLowerCase()?.includes(value) ||
                s.email?.toLowerCase()?.includes(value)
            );
        } else {
            this._etudiantsFilter = this.etudiants;
        }
    }

    displayProf(item: ProfDto): string {
        return item && item.fullName ? item.fullName : '';
    }

    filterProf(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._profsFilter = this.profs.filter((s) =>
                s.fullName?.toLowerCase()?.includes(value)
            );
        } else {
            this._profsFilter = this.profs;
        }
    }


    filterParcours(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._parcourssFilter = this.parcourss.filter((s) =>
                s.libelle?.toLowerCase()?.includes(value)
            );
        } else {
            this._parcourssFilter = this.parcourss;
        }
    }

    displayParcours(item: ParcoursDto): string {
        return item && item.libelle ? item.libelle : '';
    }

    protected readonly compareObjects = compareObjects;

    clearFilter() {
        this.item = new GroupeEtudiantCriteria()
        this.refDialog.close(null);
    }
}
