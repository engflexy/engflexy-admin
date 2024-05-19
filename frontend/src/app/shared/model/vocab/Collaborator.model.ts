import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {ParcoursDto} from '../course/Parcours.model';
import {TypeCollaboratorDto} from '../prof/TypeCollaborator.model';

export class CollaboratorDto extends BaseDto{

    public libelle: string;

    public description: string;

   public credentialsNonExpired: null | boolean;

   public enabled: null | boolean;

   public accountNonExpired: null | boolean;

   public accountNonLocked: null | boolean;

   public passwordChanged: null | boolean;

    public username: string;

    public password: string;

    public typeCollaborator: TypeCollaboratorDto ;
     public parcourss: Array<ParcoursDto>;


    constructor() {
        super();

        this.libelle = '';
        this.description = '';
        this.credentialsNonExpired = null;
        this.enabled = null;
        this.accountNonExpired = null;
        this.accountNonLocked = null;
        this.passwordChanged = null;
        this.username = '';
        this.password = '';
        this.typeCollaborator = new TypeCollaboratorDto() ;
        this.parcourss = new Array<ParcoursDto>();

        }

}
