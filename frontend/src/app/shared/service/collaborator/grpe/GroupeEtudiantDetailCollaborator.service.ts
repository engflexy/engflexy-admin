import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {environment} from '../../../../../environments/environment';

import {GroupeEtudiantDetailDto} from '../../../model/grpe/GroupeEtudiantDetail.model';
import {GroupeEtudiantDetailCriteria} from '../../../criteria/grpe/GroupeEtudiantDetailCriteria.model';
import {AbstractService} from "../../../../zynerator/service/AbstractService";
import {Observable} from "rxjs";
import {EtudiantDto} from "../../../model/inscription/Etudiant.model";


@Injectable({
    providedIn: 'root'
})
export class GroupeEtudiantDetailCollaboratorService extends AbstractService<GroupeEtudiantDetailDto, GroupeEtudiantDetailCriteria> {
    constructor(private http: HttpClient) {
        super();
        this.setHttp(http);
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/groupeEtudiantDetail/';
    }

    public constrcutDto(): GroupeEtudiantDetailDto {
        return new GroupeEtudiantDetailDto();
    }

    public constrcutCriteria(): GroupeEtudiantDetailCriteria {
        return new GroupeEtudiantDetailCriteria();
    }
    public getGroupesByEtudiantId(Id: number): Observable<GroupeEtudiantDetailDto[]> {
        return this.http.get<GroupeEtudiantDetailDto[]>(`${this.API}etudiant/id/${Id}`);
    }
    findByGroupeEtudiantProfUsername(email: string): Observable<EtudiantDto[]> {
        const url = `${this.API}username/${email}`;
        return this.http.get<EtudiantDto[]>(url);
    }
}
