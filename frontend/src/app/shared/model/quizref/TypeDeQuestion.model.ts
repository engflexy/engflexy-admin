import {BaseDto} from '../../../zynerator/dto/BaseDto.model';


export class TypeDeQuestionDto extends BaseDto{

    public ref: string;

    public lib: string;



    constructor() {
        super();

        this.ref = '';
        this.lib = '';

        }

}
