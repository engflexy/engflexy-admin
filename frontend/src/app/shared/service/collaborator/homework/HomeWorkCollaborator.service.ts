import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {HomeWorkDto} from '../../../model/homework/HomeWork.model';
import {HomeWorkCriteria} from '../../../criteria/homework/HomeWorkCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Observable} from "rxjs";
import {CoursDto} from "../../../model/course/Cours.model";
import {SectionDto} from "../../../model/course/Section.model";


@Injectable({
    providedIn: 'root'
})
export class HomeWorkCollaboratorService extends AbstractService<HomeWorkDto, HomeWorkCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/homeWork/';
    }

    public constrcutDto(): HomeWorkDto {
        return new HomeWorkDto();
    }

    public constrcutCriteria(): HomeWorkCriteria {
        return new HomeWorkCriteria();
    }

    findByCoursId(id: number):Observable<HomeWorkDto[]> {
        return this.http.get<HomeWorkDto[]>(this.API+'cours/id/'+id);
    }

     updateFields(homeWork: HomeWorkDto): Observable<HomeWorkDto> {
    return this.http.put<HomeWorkDto>(this.API + `fields`, homeWork);
}

}
