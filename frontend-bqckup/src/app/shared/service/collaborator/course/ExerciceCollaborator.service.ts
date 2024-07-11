import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ExerciceDto} from '../../../model/course/Exercice.model';
import {ExerciceCriteria} from '../../../criteria/course/ExerciceCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class ExerciceCollaboratorService extends AbstractService<ExerciceDto, ExerciceCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/exercice/';
    }

    public constrcutDto(): ExerciceDto {
        return new ExerciceDto();
    }

    public constrcutCriteria(): ExerciceCriteria {
        return new ExerciceCriteria();
    }
}
