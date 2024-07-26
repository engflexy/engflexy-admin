import {BaseDto} from "../../../dto/BaseDto.model";


export class RoleDto extends BaseDto {

    public authority: string;


    constructor() {
        super();
        this.authority = 'ROLE_ANONYMOUS';
    }

}