import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {EtudiantDto} from '../../../model/inscription/Etudiant.model';
import {EtudiantCriteria} from '../../../criteria/inscription/EtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Pageable} from "../../../utils/Pageable";
import {Observable} from "rxjs";
import {Criteria} from "../../../../zynerator/criteria/BaseCriteria.model";
import {StudentCriteria} from "../../../../core/criteria/student-criteria";


@Injectable({
    providedIn: 'root'
})
export class EtudiantCollaboratorService extends AbstractService<EtudiantDto, EtudiantCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/etudiant/';
    }

    public constrcutDto(): EtudiantDto {
        return new EtudiantDto();
    }

    public constrcutCriteria(): EtudiantCriteria {
        return new EtudiantCriteria();
    }

    findByCollaboratorId(id: number, pageable: Pageable): Observable<Criteria<StudentCriteria>> {
        return this.http.get<Criteria<StudentCriteria>>(this.API + `pageable/collaborator/id/${id}`,
            {
                params: {
                    'page': pageable.page,
                    'size': pageable.size
                }
            });
    }

    create(student: EtudiantDto): Observable<EtudiantDto> {
        return this.http.post<EtudiantDto>(this.API + 'create', student);
    }

}
