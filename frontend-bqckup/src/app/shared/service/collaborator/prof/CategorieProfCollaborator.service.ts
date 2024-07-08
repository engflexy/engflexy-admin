import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {CategorieProfDto} from '../../../model/prof/CategorieProf.model';
import {CategorieProfCriteria} from '../../../criteria/prof/CategorieProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class CategorieProfCollaboratorService extends AbstractService<CategorieProfDto, CategorieProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/categorieProf/';
    }

    public constrcutDto(): CategorieProfDto {
        return new CategorieProfDto();
    }

    public constrcutCriteria(): CategorieProfCriteria {
        return new CategorieProfCriteria();
    }
}
