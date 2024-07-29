package ma.zs.alc.ws.dto.collab;

import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;




@JsonInclude(JsonInclude.Include.NON_NULL)
public class PaiementInscriptionCollaboratorDto  extends AuditBaseDto {

    private BigDecimal total  ;
    private BigDecimal discount  ;
    private BigDecimal remaining  ;
    private String paiementDate ;

    private InscriptionCollaboratorDto inscriptionCollaborator ;
    private PaiementInscriptionCollaboratorStateDto paiementInscriptionCollaboratorState ;



    public PaiementInscriptionCollaboratorDto(){
        super();
    }



    @Log
    public BigDecimal getTotal(){
        return this.total;
    }
    public void setTotal(BigDecimal total){
        this.total = total;
    }

    @Log
    public BigDecimal getDiscount(){
        return this.discount;
    }
    public void setDiscount(BigDecimal discount){
        this.discount = discount;
    }

    @Log
    public BigDecimal getRemaining(){
        return this.remaining;
    }
    public void setRemaining(BigDecimal remaining){
        this.remaining = remaining;
    }

    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getPaiementDate(){
        return this.paiementDate;
    }
    public void setPaiementDate(String paiementDate){
        this.paiementDate = paiementDate;
    }


    public InscriptionCollaboratorDto getInscriptionCollaborator(){
        return this.inscriptionCollaborator;
    }

    public void setInscriptionCollaborator(InscriptionCollaboratorDto inscriptionCollaborator){
        this.inscriptionCollaborator = inscriptionCollaborator;
    }
    public PaiementInscriptionCollaboratorStateDto getPaiementInscriptionCollaboratorState(){
        return this.paiementInscriptionCollaboratorState;
    }

    public void setPaiementInscriptionCollaboratorState(PaiementInscriptionCollaboratorStateDto paiementInscriptionCollaboratorState){
        this.paiementInscriptionCollaboratorState = paiementInscriptionCollaboratorState;
    }






}
