import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FonctionDto} from '../../../model/inscriptionref/Fonction.model';
import {FonctionCriteria} from '../../../criteria/inscriptionref/FonctionCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FonctionCollaboratorService extends AbstractService<FonctionDto, FonctionCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/fonction/';
    }

    public constrcutDto(): FonctionDto {
        return new FonctionDto();
    }

    public constrcutCriteria(): FonctionCriteria {
        return new FonctionCriteria();
    }
}
