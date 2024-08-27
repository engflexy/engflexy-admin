import {BaseCriteria} from "../../../zynerator/criteria/BaseCriteria.model";


export class NotificationActeurCriteria extends BaseCriteria {

    public id: number;
    public icon: string;
    public iconLike: string;
    public title: string;
    public titleLike: string;
    public description: string;
    public descriptionLike: string;
    public time: Date;
    public timeFrom: Date;
    public timeTo: Date;
    public read: null | boolean;
    public link: string;
    public linkLike: string;
    public useRouter: null | boolean;
    public communicationEnabled: null | boolean;
    public securityEnabled: null | boolean;
    public lessonReminderEnabled: null | boolean;
    public classroomEnabled: null | boolean;
    public passwordChangedNotificationEnabled: null | boolean;
    public contactNotificationEnabled: null | boolean;

}
