import {Injectable} from '@angular/core';
import {JwtHelperService} from '@auth0/angular-jwt';

@Injectable({
    providedIn: 'root'
})
export class TokenService {
    constructor() {
    }

    public saveToken(token: string) {
        localStorage.setItem('token', token);
    }

    public decode() {
        const helper = new JwtHelperService();
        return helper.decodeToken(localStorage.getItem('token') || '{}');
    }

    public removeToken() {
        localStorage.removeItem('token');
    }

    public token() {
        return localStorage.getItem('token');
    }

    public getUsername(): string {
        const tokenDecoded = this.decode();
        return tokenDecoded.sub;
    }xx

    public getUserId(): string {
        const token = this.token(); // replace this with your method to get the token
        const decodedToken = this.decode();
        return decodedToken.id; // replace 'id' with the actual key in the payload
    }

}
