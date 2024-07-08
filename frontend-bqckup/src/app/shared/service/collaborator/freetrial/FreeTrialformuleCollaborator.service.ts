import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FreeTrialformuleDto} from '../../../model/freetrial/FreeTrialformule.model';
import {FreeTrialformuleCriteria} from '../../../criteria/freetrial/FreeTrialformuleCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FreeTrialformuleCollaboratorService extends AbstractService<FreeTrialformuleDto, FreeTrialformuleCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/freeTrialformule/';
    }

    public constrcutDto(): FreeTrialformuleDto {
        return new FreeTrialformuleDto();
    }

    public constrcutCriteria(): FreeTrialformuleCriteria {
        return new FreeTrialformuleCriteria();
    }
}
