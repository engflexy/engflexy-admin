import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FreeTrialStudentWhatsTemplateDto} from '../../../model/freetrial/FreeTrialStudentWhatsTemplate.model';
import {
    FreeTrialStudentWhatsTemplateCriteria
} from '../../../criteria/freetrial/FreeTrialStudentWhatsTemplateCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FreeTrialStudentWhatsTemplateAdminService extends AbstractService<FreeTrialStudentWhatsTemplateDto, FreeTrialStudentWhatsTemplateCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/freeTrialStudentWhatsTemplate/';
    }

    public constrcutDto(): FreeTrialStudentWhatsTemplateDto {
        return new FreeTrialStudentWhatsTemplateDto();
    }

    public constrcutCriteria(): FreeTrialStudentWhatsTemplateCriteria {
        return new FreeTrialStudentWhatsTemplateCriteria();
    }
}
