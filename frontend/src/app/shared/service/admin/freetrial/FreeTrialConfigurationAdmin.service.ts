import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FreeTrialConfigurationDto} from '../../../model/freetrial/FreeTrialConfiguration.model';
import {FreeTrialConfigurationCriteria} from '../../../criteria/freetrial/FreeTrialConfigurationCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FreeTrialConfigurationAdminService extends AbstractService<FreeTrialConfigurationDto, FreeTrialConfigurationCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/freeTrialConfiguration/';
    }

    public constrcutDto(): FreeTrialConfigurationDto {
        return new FreeTrialConfigurationDto();
    }

    public constrcutCriteria(): FreeTrialConfigurationCriteria {
        return new FreeTrialConfigurationCriteria();
    }
}
