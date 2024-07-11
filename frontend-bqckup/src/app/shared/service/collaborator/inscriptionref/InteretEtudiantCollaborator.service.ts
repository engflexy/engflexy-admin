import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {InteretEtudiantDto} from '../../../model/inscriptionref/InteretEtudiant.model';
import {InteretEtudiantCriteria} from '../../../criteria/inscriptionref/InteretEtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class InteretEtudiantCollaboratorService extends AbstractService<InteretEtudiantDto, InteretEtudiantCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/interetEtudiant/';
    }

    public constrcutDto(): InteretEtudiantDto {
        return new InteretEtudiantDto();
    }

    public constrcutCriteria(): InteretEtudiantCriteria {
        return new InteretEtudiantCriteria();
    }
}
