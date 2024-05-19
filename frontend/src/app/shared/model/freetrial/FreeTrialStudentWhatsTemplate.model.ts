import {BaseDto} from '../../../zynerator/dto/BaseDto.model';


export class FreeTrialStudentWhatsTemplateDto extends BaseDto{

    public object: string;

    public corps: string;

    public source: string;



    constructor() {
        super();

        this.object = '';
        this.corps = '';
        this.source = '';

        }

}
