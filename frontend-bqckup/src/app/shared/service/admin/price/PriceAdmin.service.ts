import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {PriceDto} from '../../../model/price/Price.model';
import {PriceCriteria} from '../../../criteria/price/PriceCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class PriceAdminService extends AbstractService<PriceDto, PriceCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/price/';
    }

    public constrcutDto(): PriceDto {
        return new PriceDto();
    }

    public constrcutCriteria(): PriceCriteria {
        return new PriceCriteria();
    }
}
