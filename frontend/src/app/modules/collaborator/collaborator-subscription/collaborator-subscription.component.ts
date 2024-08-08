import {Component} from '@angular/core';
import {
    PackStudentCollaboratorService
} from "../../../shared/service/collaborator/pack/PackStudentCollaborator.service";
import {PackStudentDto} from "../../../shared/model/pack/PackStudent.model";
import {
    PackageCollaboratorCollaboratorService
} from "../../../shared/service/collaborator/collab/PackageCollaboratorCollaborator.service";
import {PackageCollaboratorDto} from "../../../shared/model/collab/PackageCollaborator.model";
import {
    InscriptionCollaboratorCollaboratorService
} from "../../../shared/service/collaborator/collab/InscriptionCollaboratorCollaborator.service";
import {InscriptionCollaboratorDto} from "../../../shared/model/collab/InscriptionCollaborator.model";

@Component({
    selector: 'app-collaborator-subscription',
    templateUrl: './collaborator-subscription.component.html',
})
export class CollaboratorSubscriptionComponent {
    pachageCollaborators: Array<PackageCollaboratorDto> = [];

    constructor(private packService: PackageCollaboratorCollaboratorService,
                private service: InscriptionCollaboratorCollaboratorService) {
    }

    inscriptionCollaboratorDto: InscriptionCollaboratorDto;

    ngOnInit(): void {
        this.packService.findAll().subscribe(pachageCollaborators => {
            this.pachageCollaborators = pachageCollaborators;
        });
        this.service.findForCurrentCollaborator().subscribe(packageCollaboratorDto => {
            this.inscriptionCollaboratorDto = packageCollaboratorDto;
        });
    }

    increment() {
        var index = this.pachageCollaborators.findIndex(e => e.nbrStudentBase > this.inscriptionCollaboratorDto.packageCollaborator.nbrStudentBase);
        if (index != -1)
            this.inscriptionCollaboratorDto.packageCollaborator = this.pachageCollaborators[index]

    }

    decrement() {
        var index = this.pachageCollaborators.findIndex(e => e.nbrStudentBase < this.inscriptionCollaboratorDto.packageCollaborator.nbrStudentBase);
        if (index != -1)
            this.inscriptionCollaboratorDto.packageCollaborator = this.pachageCollaborators[index]

    }


}
