import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {ParcoursDto} from '../course/Parcours.model';
import {GroupeEtatDto} from './GroupeEtat.model';
import {GroupeEtudiantDetailDto} from './GroupeEtudiantDetail.model';
import {GroupeTypeDto} from './GroupeType.model';
import {GroupeEtudeDto} from './GroupeEtude.model';
import {ProfDto} from '../prof/Prof.model';

export class GroupeEtudiantDto extends BaseDto{

    public libelle: string;

    public type: string;

   public dateDebut: Date;

   public dateFin: Date;

    public nombrePlace: null | number;

    public nombrePlacevide: null | number;

    public nombrePlaceNonVide: null | number;

    public nreCoursesComing: null | number;

    public nreCoursesCompleted: null | number;

    public nreCourses: null | number;

    public groupeEtude: GroupeEtudeDto ;
    public groupeType: GroupeTypeDto ;
    public groupeEtat: GroupeEtatDto ;
    public parcours: ParcoursDto ;
    public prof: ProfDto ;
     public groupeEtudiantDetails: Array<GroupeEtudiantDetailDto>;


    constructor() {
        super();

        this.libelle = '';
        this.type = '';
        this.dateDebut = null;
        this.dateFin = null;
        this.nombrePlace = null;
        this.nombrePlacevide = null;
        this.nombrePlaceNonVide = null;
        this.nreCoursesComing = null;
        this.nreCoursesCompleted = null;
        this.nreCourses = null;
        this.groupeEtude = new GroupeEtudeDto() ;
        this.groupeType = new GroupeTypeDto() ;
        this.groupeEtat = new GroupeEtatDto() ;
        this.parcours = new ParcoursDto() ;
        this.prof = new ProfDto() ;
        this.groupeEtudiantDetails = new Array<GroupeEtudiantDetailDto>();

        }

}
