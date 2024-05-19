import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {CollaboratorDto} from '../vocab/Collaborator.model';

export class ClassAverageBonusDto extends BaseDto{

    public code: string;

    public nombreSession: null | number;

    public prix: null | number;

    public collaborator: CollaboratorDto ;


    constructor() {
        super();

        this.code = '';
        this.nombreSession = null;
        this.prix = null;

        }

}
