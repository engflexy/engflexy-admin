import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ReclamationEtudiantDto} from '../../../model/recomrecla/ReclamationEtudiant.model';
import {ReclamationEtudiantCriteria} from '../../../criteria/recomrecla/ReclamationEtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ReclamationEtudiantCollaboratorService extends AbstractService<ReclamationEtudiantDto, ReclamationEtudiantCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/reclamationEtudiant/';
    }

    public constrcutDto(): ReclamationEtudiantDto {
        return new ReclamationEtudiantDto();
    }

    public constrcutCriteria(): ReclamationEtudiantCriteria {
        return new ReclamationEtudiantCriteria();
    }
}
