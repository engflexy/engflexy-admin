import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {SalaryCriteria} from '../salary/SalaryCriteria.model';
import {ProfCriteria} from './ProfCriteria.model';

export class ClassAverageBonusProfCriteria  extends BaseCriteria  {

    public id: number;
     public mois: number;
     public moisMin: number;
     public moisMax: number;
     public annee: number;
     public anneeMin: number;
     public anneeMax: number;
  public prof: ProfCriteria ;
  public profs: Array<ProfCriteria> ;
  public salary: SalaryCriteria ;
  public salarys: Array<SalaryCriteria> ;

}
