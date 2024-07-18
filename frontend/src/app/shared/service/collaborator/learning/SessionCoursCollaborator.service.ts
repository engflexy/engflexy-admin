import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {SessionCoursDto} from '../../../model/learning/SessionCours.model';
import {SessionCoursCriteria} from '../../../criteria/learning/SessionCoursCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {PaginatedList} from "../../../../zynerator/dto/PaginatedList.model";
import {Observable} from "rxjs";
import {SessionSalary} from "../../../../core/criteria/Session-Salary";
import {Pageable} from "../../../utils/Pageable";
import {Criteria} from "../../../../zynerator/criteria/BaseCriteria.model";


@Injectable({
    providedIn: 'root'
})
export class SessionCoursCollaboratorService extends AbstractService<SessionCoursDto, SessionCoursCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/sessionCours/';
    }

    public constrcutDto(): SessionCoursDto {
        return new SessionCoursDto();
    }

    public constrcutCriteria(): SessionCoursCriteria {
        return new SessionCoursCriteria();
    }

    get_sessions_by_salary(id: number, pageable:Pageable): Observable<Criteria<SessionSalary>> {
        return this.http.get<Criteria<SessionSalary>>(this.API + 'pageabale/salary/' + id, {
            params: {
                'page': pageable.page,
                'size': pageable.size
            }
        });
    }
}
