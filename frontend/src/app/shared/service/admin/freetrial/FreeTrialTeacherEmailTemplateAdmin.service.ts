import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FreeTrialTeacherEmailTemplateDto} from '../../../model/freetrial/FreeTrialTeacherEmailTemplate.model';
import {
    FreeTrialTeacherEmailTemplateCriteria
} from '../../../criteria/freetrial/FreeTrialTeacherEmailTemplateCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FreeTrialTeacherEmailTemplateAdminService extends AbstractService<FreeTrialTeacherEmailTemplateDto, FreeTrialTeacherEmailTemplateCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/freeTrialTeacherEmailTemplate/';
    }

    public constrcutDto(): FreeTrialTeacherEmailTemplateDto {
        return new FreeTrialTeacherEmailTemplateDto();
    }

    public constrcutCriteria(): FreeTrialTeacherEmailTemplateCriteria {
        return new FreeTrialTeacherEmailTemplateCriteria();
    }
}
