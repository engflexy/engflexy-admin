import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {TeacherLocalityDto} from '../../../model/inscriptionref/TeacherLocality.model';
import {TeacherLocalityCriteria} from '../../../criteria/inscriptionref/TeacherLocalityCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class TeacherLocalityCollaboratorService extends AbstractService<TeacherLocalityDto, TeacherLocalityCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/teacherLocality/';
    }

    public constrcutDto(): TeacherLocalityDto {
        return new TeacherLocalityDto();
    }

    public constrcutCriteria(): TeacherLocalityCriteria {
        return new TeacherLocalityCriteria();
    }
}
