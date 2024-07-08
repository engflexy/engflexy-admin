import {BaseDto} from 'src/app/zynerator/dto/BaseDto.model';

import {CollaboratorDto} from '../vocab/Collaborator.model';

export class ContactDto extends BaseDto{

    public name: string;

    public email: string;

    public phone: string;

    public setFrom: string;

   public dateContact: Date;

   public replied: null | boolean;

    public message: string;

    public collaborator: CollaboratorDto ;


    constructor() {
        super();

        this.name = '';
        this.email = '';
        this.phone = '';
        this.setFrom = '';
        this.dateContact = null;
        this.replied = null;
        this.message = '';
        this.collaborator = new CollaboratorDto() ;

        }

}
