import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {RoleService} from './Role.service';
import {Observable} from 'rxjs';
import {PaginatedList} from '../../../dto/PaginatedList.model';
import {AbstractService} from "../../../service/AbstractService";
import {ModelPermissionUserDto} from "../model/ModelPermissionUser.model";
import {ModelPermissionUserCriteria} from "../criteria/ModelPermissionUserCriteria.model";
import {environment} from "../../../../../environments/environment";


@Injectable({
  providedIn: 'root'
})
export class ModelPermissionUserService extends AbstractService<ModelPermissionUserDto, ModelPermissionUserCriteria> {
     constructor(private http: HttpClient, private roleService: RoleService) {
        super();
        this.setHttp(http);
    }

    public initModelPermissionUser(): Observable<Array<ModelPermissionUserDto>> {
        return this.http.get<Array<ModelPermissionUserDto>>(this.API + 'init-model-permission-user');
    }
    public initSecurityModelPermissionUser(): Observable<Array<ModelPermissionUserDto>> {
        return this.http.get<Array<ModelPermissionUserDto>>(this.API + 'init-security-model-permission-user');
    }

    public constrcutDto(): ModelPermissionUserDto {
        return new ModelPermissionUserDto();
    }

    public constrcutCriteria(): ModelPermissionUserCriteria {
        return new ModelPermissionUserCriteria();
    }
    get API() {
        return environment.apiUrl + 'api/modelPermissionUser/';
    }
}
