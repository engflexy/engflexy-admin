import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {InviteStudentDto} from '../../../model/inscriptionref/InviteStudent.model';
import {InviteStudentCriteria} from '../../../criteria/inscriptionref/InviteStudentCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class InviteStudentCollaboratorService extends AbstractService<InviteStudentDto, InviteStudentCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/inviteStudent/';
    }

    public constrcutDto(): InviteStudentDto {
        return new InviteStudentDto();
    }

    public constrcutCriteria(): InviteStudentCriteria {
        return new InviteStudentCriteria();
    }
}
