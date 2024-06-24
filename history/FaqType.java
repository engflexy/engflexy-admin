package ma.zs.alc.bean.history;//package ma.zs.alc.bean.core .faq;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.util.List;
import java.util.Objects;




@Entity
@Table(name = "faq_type")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class FaqType   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String destinataire;
    @Column(length = 500)
    private String libelle;
    @OneToMany
    private List<Faq> faqs;
    public FaqType(){
        super();
    }

    public FaqType(Long id){
        this.id = id;
    }

    public FaqType(Long id,String libelle){
        this.id = id;
        this.libelle = libelle ;
    }
    public FaqType(String libelle){
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
    public String getDestinataire(){
        return this.destinataire;
    }
    public void setDestinataire(String destinataire){
        this.destinataire = destinataire;
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
        FaqType faqType = (FaqType) o;
        return id != null && id.equals(faqType.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

