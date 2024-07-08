import {BaseDto} from 'src/app/zynerator/dto/BaseDto.model';

import {CollaboratorDto} from '../vocab/Collaborator.model';
import {CoursDto} from './Cours.model';

export class ParcoursDto extends BaseDto{

   public datePublication: Date;

   public dateCreation: Date;

    public description: string;

    public code: string;

    public libelle: string;

    public numeroOrder: null | number;

    public nombreCours: null | number;

    public collaborator: CollaboratorDto ;
     public courss: Array<CoursDto>;


    constructor() {
        super();

        this.datePublication = null;
        this.dateCreation = null;
        this.description = '';
        this.code = '';
        this.libelle = '';
        this.numeroOrder = null;
        this.nombreCours = null;
        this.courss = new Array<CoursDto>();

        }

}
