import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {TypeReclamationEtudiantDto} from '../../../model/recomrecla/TypeReclamationEtudiant.model';
import {TypeReclamationEtudiantCriteria} from '../../../criteria/recomrecla/TypeReclamationEtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class TypeReclamationEtudiantCollaboratorService extends AbstractService<TypeReclamationEtudiantDto, TypeReclamationEtudiantCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/typeReclamationEtudiant/';
    }

    public constrcutDto(): TypeReclamationEtudiantDto {
        return new TypeReclamationEtudiantDto();
    }

    public constrcutCriteria(): TypeReclamationEtudiantCriteria {
        return new TypeReclamationEtudiantCriteria();
    }
}
