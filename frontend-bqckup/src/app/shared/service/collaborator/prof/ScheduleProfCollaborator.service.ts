import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ScheduleProfDto} from '../../../model/prof/ScheduleProf.model';
import {ScheduleProfCriteria} from '../../../criteria/prof/ScheduleProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Observable} from "rxjs";
import {Class} from "../../../../modules/admin/schedule/models/Class";


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

    get_nearest_lesson(id: number): Observable<ScheduleProfDto> {
        return this.http.get<ScheduleProfDto>(this.API + `nearest-lesson/${id}`);
    }

    get_group_nearest_lesson(id: number): Observable<ScheduleProfDto> {
        return this.http.get<ScheduleProfDto>(this.API + `nearest-lesson/group/${id}`);
    }

    get_schedules_between(start: string, end: string, id: number): Observable<Class[]> {
        return this.http.get<Class[]>(this.API + `${id}/between/${start}/${end}`);
    }

    get_group_schedules_between(start, end, id): Observable<Class[]> {
        return this.http.get<Class[]>(this.API + `group/${id}/between/${start}/${end}`);
    }
}
