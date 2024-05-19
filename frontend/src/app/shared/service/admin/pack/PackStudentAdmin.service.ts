import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {PackStudentDto} from '../../../model/pack/PackStudent.model';
import {PackStudentCriteria} from '../../../criteria/pack/PackStudentCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class PackStudentAdminService extends AbstractService<PackStudentDto, PackStudentCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/packStudent/';
    }

    public constrcutDto(): PackStudentDto {
        return new PackStudentDto();
    }

    public constrcutCriteria(): PackStudentCriteria {
        return new PackStudentCriteria();
    }
}
