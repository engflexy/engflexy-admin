import {PackageCollaboratorCriteria} from './PackageCollaboratorCriteria.model';
import {BaseCriteria} from "../../../zynerator/criteria/BaseCriteria.model";
import {CollaboratorDto} from "../../model/vocab/Collaborator.model";
import {TypeCollaboratorDto} from "../../model/prof/TypeCollaborator.model";
import {CollaboratorCriteria} from "../vocab/CollaboratorCriteria.model";
import {InscriptionCollaboratorStateCriteria} from "./InscriptionCollaboratorStateCriteria.model";


export class InscriptionCollaboratorCriteria extends BaseCriteria {

    public id: number;
    public price: number;
    public priceMin: number;
    public priceMax: number;
    public nbrStudent: number;
    public nbrStudentMin: number;
    public nbrStudentMax: number;
    public logo: null | boolean;
    public color: null | boolean;
    public bannerAd: null | boolean;
    public startDate: Date;
    public startDateFrom: Date;
    public startDateTo: Date;
    public endDate: Date;
    public endDateFrom: Date;
    public endDateTo: Date;
    public packageCollaborator: PackageCollaboratorCriteria;
    public collaborator: CollaboratorCriteria;
    public inscriptionCollaboratorState: InscriptionCollaboratorStateCriteria;
    public packageCollaborators: Array<PackageCollaboratorCriteria>;

}
