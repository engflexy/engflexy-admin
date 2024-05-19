import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ServicesDto} from '../../../model/freetrial/Services.model';
import {ServicesCriteria} from '../../../criteria/freetrial/ServicesCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ServicesCollaboratorService extends AbstractService<ServicesDto, ServicesCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/services/';
    }

    public constrcutDto(): ServicesDto {
        return new ServicesDto();
    }

    public constrcutCriteria(): ServicesCriteria {
        return new ServicesCriteria();
    }
}
