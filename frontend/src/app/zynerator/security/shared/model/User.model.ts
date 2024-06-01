import {BaseDto} from "../../../dto/BaseDto.model";
import {RoleUserDto} from './RoleUser.model';
import {ModelPermissionUserDto} from './ModelPermissionUser.model';

export class UserDto extends BaseDto {

    public credentialsNonExpired: null | boolean;

    public enabled: null | boolean;
    public email: string;
    public accountNonExpired: null | boolean;
    public fullName: string;
    public phone: string;
    public avatar: string;
    public accountNonLocked: null | boolean;

    public username: string;

    public password: string;

    public passwordChanged: null | boolean;

    public modelPermissionUsers: Array<ModelPermissionUserDto>;
    public roleUsers: Array<RoleUserDto>;
    public createdAt: Date;
    public updatedAt: Date;

    public newPassword: string;
    public confirmPassword: string;


    constructor() {
        super();

        this.credentialsNonExpired = true;
        this.enabled = true;
        this.email = '';
        this.accountNonExpired = true;
        this.accountNonLocked = true;
        this.username = '';
        this.password = null;
        this.passwordChanged = false;
        this.modelPermissionUsers = new Array<ModelPermissionUserDto>();
        this.roleUsers = new Array<RoleUserDto>();

    }

}
