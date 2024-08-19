import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {EtudiantDto} from '../../../model/inscription/Etudiant.model';
import {EtudiantCriteria} from '../../../criteria/inscription/EtudiantCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Pageable} from "../../../utils/Pageable";
import {catchError, Observable, ReplaySubject, retry, tap, throwError} from "rxjs";
import {PageRequest} from "../../../../zynerator/criteria/BaseCriteria.model";
import {ManageUserDto} from "../../../../core/criteria/manage-user-dto";
import {UserCriteria} from "../../../../zynerator/security/shared/criteria/UserCriteria.model";
import {ProfDto} from "../../../model/prof/Prof.model";


@Injectable({
    providedIn: 'root'
})
export class EtudiantCollaboratorService extends AbstractService<EtudiantDto, EtudiantCriteria> {
    private _students: Array<ManageUserDto> = new Array<ManageUserDto>();
    private _user: ReplaySubject<EtudiantDto> = new ReplaySubject<EtudiantDto>(1);

    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }


    get students(): Array<ManageUserDto> {
        return this._students;
    }

    set students(value: Array<ManageUserDto>) {
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

    findAllByCollaboratorId(id: number): Observable<Array<ManageUserDto>> {
        return this.http.get<Array<ManageUserDto>>(this.API + `collaborator/id/${id}`)
            .pipe(
                tap((response) => {
                    this._students = response
                }),
            );
    }

    findByCollaboratorId(id: number | undefined, pageable: Pageable): Observable<PageRequest<ManageUserDto>> {
        console.log('Service method called with ID:', id);
        if (id === undefined) {
            console.error('Collaborator ID is undefined');
            return throwError(() => new Error('Collaborator ID is undefined'));
        }
        return this.http.get<PageRequest<ManageUserDto>>(this.API + `pageable/collaborator/id/${id}`,
            {
                params: {
                    'page': pageable.page.toString(),
                    'size': pageable.size.toString()
                }
            });
    }
    findByUserName(email: string): Observable<EtudiantDto> {
        return this.http.get<EtudiantDto>(`${this.API}username/${email}`).pipe(
            catchError(error => {
                console.error('Error fetching etudiant:', error);
                return throwError(error);
            })
        );
    }
    create(student: EtudiantDto): Observable<EtudiantDto> {
        return this.http.post<EtudiantDto>(this.API + 'create', student);
    }

    update(user: EtudiantDto) {
        return this.http.put<EtudiantDto>(`${this.API}`, user)
            .pipe(
                retry(3), // Retry up to 3 times
                catchError(error => {
                    console.error('Error in update service:', error);
                    return throwError('Failed to update student profile');
                })
            );
    }

    deleteById(id: number): Observable<number> {
        return this.http.delete<number>(`${this.API}id/${id}`);
    }

    updateAccountStatus(userId: number, enabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-status/${userId}`, { enabled });
    }
    onCommunicationEnabled(userId: number, communicationEnabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}communicationEnabled/${userId}`, { communicationEnabled });
    }
    onSecurityEnabled(userId: number, securityEnabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}securityEnabled/${userId}`, { securityEnabled });
    }
    onLessonReminderEnabled(userId: number, communicationEnabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}lessonReminderEnabled/${userId}`, { communicationEnabled });
    }
    onClassroomEnabled(userId: number, classroomEnabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}classroomEnabled/${userId}`, { classroomEnabled });
    }
    onPasswordChangedNotificationEnabled(userId: number, passwordChangedNotificationEnabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}passwordChangedNotificationEnabled/${userId}`, { passwordChangedNotificationEnabled });
    }
    onContactNotificationEnabled(userId: number, contactNotificationEnabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}contactNotificationEnabled/${userId}`, { contactNotificationEnabled });
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
    findAllByCriteria(pageable: Pageable): Observable<PageRequest<ManageUserDto>> {
        return this.http.get<PageRequest<ManageUserDto>>(this.API + `pageable`,
            {
                params: {
                    'page': pageable.page,
                    'size': pageable.size
                }
            });
    }
    get(id: number): Observable<EtudiantDto> {
        return this.http.get<EtudiantDto>(`${this.API}id/${id}`).pipe(
            tap((etudiant) => {
                this._user.next(etudiant);
            }),
        );
    }
}
