import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {SkillDto} from '../../../model/inscriptionref/Skill.model';
import {SkillCriteria} from '../../../criteria/inscriptionref/SkillCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class SkillAdminService extends AbstractService<SkillDto, SkillCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/skill/';
    }

    public constrcutDto(): SkillDto {
        return new SkillDto();
    }

    public constrcutCriteria(): SkillCriteria {
        return new SkillCriteria();
    }
}
