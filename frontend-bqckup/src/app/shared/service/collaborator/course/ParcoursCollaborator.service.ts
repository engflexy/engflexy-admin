import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ParcoursDto} from '../../../model/course/Parcours.model';
import {ParcoursCriteria} from '../../../criteria/course/ParcoursCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ParcoursCollaboratorService extends AbstractService<ParcoursDto, ParcoursCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/parcours/';
    }

    public constrcutDto(): ParcoursDto {
        return new ParcoursDto();
    }

    public constrcutCriteria(): ParcoursCriteria {
        return new ParcoursCriteria();
    }
}
