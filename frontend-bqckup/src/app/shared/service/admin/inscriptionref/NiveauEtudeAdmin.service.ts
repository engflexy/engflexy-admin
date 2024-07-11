import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {NiveauEtudeDto} from '../../../model/inscriptionref/NiveauEtude.model';
import {NiveauEtudeCriteria} from '../../../criteria/inscriptionref/NiveauEtudeCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class NiveauEtudeAdminService extends AbstractService<NiveauEtudeDto, NiveauEtudeCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/niveauEtude/';
    }

    public constrcutDto(): NiveauEtudeDto {
        return new NiveauEtudeDto();
    }

    public constrcutCriteria(): NiveauEtudeCriteria {
        return new NiveauEtudeCriteria();
    }
}
