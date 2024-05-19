import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {VocabularyDto} from '../../../model/vocab/Vocabulary.model';
import {VocabularyCriteria} from '../../../criteria/vocab/VocabularyCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class VocabularyCollaboratorService extends AbstractService<VocabularyDto, VocabularyCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/vocabulary/';
    }

    public constrcutDto(): VocabularyDto {
        return new VocabularyDto();
    }

    public constrcutCriteria(): VocabularyCriteria {
        return new VocabularyCriteria();
    }
}
