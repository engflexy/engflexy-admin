import {BaseDto} from '../../../zynerator/dto/BaseDto.model';
import {FaqDto} from "./Faq.model";


export class FaqTypeDto extends BaseDto{

    public destinataire: string;

    public libelle: string;


    public faqs: FaqDto[];



    constructor() {
        super();

        this.destinataire = '';
        this.libelle = '';
        this.faqs = [];

        }

}
