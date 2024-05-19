import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ScheduleProfDto} from '../../../model/prof/ScheduleProf.model';
import {ScheduleProfCriteria} from '../../../criteria/prof/ScheduleProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ScheduleProfCollaboratorService extends AbstractService<ScheduleProfDto, ScheduleProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/scheduleProf/';
    }

    public constrcutDto(): ScheduleProfDto {
        return new ScheduleProfDto();
    }

    public constrcutCriteria(): ScheduleProfCriteria {
        return new ScheduleProfCriteria();
    }
}
