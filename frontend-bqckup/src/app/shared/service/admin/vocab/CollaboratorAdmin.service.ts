import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {CollaboratorDto} from '../../../model/vocab/Collaborator.model';
import {CollaboratorCriteria} from '../../../criteria/vocab/CollaboratorCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Pageable} from "../../../utils/Pageable";
import {Observable} from "rxjs";
import {UserCriteria} from "../../../../core/criteria/user-criteria";
import {Criteria} from "../../../../zynerator/criteria/BaseCriteria.model";
import {ProfDto} from "../../../model/prof/Prof.model";


@Injectable({
    providedIn: 'root'
})
export class CollaboratorAdminService extends AbstractService<CollaboratorDto, CollaboratorCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/collaborator/';
    }

    public constrcutDto(): CollaboratorDto {
        return new CollaboratorDto();
    }

    public constrcutCriteria(): CollaboratorCriteria {
        return new CollaboratorCriteria();
    }

    findAllByCriteria(pageable: Pageable): Observable<Criteria<UserCriteria>> {
        return this.http.get<Criteria<UserCriteria>>(this.API + `pageable`,
            {
                params: {
                    'page': pageable.page,
                    'size': pageable.size
                }
            });
    }
    update(user: CollaboratorDto): Observable<CollaboratorDto> {
        return this.http.put<CollaboratorDto>(this.API, user);
    }
}
