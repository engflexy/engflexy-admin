import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {RecommendTeacherDto} from '../../../model/recomrecla/RecommendTeacher.model';
import {RecommendTeacherCriteria} from '../../../criteria/recomrecla/RecommendTeacherCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class RecommendTeacherAdminService extends AbstractService<RecommendTeacherDto, RecommendTeacherCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/recommendTeacher/';
    }

    public constrcutDto(): RecommendTeacherDto {
        return new RecommendTeacherDto();
    }

    public constrcutCriteria(): RecommendTeacherCriteria {
        return new RecommendTeacherCriteria();
    }
}
