package ma.zs.zyn.bean.core.inscriptionref;

import java.util.Objects;







import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.zyn.zynerator.audit.AuditBusinessObject;
import jakarta.persistence.*;
import java.util.Objects;




@Entity
@Table(name = "etat_etudiant_schedule")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class EtatEtudiantSchedule   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String code;
    @Column(length = 500)
    private String libelle;



    public EtatEtudiantSchedule(){
        super();
    }

    public EtatEtudiantSchedule(Long id){
        this.id = id;
    }

    public EtatEtudiantSchedule(Long id,String libelle){
        this.id = id;
        this.libelle = libelle ;
    }
    public EtatEtudiantSchedule(String libelle){
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
        EtatEtudiantSchedule etatEtudiantSchedule = (EtatEtudiantSchedule) o;
        return id != null && id.equals(etatEtudiantSchedule.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

