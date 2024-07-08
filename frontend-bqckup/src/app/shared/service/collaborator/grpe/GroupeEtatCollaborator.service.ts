import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {GroupeEtatDto} from '../../../model/grpe/GroupeEtat.model';
import {GroupeEtatCriteria} from '../../../criteria/grpe/GroupeEtatCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class GroupeEtatCollaboratorService extends AbstractService<GroupeEtatDto, GroupeEtatCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/groupeEtat/';
    }

    public constrcutDto(): GroupeEtatDto {
        return new GroupeEtatDto();
    }

    public constrcutCriteria(): GroupeEtatCriteria {
        return new GroupeEtatCriteria();
    }
}
