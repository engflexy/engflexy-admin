import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {WorkloadBonusDto} from '../../../model/salary/WorkloadBonus.model';
import {WorkloadBonusCriteria} from '../../../criteria/salary/WorkloadBonusCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class WorkloadBonusAdminService extends AbstractService<WorkloadBonusDto, WorkloadBonusCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/workloadBonus/';
    }

    public constrcutDto(): WorkloadBonusDto {
        return new WorkloadBonusDto();
    }

    public constrcutCriteria(): WorkloadBonusCriteria {
        return new WorkloadBonusCriteria();
    }
}
