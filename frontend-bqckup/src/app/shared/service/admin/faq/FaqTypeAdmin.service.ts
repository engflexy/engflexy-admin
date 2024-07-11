import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FaqTypeDto} from '../../../model/faq/FaqType.model';
import {FaqTypeCriteria} from '../../../criteria/faq/FaqTypeCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FaqTypeAdminService extends AbstractService<FaqTypeDto, FaqTypeCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/faqType/';
    }

    public constrcutDto(): FaqTypeDto {
        return new FaqTypeDto();
    }

    public constrcutCriteria(): FaqTypeCriteria {
        return new FaqTypeCriteria();
    }
}
