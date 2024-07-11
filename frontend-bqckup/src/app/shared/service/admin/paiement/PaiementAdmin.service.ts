import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {PaiementDto} from '../../../model/paiement/Paiement.model';
import {PaiementCriteria} from '../../../criteria/paiement/PaiementCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class PaiementAdminService extends AbstractService<PaiementDto, PaiementCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/paiement/';
    }

    public constrcutDto(): PaiementDto {
        return new PaiementDto();
    }

    public constrcutCriteria(): PaiementCriteria {
        return new PaiementCriteria();
    }
}
