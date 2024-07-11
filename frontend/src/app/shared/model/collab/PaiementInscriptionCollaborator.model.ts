
import {PaiementInscriptionCollaboratorStateDto} from './PaiementInscriptionCollaboratorState.model';
import {InscriptionCollaboratorDto} from './InscriptionCollaborator.model';
import {BaseDto} from "../../../zynerator/dto/BaseDto.model";


export class PaiementInscriptionCollaboratorDto extends BaseDto{

    public total: null | number;

    public discount: null | number;

    public remaining: null | number;

   public paiementDate: Date;

    public inscriptionCollaborator: InscriptionCollaboratorDto ;
    public paiementInscriptionCollaboratorState: PaiementInscriptionCollaboratorStateDto ;


    constructor() {
        super();

        this.total = null;
        this.discount = null;
        this.remaining = null;
        this.paiementDate = null;
        this.inscriptionCollaborator = new InscriptionCollaboratorDto() ;

        }

}
