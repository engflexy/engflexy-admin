import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {QuizEtudiantDto} from '../../../model/quizetudiant/QuizEtudiant.model';
import {QuizEtudiantCriteria} from '../../../criteria/quizetudiant/QuizEtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class QuizEtudiantCollaboratorService extends AbstractService<QuizEtudiantDto, QuizEtudiantCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/quizEtudiant/';
    }

    public constrcutDto(): QuizEtudiantDto {
        return new QuizEtudiantDto();
    }

    public constrcutCriteria(): QuizEtudiantCriteria {
        return new QuizEtudiantCriteria();
    }
}
