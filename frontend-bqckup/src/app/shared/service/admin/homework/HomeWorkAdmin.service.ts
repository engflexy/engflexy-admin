import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {HomeWorkDto} from '../../../model/homework/HomeWork.model';
import {HomeWorkCriteria} from '../../../criteria/homework/HomeWorkCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class HomeWorkAdminService extends AbstractService<HomeWorkDto, HomeWorkCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/homeWork/';
    }

    public constrcutDto(): HomeWorkDto {
        return new HomeWorkDto();
    }

    public constrcutCriteria(): HomeWorkCriteria {
        return new HomeWorkCriteria();
    }
}
