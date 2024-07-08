import {ParcoursDto} from '../course/Parcours.model';
import {TypeCollaboratorDto} from '../prof/TypeCollaborator.model';
import {UserDto} from "../../../zynerator/security/shared/model/User.model";

export class CollaboratorDto extends UserDto {

    public libelle: string;
    public description: string;
    public typeCollaborator: TypeCollaboratorDto;
    public parcourss: Array<ParcoursDto>;


    constructor(id?:number) {
        super(id);
        this.libelle = '';
        this.description = '';
        this.typeCollaborator = new TypeCollaboratorDto();
        this.parcourss = new Array<ParcoursDto>();

    }

}
