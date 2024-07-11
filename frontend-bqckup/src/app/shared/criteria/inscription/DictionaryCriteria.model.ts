import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {EtudiantCriteria} from './EtudiantCriteria.model';

export class DictionaryCriteria  extends BaseCriteria  {

    public id: number;
    public word: string;
    public wordLike: string;
    public definition: string;
    public definitionLike: string;
    public createdOn: string;
    public createdOnLike: string;
  public etudiant: EtudiantCriteria ;
  public etudiants: Array<EtudiantCriteria> ;

}
