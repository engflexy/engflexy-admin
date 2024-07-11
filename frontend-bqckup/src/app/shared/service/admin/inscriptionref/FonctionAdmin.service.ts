import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FonctionDto} from '../../../model/inscriptionref/Fonction.model';
import {FonctionCriteria} from '../../../criteria/inscriptionref/FonctionCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FonctionAdminService extends AbstractService<FonctionDto, FonctionCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/fonction/';
    }

    public constrcutDto(): FonctionDto {
        return new FonctionDto();
    }

    public constrcutCriteria(): FonctionCriteria {
        return new FonctionCriteria();
    }
}
