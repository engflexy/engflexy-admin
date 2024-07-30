import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {AbstractService} from "../../../zynerator/service/AbstractService";
import {CollaboratorDto} from "../../model/vocab/Collaborator.model";
import {CollaboratorCriteria} from "../../criteria/vocab/CollaboratorCriteria.model";
import {environment} from "../../../../environments/environment";

@Injectable({
    providedIn: 'root'
})
export class UserPublicService extends AbstractService<CollaboratorDto, CollaboratorCriteria> {
    constructor(private http: HttpClient) {
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
}
