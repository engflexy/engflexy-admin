import {BaseDto} from '../../../zynerator/dto/BaseDto.model';


export class ContentTypeDto extends BaseDto{

    public code: string;

    public libelle: string;



    constructor() {
        super();

        this.code = '';
        this.libelle = '';

        }

}