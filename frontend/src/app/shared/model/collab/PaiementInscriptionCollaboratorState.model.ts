import {BaseDto} from "../../../zynerator/dto/BaseDto.model";

export class PaiementInscriptionCollaboratorStateDto extends BaseDto {

    public code: string;

    public libelle: string;


    constructor() {
        super();

        this.code = '';
        this.libelle = '';

    }

}