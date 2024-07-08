import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {ParcoursCriteria} from '../course/ParcoursCriteria.model';
import {GroupeEtatCriteria} from './GroupeEtatCriteria.model';
import {GroupeEtudiantDetailCriteria} from './GroupeEtudiantDetailCriteria.model';
import {GroupeTypeCriteria} from './GroupeTypeCriteria.model';
import {GroupeEtudeCriteria} from './GroupeEtudeCriteria.model';
import {ProfCriteria} from '../prof/ProfCriteria.model';

export class GroupeEtudiantCriteria extends BaseCriteria {

    public id: number;
    public libelle: string;
    public libelleLike: string;
    public type: string;
    public typeLike: string;
    public dateDebut: Date;
    public dateDebutFrom: Date;
    public dateDebutTo: Date;
    public dateFin: Date;
    public dateFinFrom: Date;
    public dateFinTo: Date;
    public nombrePlace: number;
    public nombrePlaceMin: number;
    public nombrePlaceMax: number;
    public nombrePlacevide: number;
    public nombrePlacevideMin: number;
    public nombrePlacevideMax: number;
    public nombrePlaceNonVide: number;
    public nombrePlaceNonVideMin: number;
    public nombrePlaceNonVideMax: number;
    public nreCoursesComing: number;
    public nreCoursesComingMin: number;
    public nreCoursesComingMax: number;
    public nreCoursesCompleted: number;
    public nreCoursesCompletedMin: number;
    public nreCoursesCompletedMax: number;
    public nreCourses: number;
    public nreCoursesMin: number;
    public nreCoursesMax: number;
    public groupeEtude: GroupeEtudeCriteria;
    public groupeEtudes: Array<GroupeEtudeCriteria>;
    public groupeType: GroupeTypeCriteria;
    public groupeTypes: Array<GroupeTypeCriteria>;
    public groupeEtat: GroupeEtatCriteria;
    public groupeEtats: Array<GroupeEtatCriteria>;
    public parcours: ParcoursCriteria;
    public parcourss: Array<ParcoursCriteria>;
    public prof: ProfCriteria;
    public profs: Array<ProfCriteria>;
    public groupeEtudiantDetails: Array<GroupeEtudiantDetailCriteria>;

    constructor() {
        super();
    }
}
