import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {SectionItemDto} from '../../../model/course/SectionItem.model';
import {SectionItemCriteria} from '../../../criteria/course/SectionItemCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class SectionItemAdminService extends AbstractService<SectionItemDto, SectionItemCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/sectionItem/';
    }

    public constrcutDto(): SectionItemDto {
        return new SectionItemDto();
    }

    public constrcutCriteria(): SectionItemCriteria {
        return new SectionItemCriteria();
    }
}
