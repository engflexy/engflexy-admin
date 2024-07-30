import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {ParcoursDto} from '../../../model/course/Parcours.model';
import {ParcoursCriteria} from '../../../criteria/course/ParcoursCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Observable} from "rxjs";
import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";


@Injectable({
    providedIn: 'root'
})
export class ParcoursCollaboratorService extends AbstractService<ParcoursDto, ParcoursCriteria> {
    constructor(private http: HttpClient, private auth:AuthService) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/parcours/';
    }

    public constrcutDto(): ParcoursDto {
        return new ParcoursDto();
    }

    public findForCurrentCollaborator(): Observable<ParcoursDto[]> {
        return this.http.get<ParcoursDto[]>(`${this.API}current/id/${this.auth.authenticatedUser.id}`);
    }

    public findByForExgFlexy(): Observable<ParcoursDto[]> {
        return this.http.get<ParcoursDto[]>(`${this.API}exgflexy`);
    }

    constrcutCriteria(): ParcoursCriteria {
        return new ParcoursCriteria();
    }


    findByLibelleLikeForEngFlexy(libelle: string): Observable<ParcoursDto[]> {
    return this.http.get<ParcoursDto[]>(`${this.API}engflexy/libelle/${libelle}`);
}

    findByLibelleLikeForCurrent(libelle: string): Observable<ParcoursDto[]> {
    return this.http.get<ParcoursDto[]>(`${this.API}current/libelle/${libelle}`);
}
}
