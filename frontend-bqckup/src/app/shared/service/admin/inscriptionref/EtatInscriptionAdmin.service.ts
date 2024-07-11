import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {EtatInscriptionDto} from '../../../model/inscriptionref/EtatInscription.model';
import {EtatInscriptionCriteria} from '../../../criteria/inscriptionref/EtatInscriptionCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class EtatInscriptionAdminService extends AbstractService<EtatInscriptionDto, EtatInscriptionCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/etatInscription/';
    }

    public constrcutDto(): EtatInscriptionDto {
        return new EtatInscriptionDto();
    }

    public constrcutCriteria(): EtatInscriptionCriteria {
        return new EtatInscriptionCriteria();
    }
}
