import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {ContentTypeCriteria} from '../courseref/ContentTypeCriteria.model';
import {SectionCriteria} from './SectionCriteria.model';

export class ExerciceCriteria  extends BaseCriteria  {

    public id: number;
    public content: string;
    public contentLike: string;
    public description: string;
    public descriptionLike: string;
    public libelle: string;
    public libelleLike: string;
     public numero: number;
     public numeroMin: number;
     public numeroMax: number;
  public contentType: ContentTypeCriteria ;
  public contentTypes: Array<ContentTypeCriteria> ;

}
