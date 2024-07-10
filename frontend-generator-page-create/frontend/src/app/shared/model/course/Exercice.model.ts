import {BaseDto} from 'src/app/zynerator/dto/BaseDto.model';

import {ContentTypeDto} from '../courseref/ContentType.model';
import {SectionDto} from './Section.model';

export class ExerciceDto extends BaseDto{

    public content: string;

    public description: string;

    public libelle: string;

    public numeroOrder: null | number;

    public contentType: ContentTypeDto ;
    public section: SectionDto ;


    constructor() {
        super();

        this.content = '';
        this.description = '';
        this.libelle = '';
        this.numeroOrder = null;
        this.contentType = new ContentTypeDto() ;

        }

}
