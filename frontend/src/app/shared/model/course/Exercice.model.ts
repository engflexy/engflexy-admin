import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {ContentTypeDto} from '../courseref/ContentType.model';
import {SectionDto} from './Section.model';
import {QuizDto} from "../quiz/Quiz.model";
import {QuizEtudiantDto} from "../quizetudiant/QuizEtudiant.model";

export class ExerciceDto extends BaseDto {

    public content: string;

    public description: string;

    public libelle: string;
    public numero: null | number;
    public contentType: ContentTypeDto;
    public section: SectionDto;
    public quiz: QuizDto;
    public quizEtudiant: QuizEtudiantDto;


    constructor() {
        super();

        this.content = '';
        this.description = '';
        this.libelle = '';
        this.numero = null;
        this.quiz = null;
        this.quizEtudiant = null;
        this.contentType = new ContentTypeDto();
    }

}
