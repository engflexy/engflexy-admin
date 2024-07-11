import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {CollaboratorDto} from '../vocab/Collaborator.model';

export class NewsDto extends BaseDto{

    public ref: string;

    public libelle: string;

    public image: string;

    public description: string;

   public dateNews: Date;

   public dateDebut: Date;

   public dateFin: Date;

    public numeroOrdre: null | number;

    public destinataire: string;

    public collaborator: CollaboratorDto ;


    constructor() {
        super();

        this.ref = '';
        this.libelle = '';
        this.image = '';
        this.description = '';
        this.dateNews = null;
        this.dateDebut = null;
        this.dateFin = null;
        this.numeroOrdre = null;
        this.destinataire = '';

        }

}
