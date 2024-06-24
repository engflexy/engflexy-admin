package ma.zs.alc.bean.history;//package ma.zs.alc.bean.core .inscriptionref;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.util.List;
import java.util.Objects;




@Entity
@Table(name = "niveau_etude")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class NiveauEtude   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String libelle;
    @Column(length = 500)
    private String code;
    @OneToMany
    private List<Etudiant> etudiants;
    @OneToMany
    private List<Inscription> inscriptions;

    public NiveauEtude(){
        super();
    }

    public NiveauEtude(Long id){
        this.id = id;
    }

    public NiveauEtude(Long id,String libelle){
        this.id = id;
        this.libelle = libelle ;
    }
    public NiveauEtude(String libelle){
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
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }
    public String getCode(){
        return this.code;
    }
    public void setCode(String code){
        this.code = code;
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
        NiveauEtude niveauEtude = (NiveauEtude) o;
        return id != null && id.equals(niveauEtude.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

