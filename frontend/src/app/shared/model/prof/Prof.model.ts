import {CollaboratorDto} from '../vocab/Collaborator.model';
import {ParcoursDto} from '../course/Parcours.model';
import {TypeTeacherDto} from './TypeTeacher.model';
import {RecommendTeacherDto} from '../recomrecla/RecommendTeacher.model';
import {CategorieProfDto} from './CategorieProf.model';
import {TrancheHoraireProfDto} from './TrancheHoraireProf.model';
import {UserDto} from "../../../zynerator/security/shared/model/User.model";

export class ProfDto extends UserDto {

    public ref: string;

    public parcours: ParcoursDto;
    public categorieProf: CategorieProfDto;
    public typeTeacher: TypeTeacherDto;
    public collaborator: CollaboratorDto;
    public trancheHoraireProfs: Array<TrancheHoraireProfDto>;
    public recommendTeachers: Array<RecommendTeacherDto>;


    constructor(id?: number, fullName?: string) {
        super(id);

        this.ref = '';
        this.about = '';
        this.credentialsNonExpired = null;
        this.enabled = null;
        this.accountNonExpired = null;
        this.accountNonLocked = null;
        this.passwordChanged = null;
        this.username = '';
        this.fullName = fullName ? fullName : '';
        this.password = '';
        this.trancheHoraireProfs = new Array<TrancheHoraireProfDto>();
        this.recommendTeachers = new Array<RecommendTeacherDto>();

    }

}
