import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {SectionDto} from '../course/Section.model';

export class VocabularyDto extends BaseDto{

    public ref: string;

    public numero: null | number;

    public word: string;

    public libelle: string;

    public result: string;

    public explication: string;

    public exemple: string;

    public image: string;

    public section: SectionDto ;


    constructor() {
        super();

        this.ref = '';
        this.numero = null;
        this.word = '';
        this.libelle = '';
        this.result = '';
        this.explication = '';
        this.exemple = '';
        this.image = '';
        this.section = new SectionDto() ;

        }

}
