import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ReponseEtudiantDto} from '../../../model/quizetudiant/ReponseEtudiant.model';
import {ReponseEtudiantCriteria} from '../../../criteria/quizetudiant/ReponseEtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ReponseEtudiantCollaboratorService extends AbstractService<ReponseEtudiantDto, ReponseEtudiantCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/reponseEtudiant/';
    }

    public constrcutDto(): ReponseEtudiantDto {
        return new ReponseEtudiantDto();
    }

    public constrcutCriteria(): ReponseEtudiantCriteria {
        return new ReponseEtudiantCriteria();
    }
}
