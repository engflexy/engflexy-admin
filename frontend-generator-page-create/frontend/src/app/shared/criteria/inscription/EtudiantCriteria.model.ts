import {BaseCriteria} from 'src/app/zynerator/criteria/BaseCriteria.model';
import {ParcoursCriteria} from '../course/ParcoursCriteria.model';
import {QuizEtudiantCriteria} from '../quizetudiant/QuizEtudiantCriteria.model';
import {InteretEtudiantCriteria} from '../inscriptionref/InteretEtudiantCriteria.model';
import {StatutSocialCriteria} from '../inscriptionref/StatutSocialCriteria.model';
import {LangueCriteria} from '../inscriptionref/LangueCriteria.model';
import {GroupeEtudeCriteria} from '../grpe/GroupeEtudeCriteria.model';
import {CollaboratorCriteria} from '../vocab/CollaboratorCriteria.model';
import {SkillCriteria} from '../inscriptionref/SkillCriteria.model';
import {FonctionCriteria} from '../inscriptionref/FonctionCriteria.model';
import {GroupeEtudiantDetailCriteria} from '../grpe/GroupeEtudiantDetailCriteria.model';
import {PackStudentCriteria} from '../pack/PackStudentCriteria.model';
import {TeacherLocalityCriteria} from '../inscriptionref/TeacherLocalityCriteria.model';
import {NiveauEtudeCriteria} from '../inscriptionref/NiveauEtudeCriteria.model';

export class EtudiantCriteria  extends BaseCriteria  {

    public groupOption: string;
    public groupOptionLike: string;
    public credentialsNonExpired: null | boolean;
    public enabled: null | boolean;
    public accountNonExpired: null | boolean;
    public accountNonLocked: null | boolean;
    public passwordChanged: null | boolean;
    public username: string;
    public usernameLike: string;
    public password: string;
    public passwordLike: string;
      public quizEtudiants: Array<QuizEtudiantCriteria>;
      public groupeEtudiantDetails: Array<GroupeEtudiantDetailCriteria>;

}
