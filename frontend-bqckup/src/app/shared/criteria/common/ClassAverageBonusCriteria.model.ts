import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {CollaboratorCriteria} from '../vocab/CollaboratorCriteria.model';

export class ClassAverageBonusCriteria  extends BaseCriteria  {

    public id: number;
    public code: string;
    public codeLike: string;
     public nombreSession: number;
     public nombreSessionMin: number;
     public nombreSessionMax: number;
     public prix: number;
     public prixMin: number;
     public prixMax: number;

}
