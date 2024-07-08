import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {TypeDeQuestionDto} from '../../../model/quizref/TypeDeQuestion.model';
import {TypeDeQuestionCriteria} from '../../../criteria/quizref/TypeDeQuestionCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class TypeDeQuestionCollaboratorService extends AbstractService<TypeDeQuestionDto, TypeDeQuestionCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/typeDeQuestion/';
    }

    public constrcutDto(): TypeDeQuestionDto {
        return new TypeDeQuestionDto();
    }

    public constrcutCriteria(): TypeDeQuestionCriteria {
        return new TypeDeQuestionCriteria();
    }
}
