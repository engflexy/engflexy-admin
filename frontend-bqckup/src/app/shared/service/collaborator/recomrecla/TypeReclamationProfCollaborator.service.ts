import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {TypeReclamationProfDto} from '../../../model/recomrecla/TypeReclamationProf.model';
import {TypeReclamationProfCriteria} from '../../../criteria/recomrecla/TypeReclamationProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class TypeReclamationProfCollaboratorService extends AbstractService<TypeReclamationProfDto, TypeReclamationProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/typeReclamationProf/';
    }

    public constrcutDto(): TypeReclamationProfDto {
        return new TypeReclamationProfDto();
    }

    public constrcutCriteria(): TypeReclamationProfCriteria {
        return new TypeReclamationProfCriteria();
    }
}
