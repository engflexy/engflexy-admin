import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {SessionCoursDto} from '../../../model/learning/SessionCours.model';
import {SessionCoursCriteria} from '../../../criteria/learning/SessionCoursCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class SessionCoursCollaboratorService extends AbstractService<SessionCoursDto, SessionCoursCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/sessionCours/';
    }

    public constrcutDto(): SessionCoursDto {
        return new SessionCoursDto();
    }

    public constrcutCriteria(): SessionCoursCriteria {
        return new SessionCoursCriteria();
    }
}
