package ma.zs.alc.ws.dto.notif;


import com.fasterxml.jackson.annotation.JsonInclude;


import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonFormat;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import ma.zs.alc.zynerator.security.ws.dto.UserDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class NotificationActeurDto  extends AuditBaseDto {

    private String icon  ;
    private String title  ;
    private String description  ;
    private String time ;
    private Boolean read  ;
    private String link  ;
    private Boolean useRouter  ;
    private Boolean communicationEnabled  ;
    private Boolean securityEnabled  ;
    private Boolean lessonReminderEnabled  ;
    private Boolean classroomEnabled  ;
    private Boolean passwordChangedNotificationEnabled  ;
    private Boolean contactNotificationEnabled  ;


    private UserDto user;

    public NotificationActeurDto(){
        super();
    }




    public String getIcon(){
        return this.icon;
    }
    public void setIcon(String icon){
        this.icon = icon;
    }


    public String getTitle(){
        return this.title;
    }
    public void setTitle(String title){
        this.title = title;
    }


    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
    }


    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getTime(){
        return this.time;
    }
    public void setTime(String time){
        this.time = time;
    }


    public Boolean getRead(){
        return this.read;
    }
    public void setRead(Boolean read){
        this.read = read;
    }


    public String getLink(){
        return this.link;
    }
    public void setLink(String link){
        this.link = link;
    }


    public Boolean getUseRouter(){
        return this.useRouter;
    }
    public void setUseRouter(Boolean useRouter){
        this.useRouter = useRouter;
    }
    public UserDto getUser() {
        return this.user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    public Boolean getCommunicationEnabled(){
        return this.communicationEnabled;
    }
    public void setCommunicationEnabled(Boolean communicationEnabled){
        this.communicationEnabled = communicationEnabled;
    }


    public Boolean getSecurityEnabled(){
        return this.securityEnabled;
    }
    public void setSecurityEnabled(Boolean securityEnabled){
        this.securityEnabled = securityEnabled;
    }


    public Boolean getLessonReminderEnabled(){
        return this.lessonReminderEnabled;
    }
    public void setLessonReminderEnabled(Boolean lessonReminderEnabled){
        this.lessonReminderEnabled = lessonReminderEnabled;
    }


    public Boolean getClassroomEnabled(){
        return this.classroomEnabled;
    }
    public void setClassroomEnabled(Boolean classroomEnabled){
        this.classroomEnabled = classroomEnabled;
    }


    public Boolean getPasswordChangedNotificationEnabled(){
        return this.passwordChangedNotificationEnabled;
    }
    public void setPasswordChangedNotificationEnabled(Boolean passwordChangedNotificationEnabled){
        this.passwordChangedNotificationEnabled = passwordChangedNotificationEnabled;
    }


    public Boolean getContactNotificationEnabled(){
        return this.contactNotificationEnabled;
    }
    public void setContactNotificationEnabled(Boolean contactNotificationEnabled){
        this.contactNotificationEnabled = contactNotificationEnabled;
    }








}
