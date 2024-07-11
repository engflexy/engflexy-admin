import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {GroupeTypeDto} from '../../../model/grpe/GroupeType.model';
import {GroupeTypeCriteria} from '../../../criteria/grpe/GroupeTypeCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class GroupeTypeCollaboratorService extends AbstractService<GroupeTypeDto, GroupeTypeCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/groupeType/';
    }

    public constrcutDto(): GroupeTypeDto {
        return new GroupeTypeDto();
    }

    public constrcutCriteria(): GroupeTypeCriteria {
        return new GroupeTypeCriteria();
    }
}
