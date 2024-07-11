import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {GroupeEtudeDto} from '../../../model/grpe/GroupeEtude.model';
import {GroupeEtudeCriteria} from '../../../criteria/grpe/GroupeEtudeCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class GroupeEtudeCollaboratorService extends AbstractService<GroupeEtudeDto, GroupeEtudeCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/groupeEtude/';
    }

    public constrcutDto(): GroupeEtudeDto {
        return new GroupeEtudeDto();
    }

    public constrcutCriteria(): GroupeEtudeCriteria {
        return new GroupeEtudeCriteria();
    }
}
