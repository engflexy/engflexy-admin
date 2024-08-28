package ma.zs.alc.bean.core.courseref;

import java.util.Objects;







import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;
import jakarta.persistence.*;
import java.util.Objects;




@Entity
@Table(name = "content_type")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class ContentType   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String code;
    @Column(length = 500)
    private String libelle;


    public ContentType(){
        super();
    }

    public ContentType(Long id){
        this.id = id;
    }

    public ContentType(Long id,String libelle){
        this.id = id;
        this.libelle = libelle ;
    }
    public ContentType(String libelle){
        this.libelle = libelle ;
        this.code = libelle;
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
    public String getCode(){
        return this.code;
    }
    public void setCode(String code){
        this.code = code;
    }
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }

    @Transient
    public String getLabel() {
        label = libelle;
        return label;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ContentType contentType = (ContentType) o;
        return id != null && id.equals(contentType.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

