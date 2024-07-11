import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {FaqTypeDto} from './FaqType.model';

export class FaqDto extends BaseDto{

    public answer: string;

    public question: string;

    public faqType: FaqTypeDto ;


    constructor() {
        super();

        this.answer = '';
        this.question = '';
        this.faqType = new FaqTypeDto() ;

        }

}
