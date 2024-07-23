import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';

export class TypeCollaboratorCriteria  extends BaseCriteria  {

    public id: number;
    public libelle: string;
    public libelleLike: string;
    public code: string;
    public codeLike: string;
    constructor(id?:number,lib?:string) {
        super();
        this.id = id;
        this.libelle = lib;
        this.code = '';

    }

}
