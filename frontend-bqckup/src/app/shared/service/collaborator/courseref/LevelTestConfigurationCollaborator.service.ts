import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {LevelTestConfigurationDto} from '../../../model/courseref/LevelTestConfiguration.model';
import {LevelTestConfigurationCriteria} from '../../../criteria/courseref/LevelTestConfigurationCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";


@Injectable({
    providedIn: 'root'
})
export class LevelTestConfigurationCollaboratorService extends AbstractService<LevelTestConfigurationDto, LevelTestConfigurationCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/levelTestConfiguration/';
    }

    public constrcutDto(): LevelTestConfigurationDto {
        return new LevelTestConfigurationDto();
    }

    public constrcutCriteria(): LevelTestConfigurationCriteria {
        return new LevelTestConfigurationCriteria();
    }
}
