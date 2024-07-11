import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {StatutFreeTrialDto} from '../../../model/freetrial/StatutFreeTrial.model';
import {StatutFreeTrialCriteria} from '../../../criteria/freetrial/StatutFreeTrialCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class StatutFreeTrialAdminService extends AbstractService<StatutFreeTrialDto, StatutFreeTrialCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/statutFreeTrial/';
    }

    public constrcutDto(): StatutFreeTrialDto {
        return new StatutFreeTrialDto();
    }

    public constrcutCriteria(): StatutFreeTrialCriteria {
        return new StatutFreeTrialCriteria();
    }
}
