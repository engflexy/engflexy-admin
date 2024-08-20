import {HttpClient, HttpErrorResponse} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {Router} from '@angular/router';


import {BehaviorSubject, Observable, of, switchMap, throwError} from 'rxjs';


import {TokenService} from './Token.service';
import {UserDto} from '../model/User.model';
import {RoleDto} from '../model/Role.model';
import {RoleUserDto} from '../model/RoleUser.model';
import {environment} from "../../../../../environments/environment";
import {AuthUtils} from "../../../../core/auth/auth.utils";
import {UserService} from "../../../../core/user/user.service";

@Injectable({
    providedIn: 'root'
})
export class AuthService {
    readonly API = environment.loginUrl;
    public _user = new UserDto();
    private _authenticatedUser = new UserDto();
    private _authenticated = (JSON.parse(localStorage.getItem('autenticated')) as boolean) || false;
    public _loggedIn = new BehaviorSubject<boolean>(false);
    public loggedIn$ = this._loggedIn.asObservable();
    public error: string = null;

    /**
     * Setter & getter for access token
     */
    set accessToken(token: string) {
        localStorage.setItem('token', token);
    }

    get accessToken(): string {
        return localStorage.getItem('token') ?? '';
    }

    constructor(private http: HttpClient,
                private _userService: UserService,
                private tokenService: TokenService, private router: Router) {
    }

    /**
     * Check the authentication status
     */
    check(): Observable<boolean> {

        // Check the access token availability
        if (!this.accessToken) {
            return of(false);
        }

        // Check the access token expire date
        if (AuthUtils.isTokenExpired(this.accessToken)) {
            return of(false);
        }

        // If the access token exists, and it didn't expire, sign in using it
        return this.loadInfos();
    }


    public login(username: string, password: string): Observable<any> {
        return this.http.post<any>(this.API + 'login', {username, password}, {observe: 'response'})
            .pipe(
                switchMap((resp: any) => {
                    console.log(resp);
                    this.error = null;
                    const jwt = 'Bearer ' + resp.body.accessToken;
                    jwt != null ? this.tokenService.saveToken(jwt) : false;
                    return this.loadInfos().pipe(
                        switchMap(() => {
                            console.log("connected user",this._authenticatedUser);
                            if (!this._authenticatedUser.id) {
                                console.error('User ID not set after login');
                                return throwError('User ID not set');
                            }
                            console.log('you are logged in successfully');
                            return of(resp);
                        })
                    );
                })
            );
    }

    public loadInfos(): Observable<boolean> {
        const tokenDecoded = this.tokenService.decode();
        this._authenticatedUser.id = tokenDecoded?.id; // Assuming the token contains the user ID
        this._authenticatedUser.username = tokenDecoded?.sub;
        const roles = tokenDecoded?.roles;
        this._authenticatedUser.passwordChanged = tokenDecoded?.passwordChanged;
        this._authenticatedUser.phone = tokenDecoded?.phone;
        this._authenticatedUser.fullName = tokenDecoded?.firstName;
        this._authenticatedUser.email = tokenDecoded?.email;
        roles.forEach(role => {
            const roleUser = new RoleUserDto();
            roleUser.role.authority = role;
            this._authenticatedUser.roleUsers.push(roleUser);
        });
        localStorage.setItem('autenticated', JSON.stringify(true));
        this.authenticated = true;
        this._loggedIn.next(true);
        return of(true);
    }


    public hasRole(role: RoleDto): boolean {
        const index = this._authenticatedUser.roleUsers.findIndex(r => r.role.authority === role.authority);
        return index > -1 ? true : false;
    }

    public registerAdmin() {
        this.http.post<any>(this.API + 'api/user/', this.user, {observe: 'response'}).subscribe(
            resp => {
                this.router.navigate(['admin/login']);
            }, (error: HttpErrorResponse) => {
                console.log(error.error);
            }
        );
    }

    public logout() {
        this.tokenService.removeToken();
        localStorage.setItem('autenticated', JSON.stringify(false));
        this.authenticated = false;
        this._loggedIn.next(false);
        this._authenticatedUser = new UserDto();
        this.router.navigate(['']);
    }

    /**
     * Forgot password
     *
     * @param email
     */
    forgotPassword(email: string): Observable<any> {
        return this.http.post('api/auth/forgot-password', email);
    }

    /**
     * Reset password
     *
     * @param password
     */
    resetPassword(password: string): Observable<any> {
        return this.http.post('api/auth/reset-password', password);
    }

    /**
     * Sign up
     *
     * @param user
     */
    signUp(user: { name: string; email: string; password: string; company: string }): Observable<any> {
        return this.http.post('api/auth/sign-up', user);
    }

    get user(): UserDto {
        return this._user;
    }

    set user(value: UserDto) {
        this._user = value;
    }

    get authenticated(): boolean {

        return this._authenticated;
    }

    set authenticated(value: boolean) {
        this._authenticated = value;
    }

    get authenticatedUser(): UserDto {
        return this._authenticatedUser;
    }

    set authenticatedUser(value: UserDto) {
        this._authenticatedUser = value;
    }


}
