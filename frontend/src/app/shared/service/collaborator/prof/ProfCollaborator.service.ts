import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ProfDto} from '../../../model/prof/Prof.model';
import {ProfCriteria} from '../../../criteria/prof/ProfCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Pageable} from "../../../utils/Pageable";
import {catchError, Observable, ReplaySubject, tap, throwError} from "rxjs";
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {ManageUserDto} from "../../../../core/criteria/manage-user-dto";
import {UserDto} from "../../../../zynerator/security/shared/model/User.model";
import {EtudiantDto} from "../../../model/inscription/Etudiant.model";
import {CollaboratorDto} from "../../../model/vocab/Collaborator.model";


@Injectable({
    providedIn: 'root'
})
export class ProfCollaboratorService extends AbstractService<ProfDto, ProfCriteria> {
    private _user: ReplaySubject<ProfDto> = new ReplaySubject<ProfDto>(1);
    private _students: Array<ManageUserDto> = new Array<ManageUserDto>();

    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/prof/';
    }

    public constrcutDto(): ProfDto {
        return new ProfDto();
    }

    public constrcutCriteria(): ProfCriteria {
        return new ProfCriteria();
    }
    findByUserName(email: string): Observable<ProfDto> {
        return this.http.get<ProfDto>(`${this.API}username/${email}`).pipe(
            catchError(error => {
                console.error('Error fetching collab:', error);
                return throwError(error);
            })
        );
    }
    findAssociatedEtudiant(email: string): Observable<Array<ManageUserDto>> {
        return this.http.get<Array<ManageUserDto>>(`${this.API}username/${email}`)
            .pipe(
                tap((response) => {
                    this._students = response
                }),
            );
    }

    findByCollaboratorId(id: number, pageable: Pageable): Observable<PageRequest<ManageUserDto>> {
        return this.http.get<PageRequest<ManageUserDto>>(this.API + `pageable/collaborator/id/${id}`,
            {
                params: {
                    'page': pageable.page,
                    'size': pageable.size
                }
            });
    }

    update(user: ProfDto): Observable<ProfDto> {
        return this.http.put<ProfDto>(this.API, user);
    }
    updatePasswordChangedStatus(id: number, passwordChanged: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-teacher-password-changed/${id}`, { passwordChanged });
    }
    updateAccountNonExpiredStatus(id: number, accountNonExpired: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-account-non-expired/${id}`, { accountNonExpired });
    }

    updateAccountStatus(id: number, enabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-status/${id}`, { enabled });
    }

    updateCredentialsNonExpiredStatus(id: number, credentialsNonExpired: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-credentials-non-expired/${id}`, { credentialsNonExpired });

    }
    changePassword(username: string, newPassword: string): Observable<any> {
        return this.http.put(`${this.API}change-password`, { username, newPassword });
    }
    updateAccountLockStatus(userId: number, accountNonLocked: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-lock-status/${userId}`, { accountNonLocked });
    }

    create(prof: ProfDto): Observable<ProfDto> {
        return this.http.post<ProfDto>(this.API + 'create', prof);
    }

    deleteById(id: number): Observable<number> {
        return this.http.delete<number>(`${this.API}id/${id}`);
    }

    get(id: number): Observable<ProfDto> {
        return this.http.get<ProfDto>(`${this.API}id/${id}`).pipe(
            tap((prof) => {
                this._user.next(prof);
            }),
        );
    }

}
