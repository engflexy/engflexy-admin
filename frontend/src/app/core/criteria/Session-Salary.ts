import {BaseCriteria} from "../../zynerator/criteria/BaseCriteria.model";

export class SessionSalary extends BaseCriteria {
    public id: number;
    public group: string;
    public prof: string;
    public course: string;
    public courseFinished: boolean;
    public date: Date;
    public price: number;
}
