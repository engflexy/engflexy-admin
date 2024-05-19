import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {InscriptionDto} from '../../../model/grpe/Inscription.model';
import {InscriptionCriteria} from '../../../criteria/grpe/InscriptionCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class InscriptionCollaboratorService extends AbstractService<InscriptionDto, InscriptionCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/inscription/';
    }

    public constrcutDto(): InscriptionDto {
        return new InscriptionDto();
    }

    public constrcutCriteria(): InscriptionCriteria {
        return new InscriptionCriteria();
    }
}
