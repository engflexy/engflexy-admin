import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {ParcoursCriteria} from '../course/ParcoursCriteria.model';
import {TypeCollaboratorCriteria} from '../prof/TypeCollaboratorCriteria.model';

export class CollaboratorCriteria  extends BaseCriteria  {

    public libelle: string;
    public libelleLike: string;
    public description: string;
    public descriptionLike: string;
    public credentialsNonExpired: null | boolean;
    public enabled: null | boolean;
    public accountNonExpired: null | boolean;
    public accountNonLocked: null | boolean;
    public passwordChanged: null | boolean;
    public username: string;
    public usernameLike: string;
    public password: string;
    public passwordLike: string;
  public typeCollaborator: TypeCollaboratorCriteria ;
  public typeCollaborators: Array<TypeCollaboratorCriteria> ;
      public parcourss: Array<ParcoursCriteria>;

}
