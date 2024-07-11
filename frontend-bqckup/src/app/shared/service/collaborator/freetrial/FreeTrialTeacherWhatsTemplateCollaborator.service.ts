import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FreeTrialTeacherWhatsTemplateDto} from '../../../model/freetrial/FreeTrialTeacherWhatsTemplate.model';
import {
    FreeTrialTeacherWhatsTemplateCriteria
} from '../../../criteria/freetrial/FreeTrialTeacherWhatsTemplateCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FreeTrialTeacherWhatsTemplateCollaboratorService extends AbstractService<FreeTrialTeacherWhatsTemplateDto, FreeTrialTeacherWhatsTemplateCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/freeTrialTeacherWhatsTemplate/';
    }

    public constrcutDto(): FreeTrialTeacherWhatsTemplateDto {
        return new FreeTrialTeacherWhatsTemplateDto();
    }

    public constrcutCriteria(): FreeTrialTeacherWhatsTemplateCriteria {
        return new FreeTrialTeacherWhatsTemplateCriteria();
    }
}
