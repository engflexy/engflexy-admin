package ma.zs.alc.bean.core.notif;


import java.time.LocalDateTime;


import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;




import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;
import jakarta.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "notification_acteur")
@JsonInclude(JsonInclude.Include.NON_NULL)
//@SequenceGenerator(name="notification_acteur_seq",sequenceName="notification_acteur_seq",allocationSize=1, initialValue = 1)
public class NotificationActeur  extends AuditBusinessObject {




    @Column(length = 500)
    private String icon;

    @Column(length = 500)
    private String title;

    @Column(length = 500)
    private String description;

    private LocalDateTime time ;


    private Boolean read = false;

    @Column(length = 500)
    private String link;

    private Boolean useRouter = false;

    private Boolean communicationEnabled = false;

    private Boolean securityEnabled = false;

    private Boolean lessonReminderEnabled = false;

    private Boolean classroomEnabled = false;

    private Boolean passwordChangedNotificationEnabled = false;

    private Boolean contactNotificationEnabled = false;



    public NotificationActeur(){
        super();
    }

    public NotificationActeur(Long id){
        this.id = id;
    }

    public NotificationActeur(Long id,String title){
        this.id = id;
        this.title = title ;
    }
    public NotificationActeur(String title){
        this.title = title ;
    }




    @Id
    @Column(name = "id")
    @GeneratedValue(strategy =  GenerationType.AUTO)
      @Override
    public Long getId(){
        return this.id;
    }
        @Override
    public void setId(Long id){
        this.id = id;
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
    public LocalDateTime getTime(){
        return this.time;
    }
    public void setTime(LocalDateTime time){
        this.time = time;
    }
    public Boolean getRead() {
        return read;
    }

    public void setRead(Boolean read) {
        read = read;
    }

    public String getLink(){
        return this.link;
    }
    public void setLink(String link){
        this.link = link;
    }
    public Boolean  getUseRouter(){
        return this.useRouter;
    }
    public void setUseRouter(Boolean useRouter){
        this.useRouter = useRouter;
    }
    public Boolean  getCommunicationEnabled(){
        return this.communicationEnabled;
    }
    public void setCommunicationEnabled(Boolean communicationEnabled){
        this.communicationEnabled = communicationEnabled;
    }
    public Boolean  getSecurityEnabled(){
        return this.securityEnabled;
    }
    public void setSecurityEnabled(Boolean securityEnabled){
        this.securityEnabled = securityEnabled;
    }
    public Boolean  getLessonReminderEnabled(){
        return this.lessonReminderEnabled;
    }
    public void setLessonReminderEnabled(Boolean lessonReminderEnabled){
        this.lessonReminderEnabled = lessonReminderEnabled;
    }
    public Boolean  getClassroomEnabled(){
        return this.classroomEnabled;
    }
    public void setClassroomEnabled(Boolean classroomEnabled){
        this.classroomEnabled = classroomEnabled;
    }
    public Boolean  getPasswordChangedNotificationEnabled(){
        return this.passwordChangedNotificationEnabled;
    }
    public void setPasswordChangedNotificationEnabled(Boolean passwordChangedNotificationEnabled){
        this.passwordChangedNotificationEnabled = passwordChangedNotificationEnabled;
    }
    public Boolean  getContactNotificationEnabled(){
        return this.contactNotificationEnabled;
    }
    public void setContactNotificationEnabled(Boolean contactNotificationEnabled){
        this.contactNotificationEnabled = contactNotificationEnabled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        NotificationActeur notificationActeur = (NotificationActeur) o;
        return id != null && id.equals(notificationActeur.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

