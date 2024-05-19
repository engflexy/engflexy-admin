import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {QuestionDto} from './Question.model';
import {SectionDto} from '../course/Section.model';

export class QuizDto extends BaseDto{

    public ref: string;

    public lib: string;

   public dateDebut: Date;

   public dateFin: Date;

    public numero: null | number;

    public seuilReussite: null | number;

    public section: SectionDto ;
     public questions: Array<QuestionDto>;


    constructor() {
        super();

        this.ref = '';
        this.lib = '';
        this.dateDebut = null;
        this.dateFin = null;
        this.numero = null;
        this.seuilReussite = null;
        this.questions = new Array<QuestionDto>();

        }

}
