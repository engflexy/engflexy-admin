import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {TypeReclamationProfCriteria} from './TypeReclamationProfCriteria.model';
import {ProfCriteria} from '../prof/ProfCriteria.model';

export class ReclamationProfCriteria  extends BaseCriteria  {

    public id: number;
    public reference: string;
    public referenceLike: string;
    public dateReclamation: Date;
    public dateReclamationFrom: Date;
    public dateReclamationTo: Date;
    public message: string;
    public messageLike: string;
    public traite: null | boolean;
    public dateTraitement: Date;
    public dateTraitementFrom: Date;
    public dateTraitementTo: Date;
    public dateReponse: Date;
    public dateReponseFrom: Date;
    public dateReponseTo: Date;
    public postView: null | boolean;
    public commentaireTraiteur: string;
    public commentaireTraiteurLike: string;
    public objetReclamationProf: string;
    public objetReclamationProfLike: string;
  public prof: ProfCriteria ;
  public profs: Array<ProfCriteria> ;

}
