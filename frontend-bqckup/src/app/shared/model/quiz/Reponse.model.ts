import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {QuestionDto} from './Question.model';

export class ReponseDto extends BaseDto {

    public ref: string;

    public lib: string;

    public etatReponse: boolean;

    public numero: null | number;

    public question: QuestionDto;


    constructor() {
        super();

        this.ref = '';
        this.lib = '';
        this.etatReponse = false;
        this.numero = 0;

    }

}