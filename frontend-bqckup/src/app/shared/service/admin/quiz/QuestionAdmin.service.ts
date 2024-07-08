import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {QuestionDto} from '../../../model/quiz/Question.model';
import {QuestionCriteria} from '../../../criteria/quiz/QuestionCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class QuestionAdminService extends AbstractService<QuestionDto, QuestionCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/question/';
    }

    public constrcutDto(): QuestionDto {
        return new QuestionDto();
    }

    public constrcutCriteria(): QuestionCriteria {
        return new QuestionCriteria();
    }
}
