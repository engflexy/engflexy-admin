import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {HomeWorkQuestionDto} from './HomeWorkQuestion.model';
import {TypeHomeWorkDto} from './TypeHomeWork.model';
import {CoursDto} from '../course/Cours.model';

export class HomeWorkDto extends BaseDto{

    public libelle: string;
    public numero: number;


    public urlImage: string;

    public urlVideo: string;

    public cours: CoursDto ;
    public typeHomeWork: TypeHomeWorkDto ;
     public homeWorkQuestions: Array<HomeWorkQuestionDto>;


    constructor() {
        super();

        this.libelle = '';
        this.urlImage = '';
        this.urlVideo = '';
        this.cours = new CoursDto() ;
        this.typeHomeWork = new TypeHomeWorkDto() ;
        this.homeWorkQuestions = new Array<HomeWorkQuestionDto>();

        }

}
