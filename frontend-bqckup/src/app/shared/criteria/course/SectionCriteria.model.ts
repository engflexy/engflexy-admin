import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {QuizCriteria} from '../quiz/QuizCriteria.model';
import {ExerciceCriteria} from './ExerciceCriteria.model';
import {CoursCriteria} from './CoursCriteria.model';

export class SectionCriteria  extends BaseCriteria  {

    public id: number;
    public code: string;
    public codeLike: string;
    public libelle: string;
    public libelleLike: string;
    public description: string;
    public descriptionLike: string;
      public quizs: Array<QuizCriteria>;
      public exercices: Array<ExerciceCriteria>;

}
