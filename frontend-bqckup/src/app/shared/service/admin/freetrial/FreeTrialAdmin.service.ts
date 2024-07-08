import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FreeTrialDto} from '../../../model/freetrial/FreeTrial.model';
import {FreeTrialCriteria} from '../../../criteria/freetrial/FreeTrialCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FreeTrialAdminService extends AbstractService<FreeTrialDto, FreeTrialCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/freeTrial/';
    }

    public constrcutDto(): FreeTrialDto {
        return new FreeTrialDto();
    }

    public constrcutCriteria(): FreeTrialCriteria {
        return new FreeTrialCriteria();
    }
}
