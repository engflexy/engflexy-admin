import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {BehaviorSubject, Observable} from 'rxjs';
import {environment} from "../../../../../environments/environment";
import {RoleService} from './Role.service';
import {AbstractService} from "../../../service/AbstractService";
import {UserDto} from "../model/User.model";
import {UserCriteria} from "../criteria/UserCriteria.model";


@Injectable({
  providedIn: 'root'
})
export class UserService extends AbstractService<UserDto, UserCriteria> {
     constructor(private http: HttpClient, private roleService: RoleService) {
        super();
        this.setHttp(http);
    }

    findByUsername(username: string): Observable<UserDto> {
        return this.http.get<UserDto>( this.API + 'Username/' + username);
    }
    public constrcutDto(): UserDto {
        return new UserDto();
    }

    public constrcutCriteria(): UserCriteria {
        return new UserCriteria();
    }
    get API() {
        return environment.apiUrl + 'api/user/';
    }
}
