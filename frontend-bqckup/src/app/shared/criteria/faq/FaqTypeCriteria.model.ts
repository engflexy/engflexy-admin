import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';

export class FaqTypeCriteria  extends BaseCriteria  {

    public id: number;
    public destinataire: string;
    public destinataireLike: string;
    public libelle: string;
    public libelleLike: string;

}
