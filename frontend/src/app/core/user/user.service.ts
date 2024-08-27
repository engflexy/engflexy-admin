import {HttpClient, HttpParams} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {User} from 'app/core/user/user.types';
import {map, Observable, ReplaySubject, tap} from 'rxjs';
import {environment} from "../../../environments/environment";
import {UserDto} from "../../zynerator/security/shared/model/User.model";

@Injectable({providedIn: 'root'})
export class UserService {
    API = environment.apiUrl + 'api/user'
    private _user: ReplaySubject<UserDto> = new ReplaySubject<UserDto>(1);

    /**
     * Constructor
     */
    constructor(private _httpClient: HttpClient) {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Accessors
    // -----------------------------------------------------------------------------------------------------

    /**
     * Setter & getter for user
     *
     * @param value
     */
    set user(value: UserDto) {
        // Store the value
        this._user.next(value);
    }

    get user$(): Observable<UserDto> {
        return this._user.asObservable();
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Get the current logged in user data
     */
    get(email: string): Observable<UserDto> {
        return this._httpClient.get<UserDto>(`${this.API}/username/${email}`).pipe(
            tap((user) => {
                this._user.next(user);
            }),
        );
    }

    /**
     * Update the user
     *
     * @param user
     */
    update(user: UserDto): Observable<any> {
        return this._httpClient.patch<UserDto>('api/common/user', {user}).pipe(
            map((response) => {
                this._user.next(response);
            }),
        );
    }

}
