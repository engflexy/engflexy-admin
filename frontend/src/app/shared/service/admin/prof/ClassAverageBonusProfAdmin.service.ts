import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ClassAverageBonusProfDto} from '../../../model/prof/ClassAverageBonusProf.model';
import {ClassAverageBonusProfCriteria} from '../../../criteria/prof/ClassAverageBonusProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ClassAverageBonusProfAdminService extends AbstractService<ClassAverageBonusProfDto, ClassAverageBonusProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/classAverageBonusProf/';
    }

    public constrcutDto(): ClassAverageBonusProfDto {
        return new ClassAverageBonusProfDto();
    }

    public constrcutCriteria(): ClassAverageBonusProfCriteria {
        return new ClassAverageBonusProfCriteria();
    }
}
