import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {EtudiantDto} from '../../../model/inscription/Etudiant.model';
import {EtudiantCriteria} from '../../../criteria/inscription/EtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Pageable} from "../../../utils/Pageable";
import {Observable, tap} from "rxjs";
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {UserCriteria} from "../../../../core/criteria/user-criteria";


@Injectable({
    providedIn: 'root'
})
export class EtudiantCollaboratorService extends AbstractService<EtudiantDto, EtudiantCriteria> {
    private _students: Array<UserCriteria> = new Array<UserCriteria>();


    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }


    get students(): Array<UserCriteria> {
        return this._students;
    }

    set students(value: Array<UserCriteria>) {
        this._students = value;
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/etudiant/';
    }

    public constrcutDto(): EtudiantDto {
        return new EtudiantDto();
    }

    public constrcutCriteria(): EtudiantCriteria {
        return new EtudiantCriteria();
    }

    findAllByCollaboratorId(id: number): Observable<Array<UserCriteria>> {
        return this.http.get<Array<UserCriteria>>(this.API + `collaborator/id/${id}`)
            .pipe(
                tap((response) => {
                    this._students = response
                }),
            );
    }

    findByCollaboratorId(id: number, pageable: Pageable): Observable<PageRequest<UserCriteria>> {
        return this.http.get<PageRequest<UserCriteria>>(this.API + `pageable/collaborator/id/${id}`,
            {
                params: {
                    'page': pageable.page,
                    'size': pageable.size
                }
            });
    }
    findByUserName(username: string): Observable<UserCriteria> {

        return this.http.get<UserCriteria>(this.API + `username/${username}`)

    }

    create(student: EtudiantDto): Observable<EtudiantDto> {
        return this.http.post<EtudiantDto>(this.API + 'create', student);
    }

    update(user: EtudiantDto): Observable<EtudiantDto> {
        return this.http.put<EtudiantDto>(this.API, user);
    }
    updateAccountStatus(userId: number, enabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-status/${userId}`, { enabled });
    }
    updateAccountLockStatus(userId: number, accountNonLocked: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-lock-status/${userId}`, { accountNonLocked });
    }



    updateAccountNonExpiredStatus(id: number, accountNonExpired: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-account-non-expired/${id}`, { accountNonExpired });
    }

    updateCredentialsNonExpiredStatus(id: number, credentialsNonExpired: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-credentials-non-expired/${id}`, { credentialsNonExpired });
    }

    updatePasswordChangedStatus(id: number, passwordChanged: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-password-changed/${id}`, { passwordChanged });
    }

    changePassword(username: string, newPassword: string): Observable<any> {
        return this.http.put(`${this.API}change-password`, { username, newPassword });
    }
}
