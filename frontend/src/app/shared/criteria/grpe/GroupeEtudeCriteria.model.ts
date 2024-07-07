import {BaseCriteria} from '../../../zynerator/criteria/BaseCriteria.model';

export class GroupeEtudeCriteria  extends BaseCriteria  {

    public id: number;
    public libelle: string;
    public libelleLike: string;
    public description: string;
    public descriptionLike: string;
     public nombreEtudiant: number;
     public nombreEtudiantMin: number;
     public nombreEtudiantMax: number;


    constructor(id?: number, libelle?: string) {
        super();
        this.id = id;
        this.libelle = libelle;
    }
}
