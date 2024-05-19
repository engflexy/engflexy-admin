import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {HoweWorkQSTReponseDto} from '../../../model/homework/HoweWorkQSTReponse.model';
import {HoweWorkQSTReponseCriteria} from '../../../criteria/homework/HoweWorkQSTReponseCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class HoweWorkQSTReponseAdminService extends AbstractService<HoweWorkQSTReponseDto, HoweWorkQSTReponseCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/howeWorkQSTReponse/';
    }

    public constrcutDto(): HoweWorkQSTReponseDto {
        return new HoweWorkQSTReponseDto();
    }

    public constrcutCriteria(): HoweWorkQSTReponseCriteria {
        return new HoweWorkQSTReponseCriteria();
    }
}
