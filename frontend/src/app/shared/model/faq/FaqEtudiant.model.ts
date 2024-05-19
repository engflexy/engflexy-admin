import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {FaqTypeDto} from './FaqType.model';
import {EtudiantDto} from '../inscription/Etudiant.model';

export class FaqEtudiantDto extends BaseDto{

    public description: string;

    public libelle: string;

    public etudiant: EtudiantDto ;
    public faqType: FaqTypeDto ;


    constructor() {
        super();

        this.description = '';
        this.libelle = '';
        this.etudiant = new EtudiantDto() ;

        }

}
