import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ContentTypeDto} from '../../../model/courseref/ContentType.model';
import {ContentTypeCriteria} from '../../../criteria/courseref/ContentTypeCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ContentTypeCollaboratorService extends AbstractService<ContentTypeDto, ContentTypeCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/contentType/';
    }

    public constrcutDto(): ContentTypeDto {
        return new ContentTypeDto();
    }

    public constrcutCriteria(): ContentTypeCriteria {
        return new ContentTypeCriteria();
    }
}
