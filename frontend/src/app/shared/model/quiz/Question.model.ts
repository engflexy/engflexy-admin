import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {QuizDto} from './Quiz.model';
import {TypeDeQuestionDto} from '../quizref/TypeDeQuestion.model';
import {ReponseDto} from './Reponse.model';

export class QuestionDto extends BaseDto {

    public ref: string;

    public libelle: string;

    public urlImg: string;

    public urlVideo: string;

    public numero: null | number;

    public pointReponseJuste: null | number;

    public pointReponsefausse: null | number;

    public typeDeQuestion: TypeDeQuestionDto;
    public quiz: QuizDto;
    public reponses: Array<ReponseDto>;


    constructor() {
        super();

        this.ref = '';
        this.libelle = '';
        this.urlImg = '';
        this.urlVideo = '';
        this.numero = 1;
        this.pointReponseJuste = 1;
        this.pointReponsefausse = 0;
        this.quiz = new QuizDto();
        this.reponses = new Array<ReponseDto>();
    }

}
