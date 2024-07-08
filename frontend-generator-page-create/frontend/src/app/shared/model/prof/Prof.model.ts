import {BaseDto} from 'src/app/zynerator/dto/BaseDto.model';

import {CollaboratorDto} from '../vocab/Collaborator.model';
import {ParcoursDto} from '../course/Parcours.model';
import {TypeTeacherDto} from './TypeTeacher.model';
import {RecommendTeacherDto} from '../recomrecla/RecommendTeacher.model';
import {CategorieProfDto} from './CategorieProf.model';
import {TrancheHoraireProfDto} from './TrancheHoraireProf.model';

export class ProfDto extends BaseDto{

    public ref: string;

    public about: string;

   public credentialsNonExpired: null | boolean;

   public enabled: null | boolean;

   public accountNonExpired: null | boolean;

   public accountNonLocked: null | boolean;

   public passwordChanged: null | boolean;

    public username: string;

    public password: string;

    public parcours: ParcoursDto ;
    public categorieProf: CategorieProfDto ;
    public typeTeacher: TypeTeacherDto ;
    public collaborator: CollaboratorDto ;
     public trancheHoraireProfs: Array<TrancheHoraireProfDto>;
     public recommendTeachers: Array<RecommendTeacherDto>;


    constructor() {
        super();

        this.ref = '';
        this.about = '';
        this.credentialsNonExpired = null;
        this.enabled = null;
        this.accountNonExpired = null;
        this.accountNonLocked = null;
        this.passwordChanged = null;
        this.username = '';
        this.password = '';
        this.trancheHoraireProfs = new Array<TrancheHoraireProfDto>();
        this.recommendTeachers = new Array<RecommendTeacherDto>();

        }

}
