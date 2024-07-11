import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {LangueDto} from '../../../model/inscriptionref/Langue.model';
import {LangueCriteria} from '../../../criteria/inscriptionref/LangueCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class LangueAdminService extends AbstractService<LangueDto, LangueCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/langue/';
    }

    public constrcutDto(): LangueDto {
        return new LangueDto();
    }

    public constrcutCriteria(): LangueCriteria {
        return new LangueCriteria();
    }
}
