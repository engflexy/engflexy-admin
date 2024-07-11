import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {FaqTypeDto} from './FaqType.model';
import {ProfDto} from '../prof/Prof.model';

export class FaqProfDto extends BaseDto{

    public description: string;

    public libelle: string;

    public prof: ProfDto ;
    public faqType: FaqTypeDto ;


    constructor() {
        super();

        this.description = '';
        this.libelle = '';
        this.prof = new ProfDto() ;
        this.faqType = new FaqTypeDto() ;

        }

}
