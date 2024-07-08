import {BaseCriteria} from 'src/app/zynerator/criteria/BaseCriteria.model';
import {FaqTypeCriteria} from './FaqTypeCriteria.model';
import {ProfCriteria} from '../prof/ProfCriteria.model';

export class FaqProfCriteria  extends BaseCriteria  {

    public id: number;
    public description: string;
    public descriptionLike: string;
    public libelle: string;
    public libelleLike: string;
  public prof: ProfCriteria ;
  public profs: Array<ProfCriteria> ;
  public faqType: FaqTypeCriteria ;
  public faqTypes: Array<FaqTypeCriteria> ;

}
