package ma.zs.alc.dao.criteria.core.notif;



import ma.zs.alc.zynerator.criteria.BaseCriteria;

import java.util.List;
import java.time.LocalDateTime;
import java.time.LocalDate;

public class NotificationActeurCriteria extends BaseCriteria {

    private String icon;
    private String iconLike;
    private String title;
    private String titleLike;
    private String description;
    private String descriptionLike;
    private LocalDateTime time;
    private LocalDateTime timeFrom;
    private LocalDateTime timeTo;
    private Boolean read;
    private String link;
    private String linkLike;
    private Boolean useRouter;
    private Boolean communicationEnabled;
    private Boolean securityEnabled;
    private Boolean lessonReminderEnabled;
    private Boolean classroomEnabled;
    private Boolean passwordChangedNotificationEnabled;
    private Boolean contactNotificationEnabled;



    public String getIcon(){
        return this.icon;
    }
    public void setIcon(String icon){
        this.icon = icon;
    }
    public String getIconLike(){
        return this.iconLike;
    }
    public void setIconLike(String iconLike){
        this.iconLike = iconLike;
    }

    public String getTitle(){
        return this.title;
    }
    public void setTitle(String title){
        this.title = title;
    }
    public String getTitleLike(){
        return this.titleLike;
    }
    public void setTitleLike(String titleLike){
        this.titleLike = titleLike;
    }

    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
    }
    public String getDescriptionLike(){
        return this.descriptionLike;
    }
    public void setDescriptionLike(String descriptionLike){
        this.descriptionLike = descriptionLike;
    }

    public LocalDateTime getTime(){
        return this.time;
    }
    public void setTime(LocalDateTime time){
        this.time = time;
    }
    public LocalDateTime getTimeFrom(){
        return this.timeFrom;
    }
    public void setTimeFrom(LocalDateTime timeFrom){
        this.timeFrom = timeFrom;
    }
    public LocalDateTime getTimeTo(){
        return this.timeTo;
    }
    public void setTimeTo(LocalDateTime timeTo){
        this.timeTo = timeTo;
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
    public String getLinkLike(){
        return this.linkLike;
    }
    public void setLinkLike(String linkLike){
        this.linkLike = linkLike;
    }

    public Boolean getUseRouter(){
        return this.useRouter;
    }
    public void setUseRouter(Boolean useRouter){
        this.useRouter = useRouter;
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
