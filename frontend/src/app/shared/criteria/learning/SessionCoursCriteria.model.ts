import {BaseCriteria} from 'src/app/zynerator/criteria/BaseCriteria.model';
import {SalaryCriteria} from '../salary/SalaryCriteria.model';
import {GroupeEtudiantCriteria} from '../grpe/GroupeEtudiantCriteria.model';
import {SessionCoursSectionCriteria} from './SessionCoursSectionCriteria.model';
import {CoursCriteria} from '../course/CoursCriteria.model';
import {ProfCriteria} from '../prof/ProfCriteria.model';

export class SessionCoursCriteria  extends BaseCriteria  {

    public id: number;
    public reference: string;
    public referenceLike: string;
     public duree: number;
     public dureeMin: number;
     public dureeMax: number;
     public totalheure: number;
     public totalheureMin: number;
     public totalheureMax: number;
     public mois: number;
     public moisMin: number;
     public moisMax: number;
     public annee: number;
     public anneeMin: number;
     public anneeMax: number;
    public dateFin: Date;
    public dateFinFrom: Date;
    public dateFinTo: Date;
    public dateDebut: Date;
    public dateDebutFrom: Date;
    public dateDebutTo: Date;
    public payer: null | boolean;
     public nreKeySectionFinished: number;
     public nreKeySectionFinishedMin: number;
     public nreKeySectionFinishedMax: number;
     public nreAddSectionFinished: number;
     public nreAddSectionFinishedMin: number;
     public nreAddSectionFinishedMax: number;
     public totalKeySection: number;
     public totalKeySectionMin: number;
     public totalKeySectionMax: number;
     public totalAddSection: number;
     public totalAddSectionMin: number;
     public totalAddSectionMax: number;
     public nreWords: number;
     public nreWordsMin: number;
     public nreWordsMax: number;
    public homeworkFinished: null | boolean;
    public courseFinished: null | boolean;
      public sessionCoursSections: Array<SessionCoursSectionCriteria>;

}
