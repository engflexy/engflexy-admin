package ma.zs.alc.bean.core.course;

import java.util.Objects;





import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.bean.core.course.Section;


import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;
import jakarta.persistence.*;
import java.util.Objects;




@Entity
@Table(name = "exercice")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Exercice   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String content;
    @Column(length = 500)
    private String description;
    @Column(length = 500)
    private String libelle;
    private Long numero ;

    private ContentType contentType ;
    private Section section ;


    public Exercice(){
        super();
    }

    public Exercice(Long id){
        this.id = id;
    }

    public Exercice(Long id,String libelle){
        this.id = id;
        this.libelle = libelle ;
    }
    public Exercice(String libelle){
        this.libelle = libelle ;
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
    public String getContent(){
        return this.content;
    }
    public void setContent(String content){
        this.content = content;
    }
    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
    }
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }
    public Long getNumero(){
        return this.numero;
    }
    public void setNumero(Long numero){
        this.numero = numero;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "content_type")
    public ContentType getContentType(){
        return this.contentType;
    }
    public void setContentType(ContentType contentType){
        this.contentType = contentType;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "section")
    public Section getSection(){
        return this.section;
    }
    public void setSection(Section section){
        this.section = section;
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
        Exercice exercice = (Exercice) o;
        return id != null && id.equals(exercice.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

