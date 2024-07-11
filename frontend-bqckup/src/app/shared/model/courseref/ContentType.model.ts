import {BaseDto} from '../../../zynerator/dto/BaseDto.model';


export class ContentTypeDto extends BaseDto {

    public code: string;

    public libelle: string;


    constructor(code?: string, lib?: string,) {
        super();
        this.code = code ? code : '';
        this.libelle = lib ? lib : '';

    }

}
