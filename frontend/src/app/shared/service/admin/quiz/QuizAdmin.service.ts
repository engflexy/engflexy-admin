import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {QuizDto} from '../../../model/quiz/Quiz.model';
import {QuizCriteria} from '../../../criteria/quiz/QuizCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class QuizAdminService extends AbstractService<QuizDto, QuizCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/quiz/';
    }

    public constrcutDto(): QuizDto {
        return new QuizDto();
    }

    public constrcutCriteria(): QuizCriteria {
        return new QuizCriteria();
    }
}
