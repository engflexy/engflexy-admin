import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ReclamationProfDto} from '../../../model/recomrecla/ReclamationProf.model';
import {ReclamationProfCriteria} from '../../../criteria/recomrecla/ReclamationProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ReclamationProfCollaboratorService extends AbstractService<ReclamationProfDto, ReclamationProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/reclamationProf/';
    }

    public constrcutDto(): ReclamationProfDto {
        return new ReclamationProfDto();
    }

    public constrcutCriteria(): ReclamationProfCriteria {
        return new ReclamationProfCriteria();
    }
}
