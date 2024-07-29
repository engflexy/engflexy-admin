package ma.zs.alc.dao.criteria.core.collab;



import ma.zs.alc.zynerator.criteria.BaseCriteria;
import java.util.List;
import java.time.LocalDateTime;
import java.time.LocalDate;

public class PaiementInscriptionCollaboratorCriteria extends  BaseCriteria  {

    private String total;
    private String totalMin;
    private String totalMax;
    private String discount;
    private String discountMin;
    private String discountMax;
    private String remaining;
    private String remainingMin;
    private String remainingMax;
    private LocalDateTime paiementDate;
    private LocalDateTime paiementDateFrom;
    private LocalDateTime paiementDateTo;

    private InscriptionCollaboratorCriteria inscriptionCollaborator ;
    private List<InscriptionCollaboratorCriteria> inscriptionCollaborators ;
    private PaiementInscriptionCollaboratorStateCriteria paiementInscriptionCollaboratorState ;
    private List<PaiementInscriptionCollaboratorStateCriteria> paiementInscriptionCollaboratorStates ;


    public PaiementInscriptionCollaboratorCriteria(){}

    public String getTotal(){
        return this.total;
    }
    public void setTotal(String total){
        this.total = total;
    }   
    public String getTotalMin(){
        return this.totalMin;
    }
    public void setTotalMin(String totalMin){
        this.totalMin = totalMin;
    }
    public String getTotalMax(){
        return this.totalMax;
    }
    public void setTotalMax(String totalMax){
        this.totalMax = totalMax;
    }
      
    public String getDiscount(){
        return this.discount;
    }
    public void setDiscount(String discount){
        this.discount = discount;
    }   
    public String getDiscountMin(){
        return this.discountMin;
    }
    public void setDiscountMin(String discountMin){
        this.discountMin = discountMin;
    }
    public String getDiscountMax(){
        return this.discountMax;
    }
    public void setDiscountMax(String discountMax){
        this.discountMax = discountMax;
    }
      
    public String getRemaining(){
        return this.remaining;
    }
    public void setRemaining(String remaining){
        this.remaining = remaining;
    }   
    public String getRemainingMin(){
        return this.remainingMin;
    }
    public void setRemainingMin(String remainingMin){
        this.remainingMin = remainingMin;
    }
    public String getRemainingMax(){
        return this.remainingMax;
    }
    public void setRemainingMax(String remainingMax){
        this.remainingMax = remainingMax;
    }
      
    public LocalDateTime getPaiementDate(){
        return this.paiementDate;
    }
    public void setPaiementDate(LocalDateTime paiementDate){
        this.paiementDate = paiementDate;
    }
    public LocalDateTime getPaiementDateFrom(){
        return this.paiementDateFrom;
    }
    public void setPaiementDateFrom(LocalDateTime paiementDateFrom){
        this.paiementDateFrom = paiementDateFrom;
    }
    public LocalDateTime getPaiementDateTo(){
        return this.paiementDateTo;
    }
    public void setPaiementDateTo(LocalDateTime paiementDateTo){
        this.paiementDateTo = paiementDateTo;
    }

    public InscriptionCollaboratorCriteria getInscriptionCollaborator(){
        return this.inscriptionCollaborator;
    }

    public void setInscriptionCollaborator(InscriptionCollaboratorCriteria inscriptionCollaborator){
        this.inscriptionCollaborator = inscriptionCollaborator;
    }
    public List<InscriptionCollaboratorCriteria> getInscriptionCollaborators(){
        return this.inscriptionCollaborators;
    }

    public void setInscriptionCollaborators(List<InscriptionCollaboratorCriteria> inscriptionCollaborators){
        this.inscriptionCollaborators = inscriptionCollaborators;
    }
    public PaiementInscriptionCollaboratorStateCriteria getPaiementInscriptionCollaboratorState(){
        return this.paiementInscriptionCollaboratorState;
    }

    public void setPaiementInscriptionCollaboratorState(PaiementInscriptionCollaboratorStateCriteria paiementInscriptionCollaboratorState){
        this.paiementInscriptionCollaboratorState = paiementInscriptionCollaboratorState;
    }
    public List<PaiementInscriptionCollaboratorStateCriteria> getPaiementInscriptionCollaboratorStates(){
        return this.paiementInscriptionCollaboratorStates;
    }

    public void setPaiementInscriptionCollaboratorStates(List<PaiementInscriptionCollaboratorStateCriteria> paiementInscriptionCollaboratorStates){
        this.paiementInscriptionCollaboratorStates = paiementInscriptionCollaboratorStates;
    }
}
