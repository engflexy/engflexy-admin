import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {EtudiantDto} from './Etudiant.model';

export class DictionaryDto extends BaseDto{

    public word: string;

    public definition: string;

   public learned: null | boolean;

    public createdOn: string;

    public etudiant: EtudiantDto ;


    constructor() {
        super();

        this.word = '';
        this.definition = '';
        this.learned = null;
        this.createdOn = '';
        this.etudiant = new EtudiantDto() ;

        }

}
