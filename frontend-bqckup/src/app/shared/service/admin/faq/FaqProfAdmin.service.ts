import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FaqProfDto} from '../../../model/faq/FaqProf.model';
import {FaqProfCriteria} from '../../../criteria/faq/FaqProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FaqProfAdminService extends AbstractService<FaqProfDto, FaqProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/faqProf/';
    }

    public constrcutDto(): FaqProfDto {
        return new FaqProfDto();
    }

    public constrcutCriteria(): FaqProfCriteria {
        return new FaqProfCriteria();
    }
}
