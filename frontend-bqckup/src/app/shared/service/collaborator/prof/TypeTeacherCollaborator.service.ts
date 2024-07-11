import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {TypeTeacherDto} from '../../../model/prof/TypeTeacher.model';
import {TypeTeacherCriteria} from '../../../criteria/prof/TypeTeacherCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class TypeTeacherCollaboratorService extends AbstractService<TypeTeacherDto, TypeTeacherCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/typeTeacher/';
    }

    public constrcutDto(): TypeTeacherDto {
        return new TypeTeacherDto();
    }

    public constrcutCriteria(): TypeTeacherCriteria {
        return new TypeTeacherCriteria();
    }
}
