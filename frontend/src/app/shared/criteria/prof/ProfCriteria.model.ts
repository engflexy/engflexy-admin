import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {CollaboratorCriteria} from '../vocab/CollaboratorCriteria.model';
import {ParcoursCriteria} from '../course/ParcoursCriteria.model';
import {TypeTeacherCriteria} from './TypeTeacherCriteria.model';
import {RecommendTeacherCriteria} from '../recomrecla/RecommendTeacherCriteria.model';
import {CategorieProfCriteria} from './CategorieProfCriteria.model';
import {TrancheHoraireProfCriteria} from './TrancheHoraireProfCriteria.model';
import {ManageUserDto} from "../../../core/criteria/manage-user-dto";

export class ProfCriteria extends ManageUserDto {

    public ref: string;
    public refLike: string;
    public about: string;
    public aboutLike: string;
    public credentialsNonExpired: null | boolean;
    public enabled: null | boolean;
    public accountNonExpired: null | boolean;
    public accountNonLocked: null | boolean;
    public passwordChanged: null | boolean;
    public username: string;
    public usernameLike: string;
    public password: string;
    public passwordLike: string;
    public trancheHoraireProfs: Array<TrancheHoraireProfCriteria>;
    public recommendTeachers: Array<RecommendTeacherCriteria>;

}
