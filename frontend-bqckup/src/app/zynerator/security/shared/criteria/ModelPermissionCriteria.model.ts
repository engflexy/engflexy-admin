import {BaseCriteria} from "../../../criteria/BaseCriteria.model";

export class ModelPermissionCriteria  extends BaseCriteria  {

    public id: number;
    public reference: string;
    public referenceLike: string;
    public libelle: string;
    public libelleLike: string;

}
