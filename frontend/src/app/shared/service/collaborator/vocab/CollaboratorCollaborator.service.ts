import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {CollaboratorDto} from '../../../model/vocab/Collaborator.model';
import {CollaboratorCriteria} from '../../../criteria/vocab/CollaboratorCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {catchError, Observable, ReplaySubject, tap, throwError} from "rxjs";
import {ProfDto} from "../../../model/prof/Prof.model";
import {EtudiantDto} from "../../../model/inscription/Etudiant.model";


@Injectable({
    providedIn: 'root'
})
export class CollaboratorCollaboratorService extends AbstractService<CollaboratorDto, CollaboratorCriteria> {

    private _user: ReplaySubject<CollaboratorDto> = new ReplaySubject<CollaboratorDto>(1);
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/collaborator/';
    }

    public constrcutDto(): CollaboratorDto {
        return new CollaboratorDto();
    }

    public constrcutCriteria(): CollaboratorCriteria {
        return new CollaboratorCriteria();
    }

    get(id: number): Observable<CollaboratorDto> {
        return this.http.get<CollaboratorDto>(`${this.API}id/${id}`).pipe(
            tap((collaborator) => {
                this._user.next(collaborator);
            }),
        );
    }
    updatePasswordChangedStatus(id: number, passwordChanged: boolean): Observable<any> {
        return this.http.patch(`${this.API}update-password-changed/${id}`, { passwordChanged });
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

    findByUserName(email: string): Observable<CollaboratorDto> {
        return this.http.get<CollaboratorDto>(`${this.API}username/${email}`).pipe(
            catchError(error => {
                console.error('Error fetching collab:', error);
                return throwError(error);
            })
        );
    }
    onCommunicationEnabled(userId: number, communicationEnabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}communicationEnabled/${userId}`, { communicationEnabled });
    }
    onSecurityEnabled(userId: number, securityEnabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}securityEnabled/${userId}`, { securityEnabled });
    }
    onLessonReminderEnabled(userId: number, lessonReminderEnabled: boolean): Observable<any> {
        return this.http.patch(`${this.API}lessonReminderEnabled/${userId}`, { lessonReminderEnabled });
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
}
