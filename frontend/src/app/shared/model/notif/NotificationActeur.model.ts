import {BaseDto} from "../../../zynerator/dto/BaseDto.model";


export class NotificationActeurDto extends BaseDto {

    public icon: string;

    public title: string;

    public description: string;

    public time: Date;

    public read: null | boolean;

    public link: string;

    public useRouter: null | boolean;

    public communicationEnabled: null | boolean;

    public securityEnabled: null | boolean;

    public lessonReminderEnabled: null | boolean;

    public classroomEnabled: null | boolean;

    public passwordChangedNotificationEnabled: null | boolean;

    public contactNotificationEnabled: null | boolean;


    constructor() {
        super();

        this.icon = '';
        this.title = '';
        this.description = '';
        this.time = null;
        this.read = null;
        this.link = '';
        this.useRouter = null;
        this.communicationEnabled = null;
        this.securityEnabled = null;
        this.lessonReminderEnabled = null;
        this.classroomEnabled = null;
        this.passwordChangedNotificationEnabled = null;
        this.contactNotificationEnabled = null;

    }

}
