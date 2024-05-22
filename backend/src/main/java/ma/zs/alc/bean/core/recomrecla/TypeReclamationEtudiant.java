package ma.zs.alc.bean.core.recomrecla;

import java.util.Objects;







import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;
import jakarta.persistence.*;
import java.util.Objects;




@Entity
@Table(name = "type_reclamation_etudiant")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class TypeReclamationEtudiant   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String code;
    @Column(length = 500)
    private String libelle;



    public TypeReclamationEtudiant(){
        super();
    }

    public TypeReclamationEtudiant(Long id){
        this.id = id;
    }

    public TypeReclamationEtudiant(Long id,String libelle){
        this.id = id;
        this.libelle = libelle ;
    }
    public TypeReclamationEtudiant(String libelle){
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
        TypeReclamationEtudiant typeReclamationEtudiant = (TypeReclamationEtudiant) o;
        return id != null && id.equals(typeReclamationEtudiant.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}
