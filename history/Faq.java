package ma.zs.alc.bean.history;//package ma.zs.alc.bean.core .faq;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.bean.history.*; //.faq.FaqType;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.util.Objects;




@Entity
@Table(name = "faq")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Faq   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String description;
    @Column(length = 500)
    private String libelle;

    private FaqType faqType ;


    public Faq(){
        super();
    }

    public Faq(Long id){
        this.id = id;
    }

    public Faq(Long id,String libelle){
        this.id = id;
        this.libelle = libelle ;
    }
    public Faq(String libelle){
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
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "faq_type")
    public FaqType getFaqType(){
        return this.faqType;
    }
    public void setFaqType(FaqType faqType){
        this.faqType = faqType;
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
        Faq faq = (Faq) o;
        return id != null && id.equals(faq.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

