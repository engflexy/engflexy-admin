import {Injectable} from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {AbstractService} from "../../../zynerator/service/AbstractService";
import {CollaboratorDto} from "../../model/vocab/Collaborator.model";
import {CollaboratorCriteria} from "../../criteria/vocab/CollaboratorCriteria.model";
import {environment} from "../../../../environments/environment";
import {BehaviorSubject, Observable, of, switchMap} from "rxjs";
import {AccountValidationDto} from "../../../zynerator/dto/AccountValidationDto";
import {TokenService} from "../../../zynerator/security/shared/service/Token.service";
import {RoleUserDto} from "../../../zynerator/security/shared/model/RoleUser.model";
import {UserDto} from "../../../zynerator/security/shared/model/User.model";

@Injectable({
    providedIn: 'root'
})
export class UserPublicService extends AbstractService<CollaboratorDto, CollaboratorCriteria> {
    public error: string = null;
    private _authenticatedUser = new UserDto();
    public _loggedIn = new BehaviorSubject<boolean>(false);
    private _authenticated = (JSON.parse(localStorage.getItem('autenticated')) as boolean) || false;
    constructor(private http: HttpClient,private tokenService: TokenService,) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'public/users/';
    }

    public constrcutDto(): CollaboratorDto {
        return new CollaboratorDto();
    }

    public constrcutCriteria(): CollaboratorCriteria {
        return new CollaboratorCriteria();
    }
    public loadInfos(): Observable<boolean> {
        const tokenDecoded = this.tokenService.decode();
        this._authenticatedUser.username = tokenDecoded?.sub;
        const roles = tokenDecoded?.roles;
        this._authenticatedUser.passwordChanged = tokenDecoded?.passwordChanged;
        this._authenticatedUser.phone = tokenDecoded?.phone;
        this._authenticatedUser.fullName = tokenDecoded?.firstName;
        this._authenticatedUser.email = tokenDecoded?.email;
        this._authenticatedUser.id = tokenDecoded?.id;
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
    get authenticated(): boolean {

        return this._authenticated;
    }

    set authenticated(value: boolean) {
        this._authenticated = value;
    }
    public validateUser(accountValidation: AccountValidationDto): Observable<any> {
        return this.http.post<any>(this.API + 'validate', accountValidation, { observe: 'response' })
            .pipe(
                switchMap((resp: any) => {
                    console.log(resp);
                    this.error = null;
                    const jwt = 'Bearer ' + resp.body.accessToken;
                    if (jwt) {
                        console.log(jwt)
                        this.tokenService.saveToken(jwt);
                        //this.loadInfos();
                        console.log('User validated successfully');
                    }
                    return of(resp);
                })
            );
    }
    public register(collaborator: CollaboratorDto): Observable<CollaboratorDto> {
        return this.http.post<CollaboratorDto>(`${this.API}register`, collaborator);
    }

}
