import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {BehaviorSubject, Observable} from 'rxjs';

import {RoleService} from './Role.service';
import {AbstractService} from "../../../service/AbstractService";
import {RoleUserDto} from "../model/RoleUser.model";
import {RoleUserCriteria} from "../criteria/RoleUserCriteria.model";
import {environment} from "../../../../../environments/environment";


@Injectable({
  providedIn: 'root'
})
export class RoleUserService extends AbstractService<RoleUserDto, RoleUserCriteria> {
     constructor(private http: HttpClient, private roleService: RoleService) {
        super();
        this.setHttp(http);
        this.setApi(environment.apiUrl + 'api/roleUser/');
    }

    public constrcutDto(): RoleUserDto {
        return new RoleUserDto();
    }

    public constrcutCriteria(): RoleUserCriteria {
        return new RoleUserCriteria();
    }
    get API() {
        return environment.apiUrl + 'api/roleUser/';
    }
}
