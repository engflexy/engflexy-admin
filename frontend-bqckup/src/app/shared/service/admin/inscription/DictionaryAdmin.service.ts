import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {DictionaryDto} from '../../../model/inscription/Dictionary.model';
import {DictionaryCriteria} from '../../../criteria/inscription/DictionaryCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class DictionaryAdminService extends AbstractService<DictionaryDto, DictionaryCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/dictionary/';
    }

    public constrcutDto(): DictionaryDto {
        return new DictionaryDto();
    }

    public constrcutCriteria(): DictionaryCriteria {
        return new DictionaryCriteria();
    }
}
