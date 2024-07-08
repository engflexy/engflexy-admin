import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ReponseDto} from '../../../model/quiz/Reponse.model';
import {ReponseCriteria} from '../../../criteria/quiz/ReponseCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ReponseCollaboratorService extends AbstractService<ReponseDto, ReponseCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/reponse/';
    }

    public constrcutDto(): ReponseDto {
        return new ReponseDto();
    }

    public constrcutCriteria(): ReponseCriteria {
        return new ReponseCriteria();
    }
}
