import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ReponseEtudiantHomeWorkDto} from '../../../model/homework/ReponseEtudiantHomeWork.model';
import {ReponseEtudiantHomeWorkCriteria} from '../../../criteria/homework/ReponseEtudiantHomeWorkCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ReponseEtudiantHomeWorkAdminService extends AbstractService<ReponseEtudiantHomeWorkDto, ReponseEtudiantHomeWorkCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'admin/reponseEtudiantHomeWork/';
    }

    public constrcutDto(): ReponseEtudiantHomeWorkDto {
        return new ReponseEtudiantHomeWorkDto();
    }

    public constrcutCriteria(): ReponseEtudiantHomeWorkCriteria {
        return new ReponseEtudiantHomeWorkCriteria();
    }
}
