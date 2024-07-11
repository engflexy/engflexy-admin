import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ConfirmationTokenDto} from '../../../model/inscriptionref/ConfirmationToken.model';
import {ConfirmationTokenCriteria} from '../../../criteria/inscriptionref/ConfirmationTokenCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ConfirmationTokenCollaboratorService extends AbstractService<ConfirmationTokenDto, ConfirmationTokenCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/confirmationToken/';
    }

    public constrcutDto(): ConfirmationTokenDto {
        return new ConfirmationTokenDto();
    }

    public constrcutCriteria(): ConfirmationTokenCriteria {
        return new ConfirmationTokenCriteria();
    }
}
