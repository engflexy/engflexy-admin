package ma.zs.zyn.bean.core.freetrial;

import java.util.Objects;







import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.zyn.zynerator.audit.AuditBusinessObject;
import jakarta.persistence.*;
import java.util.Objects;




@Entity
@Table(name = "free_trial_student_whats_template")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class FreeTrialStudentWhatsTemplate   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String object;
    @Column(length = 500)
    private String corps;
    @Column(length = 500)
    private String source;



    public FreeTrialStudentWhatsTemplate(){
        super();
    }

    public FreeTrialStudentWhatsTemplate(Long id){
        this.id = id;
    }





    @Id
    @Column(name = "id")
    @GeneratedValue(strategy =  GenerationType.AUTO)
    public Long getId(){
        return this.id;
    }
    public void setId(Long id){
        this.id = id;
    }
    public String getObject(){
        return this.object;
    }
    public void setObject(String object){
        this.object = object;
    }
    public String getCorps(){
        return this.corps;
    }
    public void setCorps(String corps){
        this.corps = corps;
    }
    public String getSource(){
        return this.source;
    }
    public void setSource(String source){
        this.source = source;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FreeTrialStudentWhatsTemplate freeTrialStudentWhatsTemplate = (FreeTrialStudentWhatsTemplate) o;
        return id != null && id.equals(freeTrialStudentWhatsTemplate.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

