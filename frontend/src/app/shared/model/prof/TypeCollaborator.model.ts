import {BaseDto} from '../../../zynerator/dto/BaseDto.model';


export class TypeCollaboratorDto extends BaseDto{

    public id:number;
    public libelle: string;

    public code: string;



    constructor(id?:number,lib?:string) {
        super();

        this.id=id;
        this.libelle = lib;
        this.code = '';

        }

}
