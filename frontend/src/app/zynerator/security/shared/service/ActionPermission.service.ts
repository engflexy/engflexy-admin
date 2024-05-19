import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {RoleService} from './Role.service';
import {AbstractService} from "../../../service/AbstractService";
import {ActionPermissionDto} from "../model/ActionPermission.model";
import {environment} from "../../../../../environments/environment";
import {ActionPermissionCriteria} from "../criteria/ActionPermissionCriteria.model";


@Injectable({
  providedIn: 'root'
})
export class ActionPermissionService extends AbstractService<ActionPermissionDto, ActionPermissionCriteria> {
     constructor(private http: HttpClient, private roleService: RoleService) {
        super();
        this.setHttp(http);
    }

    public constrcutDto(): ActionPermissionDto {
        return new ActionPermissionDto();
    }

    public constrcutCriteria(): ActionPermissionCriteria {
        return new ActionPermissionCriteria();
    }
    get API() {
        return environment.apiUrl + 'api/actionPermission/';
    }
}
