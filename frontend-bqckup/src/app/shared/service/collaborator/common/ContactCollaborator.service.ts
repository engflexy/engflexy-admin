import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ContactDto} from '../../../model/common/Contact.model';
import {ContactCriteria} from '../../../criteria/common/ContactCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ContactCollaboratorService extends AbstractService<ContactDto, ContactCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/contact/';
    }

    public constrcutDto(): ContactDto {
        return new ContactDto();
    }

    public constrcutCriteria(): ContactCriteria {
        return new ContactCriteria();
    }
}
