package ma.zs.alc.bean.core.collab;


import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.util.Objects;

@Entity
@Table(name = "paiement_inscription_collaborator_state")
@JsonInclude(JsonInclude.Include.NON_NULL)
@SequenceGenerator(name = "paiement_inscription_collaborator_state_seq", sequenceName = "paiement_inscription_collaborator_state_seq", allocationSize = 1, initialValue = 1)
public class PaiementInscriptionCollaboratorState extends AuditBusinessObject {


    @Column(length = 500)
    private String code;

    @Column(length = 500)
    private String libelle;


    public PaiementInscriptionCollaboratorState() {
        super();
    }

    public PaiementInscriptionCollaboratorState(Long id) {
        this.id = id;
    }

    public PaiementInscriptionCollaboratorState(Long id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public PaiementInscriptionCollaboratorState(String libelle) {
        this.libelle = libelle;
    }

    public PaiementInscriptionCollaboratorState(String libelle, String code) {
        this.libelle = libelle;
        this.code = code;
    }


    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "paiement_inscription_collaborator_state_seq")
    @Override
    public Long getId() {
        return this.id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
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
        PaiementInscriptionCollaboratorState paiementInscriptionCollaboratorState = (PaiementInscriptionCollaboratorState) o;
        return id != null && id.equals(paiementInscriptionCollaboratorState.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

