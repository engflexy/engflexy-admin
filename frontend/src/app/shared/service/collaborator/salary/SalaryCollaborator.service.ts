import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {SalaryDto} from '../../../model/salary/Salary.model';
import {SalaryCriteria} from '../../../criteria/salary/SalaryCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Observable} from "rxjs";
import {PaginatedList} from "../../../../zynerator/dto/PaginatedList.model";


@Injectable({
    providedIn: 'root'
})
export class SalaryCollaboratorService extends AbstractService<SalaryDto, SalaryCriteria> {
    private baseUrl: string;
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/salary/';
    }

    public constrcutDto(): SalaryDto {
        return new SalaryDto();
    }

    public constrcutCriteria(): SalaryCriteria {
        return new SalaryCriteria();
    }

    // findPaginatedByCriteria(criteria: SalaryCriteria): Observable<PaginatedList<SalaryDto>> {
    //     return this.http.post<PaginatedList<SalaryDto>>(`${this.API}find-paginated-by-criteria`, criteria);
    // }


}
