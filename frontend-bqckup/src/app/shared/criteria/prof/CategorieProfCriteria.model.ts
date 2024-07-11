import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {ProfCriteria} from './ProfCriteria.model';

export class CategorieProfCriteria  extends BaseCriteria  {

    public id: number;
    public code: string;
    public codeLike: string;
    public level: string;
    public levelLike: string;
     public lessonRate: number;
     public lessonRateMin: number;
     public lessonRateMax: number;
      public profs: Array<ProfCriteria>;

}
