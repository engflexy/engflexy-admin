import {BaseCriteria} from "../../zynerator/criteria/BaseCriteria.model";

export class ManageUserDto extends BaseCriteria{
    public id: number
    public email: string
    public username: string
    public avatar: string
    public fullName: string
    public phone: string
    public enabled: boolean
}
