import {BaseDto} from '../../../zynerator/dto/BaseDto.model';
import {ExerciceDto} from './Exercice.model';
import {CoursDto} from './Cours.model';

export class SectionDto extends BaseDto {

    public code: string;

    public libelle: string;

    public description: string;
    public numero: number;

    public cours: CoursDto;
    public exercices: Array<ExerciceDto>;


    constructor() {
        super();

        this.code = '';
        this.libelle = '';
        this.description = '';
        this.exercices = new Array<ExerciceDto>();

    }

}
