import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {TypeHomeWorkDto} from '../../../model/homework/TypeHomeWork.model';
import {TypeHomeWorkCriteria} from '../../../criteria/homework/TypeHomeWorkCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class TypeHomeWorkCollaboratorService extends AbstractService<TypeHomeWorkDto, TypeHomeWorkCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/typeHomeWork/';
    }

    public constrcutDto(): TypeHomeWorkDto {
        return new TypeHomeWorkDto();
    }

    public constrcutCriteria(): TypeHomeWorkCriteria {
        return new TypeHomeWorkCriteria();
    }
}
