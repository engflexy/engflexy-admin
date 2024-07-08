import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {GroupeEtudiantDto} from '../../../model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantCriteria} from '../../../criteria/grpe/GroupeEtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {SalaryDto} from "../../../model/salary/Salary.model";
import {Observable} from "rxjs";


@Injectable({
    providedIn: 'root'
})
export class GroupeEtudiantCollaboratorService extends AbstractService<GroupeEtudiantDto, GroupeEtudiantCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/groupeEtudiant/';
    }

    public constrcutDto(): GroupeEtudiantDto {
        return new GroupeEtudiantDto();
    }

    public constrcutCriteria(): GroupeEtudiantCriteria {
        return new GroupeEtudiantCriteria();
    }

    findAllSalary(): Observable<any[]> {
        return this.http.get<any[]>('https://api.engflexy.com/app/prof/salary/')
    }
}
