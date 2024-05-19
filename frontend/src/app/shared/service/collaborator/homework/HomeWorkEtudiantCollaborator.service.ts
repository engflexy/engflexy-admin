import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {HomeWorkEtudiantDto} from '../../../model/homework/HomeWorkEtudiant.model';
import {HomeWorkEtudiantCriteria} from '../../../criteria/homework/HomeWorkEtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class HomeWorkEtudiantCollaboratorService extends AbstractService<HomeWorkEtudiantDto, HomeWorkEtudiantCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/homeWorkEtudiant/';
    }

    public constrcutDto(): HomeWorkEtudiantDto {
        return new HomeWorkEtudiantDto();
    }

    public constrcutCriteria(): HomeWorkEtudiantCriteria {
        return new HomeWorkEtudiantCriteria();
    }
}
