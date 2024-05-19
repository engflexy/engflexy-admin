import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {EtudiantCriteria} from '../inscription/EtudiantCriteria.model';
import {GroupeEtudiantCriteria} from './GroupeEtudiantCriteria.model';

export class GroupeEtudiantDetailCriteria  extends BaseCriteria  {

    public id: number;
  public etudiant: EtudiantCriteria ;
  public etudiants: Array<EtudiantCriteria> ;

}
