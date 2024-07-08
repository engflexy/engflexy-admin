import {BaseDto} from '../../../zynerator/dto/BaseDto.model';


export class TypeHomeWorkDto extends BaseDto{

    public code: string;

    public lib: string;



    constructor() {
        super();

        this.code = '';
        this.lib = '';

        }

}
