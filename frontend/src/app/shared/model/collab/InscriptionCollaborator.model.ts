import {InscriptionCollaboratorStateDto} from './InscriptionCollaboratorState.model';
import {PackageCollaboratorDto} from './PackageCollaborator.model';
import {BaseDto} from "../../../zynerator/dto/BaseDto.model";
import {CollaboratorDto} from "../vocab/Collaborator.model";


export class InscriptionCollaboratorDto extends BaseDto {

    public price: null | number;

    public nbrStudent: null | number;

    public logo: null | boolean;

    public color: null | boolean;

    public bannerAd: null | boolean;

    public startDate: Date;

    public endDate: Date;

    public packageCollaborator: PackageCollaboratorDto;
    public collaborator: CollaboratorDto;
    public inscriptionCollaboratorState: InscriptionCollaboratorStateDto;


    constructor() {
        super();

        this.price = null;
        this.nbrStudent = null;
        this.logo = null;
        this.color = null;
        this.bannerAd = null;
        this.startDate = null;
        this.endDate = null;
        this.inscriptionCollaboratorState=new InscriptionCollaboratorStateDto();
        this.packageCollaborator = new PackageCollaboratorDto();

    }

}
