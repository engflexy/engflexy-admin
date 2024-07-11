import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {SessionCoursSectionDto} from '../../../model/learning/SessionCoursSection.model';
import {SessionCoursSectionCriteria} from '../../../criteria/learning/SessionCoursSectionCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class SessionCoursSectionCollaboratorService extends AbstractService<SessionCoursSectionDto, SessionCoursSectionCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/sessionCoursSection/';
    }

    public constrcutDto(): SessionCoursSectionDto {
        return new SessionCoursSectionDto();
    }

    public constrcutCriteria(): SessionCoursSectionCriteria {
        return new SessionCoursSectionCriteria();
    }
}
