import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';

export class SkillCriteria  extends BaseCriteria  {

    public id: number;
    public code: string;
    public codeLike: string;
    public libelle: string;
    public libelleLike: string;

}
