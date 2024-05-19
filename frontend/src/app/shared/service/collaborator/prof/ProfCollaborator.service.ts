import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ProfDto} from '../../../model/prof/Prof.model';
import {ProfCriteria} from '../../../criteria/prof/ProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ProfCollaboratorService extends AbstractService<ProfDto, ProfCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/prof/';
    }

    public constrcutDto(): ProfDto {
        return new ProfDto();
    }

    public constrcutCriteria(): ProfCriteria {
        return new ProfCriteria();
    }
}
