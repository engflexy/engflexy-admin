import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {HomeWorkQuestionCriteria} from './HomeWorkQuestionCriteria.model';
import {TypeHomeWorkCriteria} from './TypeHomeWorkCriteria.model';
import {CoursCriteria} from '../course/CoursCriteria.model';

export class HomeWorkCriteria  extends BaseCriteria  {

    public id: number;
    public libelle: string;
    public libelleLike: string;
    public urlImage: string;
    public urlImageLike: string;
    public urlVideo: string;
    public urlVideoLike: string;
  public cours: CoursCriteria ;
  public courss: Array<CoursCriteria> ;
  public typeHomeWork: TypeHomeWorkCriteria ;
  public typeHomeWorks: Array<TypeHomeWorkCriteria> ;
      public homeWorkQuestions: Array<HomeWorkQuestionCriteria>;

}
