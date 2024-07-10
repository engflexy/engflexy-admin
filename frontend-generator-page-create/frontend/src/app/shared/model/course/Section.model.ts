import {BaseDto} from 'src/app/zynerator/dto/BaseDto.model';

import {QuizDto} from '../quiz/Quiz.model';
import {ExerciceDto} from './Exercice.model';

export class SectionDto extends BaseDto{

    public code: string;

    public libelle: string;

    public description: string;

     public quizs: Array<QuizDto>;
     public exercices: Array<ExerciceDto>;


    constructor() {
        super();

        this.code = '';
        this.libelle = '';
        this.description = '';
        this.quizs = new Array<QuizDto>();
        this.exercices = new Array<ExerciceDto>();

        }

}
