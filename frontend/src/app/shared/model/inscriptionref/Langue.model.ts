import {BaseDto} from '../../../zynerator/dto/BaseDto.model';


export class LangueDto extends BaseDto{

    public ref: string;

    public libelle: string;



    constructor() {
        super();

        this.ref = '';
        this.libelle = '';

        }

}
