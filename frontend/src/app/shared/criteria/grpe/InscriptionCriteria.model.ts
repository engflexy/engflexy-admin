import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {ParcoursCriteria} from '../course/ParcoursCriteria.model';
import {QuizCriteria} from '../quiz/QuizCriteria.model';
import {SkillCriteria} from '../inscriptionref/SkillCriteria.model';
import {InteretEtudiantCriteria} from '../inscriptionref/InteretEtudiantCriteria.model';
import {FonctionCriteria} from '../inscriptionref/FonctionCriteria.model';
import {EtudiantCriteria} from '../inscription/EtudiantCriteria.model';
import {EtatInscriptionCriteria} from '../inscriptionref/EtatInscriptionCriteria.model';
import {GroupeTypeCriteria} from './GroupeTypeCriteria.model';
import {StatutSocialCriteria} from '../inscriptionref/StatutSocialCriteria.model';
import {PackStudentCriteria} from '../pack/PackStudentCriteria.model';
import {GroupeEtudeCriteria} from './GroupeEtudeCriteria.model';
import {NiveauEtudeCriteria} from '../inscriptionref/NiveauEtudeCriteria.model';

export class InscriptionCriteria  extends BaseCriteria  {

    public id: number;
     public numeroInscription: number;
     public numeroInscriptionMin: number;
     public numeroInscriptionMax: number;
     public noteQuizNiveau: number;
     public noteQuizNiveauMin: number;
     public noteQuizNiveauMax: number;
    public quizFinished: null | boolean;
    public subscriptionFinished: null | boolean;
    public dateRegistration: string;
    public dateRegistrationLike: string;
    public datedebutinscription: Date;
    public datedebutinscriptionFrom: Date;
    public datedebutinscriptionTo: Date;
    public datefininscription: Date;
    public datefininscriptionFrom: Date;
    public datefininscriptionTo: Date;
    public skype: string;
    public skypeLike: string;
    public etudiant =new EtudiantCriteria() ;
  public etudiants: Array<EtudiantCriteria> ;
  public etatInscription: EtatInscriptionCriteria ;
  public etatInscriptions: Array<EtatInscriptionCriteria> ;
  public parcours: ParcoursCriteria ;
  public parcourss: Array<ParcoursCriteria> ;
  public statutSocial: StatutSocialCriteria ;
  public statutSocials: Array<StatutSocialCriteria> ;
  public interetEtudiant: InteretEtudiantCriteria ;
  public interetEtudiants: Array<InteretEtudiantCriteria> ;
  public quiz: QuizCriteria ;
  public quizs: Array<QuizCriteria> ;
  public packStudent: PackStudentCriteria ;
  public packStudents: Array<PackStudentCriteria> ;
  public skill: SkillCriteria ;
  public skills: Array<SkillCriteria> ;

}
