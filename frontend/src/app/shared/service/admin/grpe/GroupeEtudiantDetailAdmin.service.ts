import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {GroupeEtudiantDetailDto} from '../../../model/grpe/GroupeEtudiantDetail.model';
import {GroupeEtudiantDetailCriteria} from '../../../criteria/grpe/GroupeEtudiantDetailCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Observable} from "rxjs";


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

    public findByGroupeEtudiantId(id: number):Observable<Array<GroupeEtudiantDetailDto>>   {
        return this.httpClient.get<Array<GroupeEtudiantDetailDto>>(this.API+'groupeEtudiant/id/'+id)
    }

    public constrcutDto(): GroupeEtudiantDetailDto {
        return new GroupeEtudiantDetailDto();
    }

    public constrcutCriteria(): GroupeEtudiantDetailCriteria {
        return new GroupeEtudiantDetailCriteria();
    }
}
