import {PaiementInscriptionCollaboratorStateCriteria} from './PaiementInscriptionCollaboratorStateCriteria.model';
import {InscriptionCollaboratorCriteria} from './InscriptionCollaboratorCriteria.model';
import {BaseCriteria} from "../../../zynerator/criteria/BaseCriteria.model";


export class PaiementInscriptionCollaboratorCriteria extends BaseCriteria {

    public id: number;
     public total: number;
     public totalMin: number;
     public totalMax: number;
     public discount: number;
     public discountMin: number;
     public discountMax: number;
     public remaining: number;
     public remainingMin: number;
     public remainingMax: number;
    public paiementDate: Date;
    public paiementDateFrom: Date;
    public paiementDateTo: Date;
  public inscriptionCollaborator: InscriptionCollaboratorCriteria ;
  public inscriptionCollaborators: Array<InscriptionCollaboratorCriteria> ;

}
