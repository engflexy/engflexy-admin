import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {QuizCriteria} from '../quiz/QuizCriteria.model';
import {EtudiantCriteria} from '../inscription/EtudiantCriteria.model';
import {ReponseEtudiantCriteria} from './ReponseEtudiantCriteria.model';

export class QuizEtudiantCriteria  extends BaseCriteria  {

    public id: number;
    public ref: string;
    public refLike: string;
     public note: number;
     public noteMin: number;
     public noteMax: number;
    public resultat: string;
    public resultatLike: string;
     public questionCurrent: number;
     public questionCurrentMin: number;
     public questionCurrentMax: number;
  public etudiant: EtudiantCriteria ;
  public etudiants: Array<EtudiantCriteria> ;
  public quiz: QuizCriteria ;
  public quizs: Array<QuizCriteria> ;
      public reponseEtudiants: Array<ReponseEtudiantCriteria>;

}
