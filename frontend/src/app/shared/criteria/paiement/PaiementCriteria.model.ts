import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {GroupeEtudiantCriteria} from '../grpe/GroupeEtudiantCriteria.model';
import {ProfCriteria} from '../prof/ProfCriteria.model';

export class PaiementCriteria  extends BaseCriteria  {

    public id: number;
    public datePaiement: Date;
    public datePaiementFrom: Date;
    public datePaiementTo: Date;

}
