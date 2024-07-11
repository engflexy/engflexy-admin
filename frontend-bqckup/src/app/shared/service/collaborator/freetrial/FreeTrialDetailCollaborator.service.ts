import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FreeTrialDetailDto} from '../../../model/freetrial/FreeTrialDetail.model';
import {FreeTrialDetailCriteria} from '../../../criteria/freetrial/FreeTrialDetailCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FreeTrialDetailCollaboratorService extends AbstractService<FreeTrialDetailDto, FreeTrialDetailCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/freeTrialDetail/';
    }

    public constrcutDto(): FreeTrialDetailDto {
        return new FreeTrialDetailDto();
    }

    public constrcutCriteria(): FreeTrialDetailCriteria {
        return new FreeTrialDetailCriteria();
    }
}
