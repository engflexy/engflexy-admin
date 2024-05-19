import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';
import {SectionCriteria} from './SectionCriteria.model';

export class SectionItemCriteria  extends BaseCriteria  {

    public id: number;
    public imageUrl: string;
    public imageUrlLike: string;
    public response: string;
    public responseLike: string;
    public transcription: string;
    public transcriptionLike: string;
    public translation: string;
    public translationLike: string;
    public explanation: string;
    public explanationLike: string;
    public example: string;
    public exampleLike: string;
    public synonyms: string;
    public synonymsLike: string;

}
