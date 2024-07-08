import {BaseDto} from 'src/app/zynerator/dto/BaseDto.model';

import {TypeReclamationProfDto} from './TypeReclamationProf.model';
import {ProfDto} from '../prof/Prof.model';

export class ReclamationProfDto extends BaseDto{

    public reference: string;

   public dateReclamation: Date;

    public message: string;

   public traite: null | boolean;

   public dateTraitement: Date;

   public dateReponse: Date;

   public postView: null | boolean;

    public commentaireTraiteur: string;

    public objetReclamationProf: string;

    public prof: ProfDto ;
    public typeReclamationProf: TypeReclamationProfDto ;


    constructor() {
        super();

        this.reference = '';
        this.dateReclamation = null;
        this.message = '';
        this.traite = null;
        this.dateTraitement = null;
        this.dateReponse = null;
        this.postView = null;
        this.commentaireTraiteur = '';
        this.objetReclamationProf = '';
        this.prof = new ProfDto() ;

        }

}
