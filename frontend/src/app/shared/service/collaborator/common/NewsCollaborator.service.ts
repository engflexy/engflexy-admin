import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {NewsDto} from '../../../model/common/News.model';
import {NewsCriteria} from '../../../criteria/common/NewsCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class NewsCollaboratorService extends AbstractService<NewsDto, NewsCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/news/';
    }

    public constrcutDto(): NewsDto {
        return new NewsDto();
    }

    public constrcutCriteria(): NewsCriteria {
        return new NewsCriteria();
    }
}
