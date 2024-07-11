import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ProfReviewDto} from '../../../model/review/ProfReview.model';
import {ProfReviewCriteria} from '../../../criteria/review/ProfReviewCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ProfReviewAdminService extends AbstractService<ProfReviewDto, ProfReviewCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/profReview/';
    }

    public constrcutDto(): ProfReviewDto {
        return new ProfReviewDto();
    }

    public constrcutCriteria(): ProfReviewCriteria {
        return new ProfReviewCriteria();
    }
}
