import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {StatutSocialDto} from '../../../model/inscriptionref/StatutSocial.model';
import {StatutSocialCriteria} from '../../../criteria/inscriptionref/StatutSocialCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class StatutSocialCollaboratorService extends AbstractService<StatutSocialDto, StatutSocialCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/statutSocial/';
    }

    public constrcutDto(): StatutSocialDto {
        return new StatutSocialDto();
    }

    public constrcutCriteria(): StatutSocialCriteria {
        return new StatutSocialCriteria();
    }
}
