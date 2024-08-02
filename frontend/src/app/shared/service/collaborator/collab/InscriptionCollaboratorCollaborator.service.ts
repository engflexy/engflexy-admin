import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';

import {InscriptionCollaboratorDto} from "../../../model/collab/InscriptionCollaborator.model";
import {InscriptionCollaboratorCriteria} from "../../../criteria/collab/InscriptionCollaboratorCriteria.model";
import {environment} from "../../../../../environments/environment";
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {AbstractService} from "../../../../zynerator/service/AbstractService";

@Injectable({
    providedIn: 'root'
})
export class InscriptionCollaboratorCollaboratorService extends AbstractService<InscriptionCollaboratorDto, InscriptionCollaboratorCriteria> {

    private _active_status = 1;


    constructor(private http: HttpClient) {
        super();
        this.httpClient = http
    }


    get API() {
        return environment.apiUrlAlcservice + 'collaborator/inscriptionCollaborator/';
    }

    get active_status(): number {
        return this._active_status;
    }

    set active_status(value: number) {
        this._active_status = value;
    }
    public findByCollaboratorTypeCollaboratorIdSchool(criteria: InscriptionCollaboratorCriteria): Observable<PageRequest<InscriptionCollaboratorDto>> {
        return this.http.get<PageRequest<InscriptionCollaboratorDto>>(this.API + 'school',{
            params: {
                'page': criteria.page,
                'size': criteria.maxResults
            }
        });
    }

    public findByCollaboratorTypeCollaboratorIdTeacher(criteria: InscriptionCollaboratorCriteria): Observable<PageRequest<InscriptionCollaboratorDto>> {
        return this.http.get<PageRequest<InscriptionCollaboratorDto>>(this.API + 'teacher',{
            params: {
                'page': criteria.page,
                'size': criteria.maxResults
            }
        });
    }
    constrcutCriteria(): InscriptionCollaboratorCriteria {
        return new InscriptionCollaboratorCriteria();
    }

    constrcutDto(): InscriptionCollaboratorDto {
        return new InscriptionCollaboratorDto();
    }
}
