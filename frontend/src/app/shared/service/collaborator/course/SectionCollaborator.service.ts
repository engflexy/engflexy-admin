import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {SectionDto} from '../../../model/course/Section.model';
import {SectionCriteria} from '../../../criteria/course/SectionCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Observable} from "rxjs";


@Injectable({
    providedIn: 'root'
})
export class SectionCollaboratorService extends AbstractService<SectionDto, SectionCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/section/';
    }

    public constrcutDto(): SectionDto {
        return new SectionDto();
    }

    public constrcutCriteria(): SectionCriteria {
        return new SectionCriteria();
    }

    findAllByCourseId(courseId: number): Observable<SectionDto[]> {
        return this.http.get<SectionDto[]>(this.API + `cours/id/${courseId}`)
    }
}
