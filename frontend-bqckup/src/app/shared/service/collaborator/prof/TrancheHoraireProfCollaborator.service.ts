import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {TrancheHoraireProfDto} from '../../../model/prof/TrancheHoraireProf.model';
import {TrancheHoraireProfCriteria} from '../../../criteria/prof/TrancheHoraireProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class TrancheHoraireProfCollaboratorService extends AbstractService<TrancheHoraireProfDto, TrancheHoraireProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/trancheHoraireProf/';
    }

    public constrcutDto(): TrancheHoraireProfDto {
        return new TrancheHoraireProfDto();
    }

    public constrcutCriteria(): TrancheHoraireProfCriteria {
        return new TrancheHoraireProfCriteria();
    }
}
