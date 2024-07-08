import {BaseDto} from '../../../zynerator/dto/BaseDto.model';


export class GroupeTypeDto extends BaseDto {

    public code: string;

    public libelle: string;


    constructor(libelle?: string) {
        super();

        this.code = '';
        this.libelle = libelle ? libelle : '';

    }

}
