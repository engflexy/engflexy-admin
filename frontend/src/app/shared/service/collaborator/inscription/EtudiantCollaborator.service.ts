import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {EtudiantDto} from '../../../model/inscription/Etudiant.model';
import {EtudiantCriteria} from '../../../criteria/inscription/EtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


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
}
