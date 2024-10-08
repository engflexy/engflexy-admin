import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {CollaboratorDto} from '../../../model/vocab/Collaborator.model';
import {CollaboratorCriteria} from '../../../criteria/vocab/CollaboratorCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class CollaboratorCollaboratorService extends AbstractService<CollaboratorDto, CollaboratorCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/collaborator/';
    }

    public constrcutDto(): CollaboratorDto {
        return new CollaboratorDto();
    }

    public constrcutCriteria(): CollaboratorCriteria {
        return new CollaboratorCriteria();
    }
}
