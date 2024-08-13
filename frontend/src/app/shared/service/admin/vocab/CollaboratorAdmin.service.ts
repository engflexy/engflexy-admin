import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {CollaboratorDto} from '../../../model/vocab/Collaborator.model';
import {CollaboratorCriteria} from '../../../criteria/vocab/CollaboratorCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Pageable} from "../../../utils/Pageable";
import {Observable} from "rxjs";
import {ManageUserDto} from "../../../../core/criteria/manage-user-dto";
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {ProfDto} from "../../../model/prof/Prof.model";
import {EtudiantDto} from "../../../model/inscription/Etudiant.model";


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

    findAllByCriteria(pageable: Pageable): Observable<PageRequest<ManageUserDto>> {
        return this.http.get<PageRequest<ManageUserDto>>(this.API + `pageable`,
            {
                params: {
                    'page': pageable.page,
                    'size': pageable.size
                }
            });
    }

    findAllOptimized(): Observable<Array<CollaboratorDto>> {
        return this.http.get<Array<CollaboratorDto>>(this.API + `optimized`);
    }

    update(user: CollaboratorDto): Observable<CollaboratorDto> {
        return this.http.put<CollaboratorDto>(this.API, user);
    }
    create(user: CollaboratorDto): Observable<CollaboratorDto> {
        return this.http.post<CollaboratorDto>(this.API + 'create', user);
    }
    deleteById(id: number): Observable<number> {
        return this.http.delete<number>(`${this.API}id/${id}`);
    }
}
