import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ScheduleProfDto} from '../../../model/prof/ScheduleProf.model';
import {ScheduleProfCriteria} from '../../../criteria/prof/ScheduleProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Observable} from "rxjs";
import {Class} from "../../../../modules/admin/schedule/models/Class";
import {GroupeEtudiantDto} from "../../../model/grpe/GroupeEtudiant.model";
import {ProfDto} from "../../../model/prof/Prof.model";


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

    get_schedules_between(start: string, end: string, id: number,
                          group: GroupeEtudiantDto, prof: ProfDto): Observable<Class[]> {
        return this.http.get<Class[]>(this.API + `${id}/between/${start}/${end}`, {
            params: {
                profId: prof?.id ? prof.id : 0,
                groupId: group?.id ? group.id : 0,
            }
        });
    }

    get_group_schedules_between(start, end, id): Observable<Class[]> {
        return this.http.get<Class[]>(this.API + `group/${id}/between/${start}/${end}`);
    }

    updateScheduleTime(schedule: ScheduleProfDto) {
        return this.http.post<boolean>(this.API + `update-schedule-time`, schedule);
    }
}
