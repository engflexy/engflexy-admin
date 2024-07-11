import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {AbstractService} from "../../../service/AbstractService";
import {environment} from "../../../../../environments/environment";

import {RoleService} from './Role.service';
import {ModelPermissionDto} from "../model/ModelPermission.model";
import {ModelPermissionCriteria} from "../criteria/ModelPermissionCriteria.model";


@Injectable({
    providedIn: 'root'
})
export class ModelPermissionService extends AbstractService<ModelPermissionDto, ModelPermissionCriteria> {
    constructor(private http: HttpClient, private roleService: RoleService) {
        super();
        this.setHttp(http);
    }

    public constrcutDto(): ModelPermissionDto {
        return new ModelPermissionDto();
    }

    public constrcutCriteria(): ModelPermissionCriteria {
        return new ModelPermissionCriteria();
    }

    get API() {
        return environment.apiUrl + 'api/modelPermission/';
    }
}
