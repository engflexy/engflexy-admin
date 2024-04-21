package  ma.zs.zyn.ws.dto.learning;

import ma.zs.zyn.zynerator.audit.Log;
import ma.zs.zyn.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;



import ma.zs.zyn.ws.dto.course.SectionDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class SessionCoursSectionDto  extends AuditBaseDto {


    private SessionCoursDto sessionCours ;
    private SectionDto section ;



    public SessionCoursSectionDto(){
        super();
    }




    public SessionCoursDto getSessionCours(){
        return this.sessionCours;
    }

    public void setSessionCours(SessionCoursDto sessionCours){
        this.sessionCours = sessionCours;
    }
    public SectionDto getSection(){
        return this.section;
    }

    public void setSection(SectionDto section){
        this.section = section;
    }






}
