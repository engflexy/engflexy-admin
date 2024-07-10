import {BaseCriteria} from "../../zynerator/criteria/BaseCriteria.model";

export class UserCriteria extends BaseCriteria{
    public id: number
    public email: string
    public avatar: string
    public fullName: string
    public phone: string
    public enabled: boolean
}
