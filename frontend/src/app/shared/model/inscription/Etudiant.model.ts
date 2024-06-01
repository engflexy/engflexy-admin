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
import {UserDto} from "../../../zynerator/security/shared/model/User.model";

export class EtudiantDto extends UserDto {

    public groupOption: string;

    public subscribe: null | boolean;

    public teacherLocality: TeacherLocalityDto;
    public parcours: ParcoursDto;
    public groupeEtude: GroupeEtudeDto;
    public packStudent: PackStudentDto;
    public statutSocial: StatutSocialDto;
    public interetEtudiant: InteretEtudiantDto;
    public niveauEtude: NiveauEtudeDto;
    public skill: SkillDto;
    public fonction: FonctionDto;
    public langue: LangueDto;
    public collaborator: CollaboratorDto;
    public quizEtudiants: Array<QuizEtudiantDto>;
    public groupeEtudiantDetails: Array<GroupeEtudiantDetailDto>;


    constructor() {
        super();

        this.groupOption = null;
        this.subscribe = true;
        this.quizEtudiants = new Array<QuizEtudiantDto>();
        this.groupeEtudiantDetails = new Array<GroupeEtudiantDetailDto>();

    }

}
