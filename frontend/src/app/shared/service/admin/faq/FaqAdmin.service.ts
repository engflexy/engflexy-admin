import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FaqDto} from '../../../model/faq/Faq.model';
import {FaqCriteria} from '../../../criteria/faq/FaqCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FaqAdminService extends AbstractService<FaqDto, FaqCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/faq/';
    }

    public constrcutDto(): FaqDto {
        return new FaqDto();
    }

    public constrcutCriteria(): FaqCriteria {
        return new FaqCriteria();
    }
}
