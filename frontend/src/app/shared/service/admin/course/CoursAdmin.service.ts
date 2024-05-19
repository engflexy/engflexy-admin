import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {CoursDto} from '../../../model/course/Cours.model';
import {CoursCriteria} from '../../../criteria/course/CoursCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class CoursAdminService extends AbstractService<CoursDto, CoursCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/cours/';
    }

    public constrcutDto(): CoursDto {
        return new CoursDto();
    }

    public constrcutCriteria(): CoursCriteria {
        return new CoursCriteria();
    }
}
