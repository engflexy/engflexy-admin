import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {FaqEtudiantDto} from '../../../model/faq/FaqEtudiant.model';
import {FaqEtudiantCriteria} from '../../../criteria/faq/FaqEtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class FaqEtudiantAdminService extends AbstractService<FaqEtudiantDto, FaqEtudiantCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/faqEtudiant/';
    }

    public constrcutDto(): FaqEtudiantDto {
        return new FaqEtudiantDto();
    }

    public constrcutCriteria(): FaqEtudiantCriteria {
        return new FaqEtudiantCriteria();
    }
}
