import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FreeTrialStudentEmailTemplateDto} from '../../../model/freetrial/FreeTrialStudentEmailTemplate.model';
import {
    FreeTrialStudentEmailTemplateCriteria
} from '../../../criteria/freetrial/FreeTrialStudentEmailTemplateCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FreeTrialStudentEmailTemplateAdminService extends AbstractService<FreeTrialStudentEmailTemplateDto, FreeTrialStudentEmailTemplateCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/freeTrialStudentEmailTemplate/';
    }

    public constrcutDto(): FreeTrialStudentEmailTemplateDto {
        return new FreeTrialStudentEmailTemplateDto();
    }

    public constrcutCriteria(): FreeTrialStudentEmailTemplateCriteria {
        return new FreeTrialStudentEmailTemplateCriteria();
    }
}
