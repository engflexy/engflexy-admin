import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {QuizDto} from '../quiz/Quiz.model';
import {ExerciceDto} from './Exercice.model';
import {CoursDto} from './Cours.model';

export class SectionDto extends BaseDto{

    public code: string;

    public libelle: string;

    public description: string;

    public cours: CoursDto ;
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
