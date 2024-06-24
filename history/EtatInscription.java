package ma.zs.alc.bean.history;//package ma.zs.alc.bean.core .inscriptionref;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.util.List;
import java.util.Objects;


@Entity
@Table(name = "etat_inscription")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class EtatInscription extends AuditBusinessObject {

    private Long id;

    @Column(length = 500)
    private String ref;
    @Column(length = 500)
    private String libelle;
    @OneToMany
    private List<Inscription> inscriptions;


    public EtatInscription() {
        super();
    }

    public EtatInscription(Long id) {
        this.id = id;
    }

    public EtatInscription(Long id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public EtatInscription(String ref) {
        this.ref = ref;
    }


    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRef() {
        return this.ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public String getLibelle() {
        return this.libelle;
    }

    public void setLibelle(String libelle) {
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
        EtatInscription etatInscription = (EtatInscription) o;
        return id != null && id.equals(etatInscription.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}
