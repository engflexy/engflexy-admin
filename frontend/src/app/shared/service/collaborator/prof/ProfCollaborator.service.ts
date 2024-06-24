import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ProfDto} from '../../../model/prof/Prof.model';
import {ProfCriteria} from '../../../criteria/prof/ProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Pageable} from "../../../utils/Pageable";
import {Observable} from "rxjs";
import {Criteria} from "../../../../zynerator/criteria/BaseCriteria.model";
import {UserCriteria} from "../../../../core/criteria/user-criteria";


@Injectable({
    providedIn: 'root'
})
export class ProfCollaboratorService extends AbstractService<ProfDto, ProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/prof/';
    }

    public constrcutDto(): ProfDto {
        return new ProfDto();
    }

    public constrcutCriteria(): ProfCriteria {
        return new ProfCriteria();
    }

    findByCollaboratorId(id: number, pageable: Pageable): Observable<Criteria<UserCriteria>> {
        return this.http.get<Criteria<UserCriteria>>(this.API + `pageable/collaborator/id/${id}`,
            {
                params: {
                    'page': pageable.page,
                    'size': pageable.size
                }
            });
    }

    update(user: ProfDto): Observable<ProfDto> {
        return this.http.put<ProfDto>(this.API, user);
    }
}
