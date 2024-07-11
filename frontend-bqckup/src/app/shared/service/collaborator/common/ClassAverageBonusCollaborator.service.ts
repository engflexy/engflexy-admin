import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ClassAverageBonusDto} from '../../../model/common/ClassAverageBonus.model';
import {ClassAverageBonusCriteria} from '../../../criteria/common/ClassAverageBonusCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ClassAverageBonusCollaboratorService extends AbstractService<ClassAverageBonusDto, ClassAverageBonusCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/classAverageBonus/';
    }

    public constrcutDto(): ClassAverageBonusDto {
        return new ClassAverageBonusDto();
    }

    public constrcutCriteria(): ClassAverageBonusCriteria {
        return new ClassAverageBonusCriteria();
    }
}
