import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {ParcoursDto} from '../course/Parcours.model';
import {QuizEtudiantDto} from '../quizetudiant/QuizEtudiant.model';
import {InteretEtudiantDto} from '../inscriptionref/InteretEtudiant.model';
import {StatutSocialDto} from '../inscriptionref/StatutSocial.model';
import {LangueDto} from '../inscriptionref/Langue.model';
import {GroupeEtudeDto} from '../grpe/GroupeEtude.model';
import {CollaboratorDto} from '../vocab/Collaborator.model';
import {SkillDto} from '../inscriptionref/Skill.model';
import {FonctionDto} from '../inscriptionref/Fonction.model';
import {GroupeEtudiantDetailDto} from '../grpe/GroupeEtudiantDetail.model';
import {PackStudentDto} from '../pack/PackStudent.model';
import {TeacherLocalityDto} from '../inscriptionref/TeacherLocality.model';
import {NiveauEtudeDto} from '../inscriptionref/NiveauEtude.model';

export class EtudiantDto extends BaseDto{

    public groupOption: string;

   public subscribe: null | boolean;

   public credentialsNonExpired: null | boolean;

   public enabled: null | boolean;

   public accountNonExpired: null | boolean;

   public accountNonLocked: null | boolean;

   public passwordChanged: null | boolean;

    public username: string;

    public password: string;

    public teacherLocality: TeacherLocalityDto ;
    public parcours: ParcoursDto ;
    public groupeEtude: GroupeEtudeDto ;
    public packStudent: PackStudentDto ;
    public statutSocial: StatutSocialDto ;
    public interetEtudiant: InteretEtudiantDto ;
    public niveauEtude: NiveauEtudeDto ;
    public skill: SkillDto ;
    public fonction: FonctionDto ;
    public langue: LangueDto ;
    public collaborator: CollaboratorDto ;
     public quizEtudiants: Array<QuizEtudiantDto>;
     public groupeEtudiantDetails: Array<GroupeEtudiantDetailDto>;


    constructor() {
        super();

        this.groupOption = '';
        this.subscribe = null;
        this.credentialsNonExpired = null;
        this.enabled = null;
        this.accountNonExpired = null;
        this.accountNonLocked = null;
        this.passwordChanged = null;
        this.username = '';
        this.password = '';
        this.quizEtudiants = new Array<QuizEtudiantDto>();
        this.groupeEtudiantDetails = new Array<GroupeEtudiantDetailDto>();

        }

}
