import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {TypeCollaboratorDto} from '../../../model/prof/TypeCollaborator.model';
import {TypeCollaboratorCriteria} from '../../../criteria/prof/TypeCollaboratorCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class TypeCollaboratorAdminService extends AbstractService<TypeCollaboratorDto, TypeCollaboratorCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/typeCollaborator/';
    }

    public constrcutDto(): TypeCollaboratorDto {
        return new TypeCollaboratorDto();
    }

    public constrcutCriteria(): TypeCollaboratorCriteria {
        return new TypeCollaboratorCriteria();
    }
}
