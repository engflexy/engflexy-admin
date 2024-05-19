import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {GroupeEtudiantDetailDto} from '../../../model/grpe/GroupeEtudiantDetail.model';
import {GroupeEtudiantDetailCriteria} from '../../../criteria/grpe/GroupeEtudiantDetailCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class GroupeEtudiantDetailAdminService extends AbstractService<GroupeEtudiantDetailDto, GroupeEtudiantDetailCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/groupeEtudiantDetail/';
    }

    public constrcutDto(): GroupeEtudiantDetailDto {
        return new GroupeEtudiantDetailDto();
    }

    public constrcutCriteria(): GroupeEtudiantDetailCriteria {
        return new GroupeEtudiantDetailCriteria();
    }
}
