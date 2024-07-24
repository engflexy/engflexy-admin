import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {EtudiantDto} from '../../../model/inscription/Etudiant.model';
import {EtudiantCriteria} from '../../../criteria/inscription/EtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Pageable} from "../../../utils/Pageable";
import {Observable, tap} from "rxjs";
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {UserCriteria} from "../../../../core/criteria/user-criteria";


@Injectable({
    providedIn: 'root'
})
export class EtudiantCollaboratorService extends AbstractService<EtudiantDto, EtudiantCriteria> {
    private _students: Array<UserCriteria> = new Array<UserCriteria>();


    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }


    get students(): Array<UserCriteria> {
        return this._students;
    }

    set students(value: Array<UserCriteria>) {
        this._students = value;
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

    findAllByCollaboratorId(id: number): Observable<Array<UserCriteria>> {
        return this.http.get<Array<UserCriteria>>(this.API + `collaborator/id/${id}`)
            .pipe(
                tap((response) => {
                    this._students = response
                }),
            );
    }

    findByCollaboratorId(id: number, pageable: Pageable): Observable<PageRequest<UserCriteria>> {
        return this.http.get<PageRequest<UserCriteria>>(this.API + `pageable/collaborator/id/${id}`,
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

    update(user: EtudiantDto): Observable<EtudiantDto> {
        return this.http.put<EtudiantDto>(this.API, user);
    }

}
