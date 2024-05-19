import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {HomeWorkQuestionDto} from '../../../model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCriteria} from '../../../criteria/homework/HomeWorkQuestionCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class HomeWorkQuestionAdminService extends AbstractService<HomeWorkQuestionDto, HomeWorkQuestionCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/homeWorkQuestion/';
    }

    public constrcutDto(): HomeWorkQuestionDto {
        return new HomeWorkQuestionDto();
    }

    public constrcutCriteria(): HomeWorkQuestionCriteria {
        return new HomeWorkQuestionCriteria();
    }
}
