package ma.zs.alc.bean.core.collab;


import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table(name = "paiement_inscription_collaborator")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class PaiementInscriptionCollaborator  extends AuditBusinessObject {




    private BigDecimal total = BigDecimal.ZERO;

    private BigDecimal discount = BigDecimal.ZERO;

    private BigDecimal remaining = BigDecimal.ZERO;

    private LocalDateTime paiementDate ;

    private InscriptionCollaborator inscriptionCollaborator ;
    private PaiementInscriptionCollaboratorState paiementInscriptionCollaboratorState ;


    public PaiementInscriptionCollaborator(){
        super();
    }

    public PaiementInscriptionCollaborator(Long id){
        this.id = id;
    }





    @Id
    @Column(name = "id")
    @GeneratedValue(strategy =  GenerationType.AUTO)
      @Override
    public Long getId(){
        return this.id;
    }
        @Override
    public void setId(Long id){
        this.id = id;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inscription_collaborator")
    public InscriptionCollaborator getInscriptionCollaborator(){
        return this.inscriptionCollaborator;
    }
    public void setInscriptionCollaborator(InscriptionCollaborator inscriptionCollaborator){
        this.inscriptionCollaborator = inscriptionCollaborator;
    }
    public BigDecimal getTotal(){
        return this.total;
    }
    public void setTotal(BigDecimal total){
        this.total = total;
    }
    public BigDecimal getDiscount(){
        return this.discount;
    }
    public void setDiscount(BigDecimal discount){
        this.discount = discount;
    }
    public BigDecimal getRemaining(){
        return this.remaining;
    }
    public void setRemaining(BigDecimal remaining){
        this.remaining = remaining;
    }
    public LocalDateTime getPaiementDate(){
        return this.paiementDate;
    }
    public void setPaiementDate(LocalDateTime paiementDate){
        this.paiementDate = paiementDate;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "paiement_inscription_collaborator_state")
    public PaiementInscriptionCollaboratorState getPaiementInscriptionCollaboratorState(){
        return this.paiementInscriptionCollaboratorState;
    }
    public void setPaiementInscriptionCollaboratorState(PaiementInscriptionCollaboratorState paiementInscriptionCollaboratorState){
        this.paiementInscriptionCollaboratorState = paiementInscriptionCollaboratorState;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PaiementInscriptionCollaborator paiementInscriptionCollaborator = (PaiementInscriptionCollaborator) o;
        return id != null && id.equals(paiementInscriptionCollaborator.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

