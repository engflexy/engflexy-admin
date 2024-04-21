import {BaseCriteria} from 'src/app/zynerator/criteria/BaseCriteria.model';
import {EtudiantCriteria} from './EtudiantCriteria.model';

export class DictionaryCriteria  extends BaseCriteria  {

    public id: number;
    public word: string;
    public wordLike: string;
    public definition: string;
    public definitionLike: string;
    public learned: null | boolean;
    public createdOn: Date;
    public createdOnFrom: Date;
    public createdOnTo: Date;

}
