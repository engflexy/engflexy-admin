package ma.zs.alc.bean.core.collab;


import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.util.Objects;

@Entity
@Table(name = "inscription_collaborator_state")
@JsonInclude(JsonInclude.Include.NON_NULL)
@SequenceGenerator(name="inscription_collaborator_state_seq",sequenceName="inscription_collaborator_state_seq",allocationSize=1, initialValue = 1)
public class InscriptionCollaboratorState  extends AuditBusinessObject {




    @Column(length = 500)
    private String code;

    @Column(length = 500)
    private String libelle;



    public InscriptionCollaboratorState(){
        super();
    }

    public InscriptionCollaboratorState(Long id){
        this.id = id;
    }

    public InscriptionCollaboratorState(Long id,String libelle){
        this.id = id;
        this.libelle = libelle ;
    }
    public InscriptionCollaboratorState(String libelle){
        this.libelle = libelle ;
    }
    public InscriptionCollaboratorState(String libelle,String code){
        this.libelle=libelle;
        this.code=code;
    }




    @Id
    @Column(name = "id")
    @GeneratedValue(strategy =  GenerationType.SEQUENCE,generator="inscription_collaborator_state_seq")
      @Override
    public Long getId(){
        return this.id;
    }
        @Override
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
        InscriptionCollaboratorState inscriptionCollaboratorState = (InscriptionCollaboratorState) o;
        return id != null && id.equals(inscriptionCollaboratorState.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

