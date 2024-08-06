import {Component} from '@angular/core';
import {
    PackStudentCollaboratorService
} from "../../../shared/service/collaborator/pack/PackStudentCollaborator.service";
import {PackStudentDto} from "../../../shared/model/pack/PackStudent.model";

@Component({
    selector: 'app-collaborator-subscription',
    templateUrl: './collaborator-subscription.component.html'
})
export class CollaboratorSubscriptionComponent {

    constructor( private   privatpackStudentDto: PackStudentDto) {
    }

    ngOnInit(): void {
        this.privatpackStudentDto = new PackStudentDto();
    }
}
