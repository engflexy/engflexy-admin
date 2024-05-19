import {BaseDto} from '../../../zynerator/dto/BaseDto.model';


export class TypeCollaboratorDto extends BaseDto{

    public libelle: string;

    public code: string;



    constructor() {
        super();

        this.libelle = '';
        this.code = '';

        }

}
