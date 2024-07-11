import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {EtudiantReviewDto} from '../../../model/inscriptionref/EtudiantReview.model';
import {EtudiantReviewCriteria} from '../../../criteria/inscriptionref/EtudiantReviewCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class EtudiantReviewAdminService extends AbstractService<EtudiantReviewDto, EtudiantReviewCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/etudiantReview/';
    }

    public constrcutDto(): EtudiantReviewDto {
        return new EtudiantReviewDto();
    }

    public constrcutCriteria(): EtudiantReviewCriteria {
        return new EtudiantReviewCriteria();
    }
}
