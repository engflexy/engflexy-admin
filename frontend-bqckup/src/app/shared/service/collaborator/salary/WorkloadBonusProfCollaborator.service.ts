import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {WorkloadBonusProfDto} from '../../../model/salary/WorkloadBonusProf.model';
import {WorkloadBonusProfCriteria} from '../../../criteria/salary/WorkloadBonusProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class WorkloadBonusProfCollaboratorService extends AbstractService<WorkloadBonusProfDto, WorkloadBonusProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/workloadBonusProf/';
    }

    public constrcutDto(): WorkloadBonusProfDto {
        return new WorkloadBonusProfDto();
    }

    public constrcutCriteria(): WorkloadBonusProfCriteria {
        return new WorkloadBonusProfCriteria();
    }
}
