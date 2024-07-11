package ma.zs.alc.ws.dto.collab;

import ma.zs.alc.ws.dto.vocab.CollaboratorDto;
import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;




@JsonInclude(JsonInclude.Include.NON_NULL)
public class InscriptionCollaboratorDto  extends AuditBaseDto {

    private BigDecimal price  ;
    private BigDecimal nbrStudent  ;
    private Boolean logo  ;
    private Boolean color  ;
    private Boolean bannerAd  ;
    private String startDate ;
    private String endDate ;

    private PackageCollaboratorDto packageCollaborator ;
    private CollaboratorDto collaborator ;
    private InscriptionCollaboratorStateDto inscriptionCollaboratorState ;



    public InscriptionCollaboratorDto(){
        super();
    }



    @Log
    public BigDecimal getPrice(){
        return this.price;
    }
    public void setPrice(BigDecimal price){
        this.price = price;
    }

    @Log
    public BigDecimal getNbrStudent(){
        return this.nbrStudent;
    }
    public void setNbrStudent(BigDecimal nbrStudent){
        this.nbrStudent = nbrStudent;
    }

    @Log
    public Boolean getLogo(){
        return this.logo;
    }
    public void setLogo(Boolean logo){
        this.logo = logo;
    }

    @Log
    public Boolean getColor(){
        return this.color;
    }
    public void setColor(Boolean color){
        this.color = color;
    }

    @Log
    public Boolean getBannerAd(){
        return this.bannerAd;
    }
    public void setBannerAd(Boolean bannerAd){
        this.bannerAd = bannerAd;
    }

    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getStartDate(){
        return this.startDate;
    }
    public void setStartDate(String startDate){
        this.startDate = startDate;
    }

    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getEndDate(){
        return this.endDate;
    }
    public void setEndDate(String endDate){
        this.endDate = endDate;
    }


    public PackageCollaboratorDto getPackageCollaborator(){
        return this.packageCollaborator;
    }

    public void setPackageCollaborator(PackageCollaboratorDto packageCollaborator){
        this.packageCollaborator = packageCollaborator;
    }
    public CollaboratorDto getCollaborator(){
        return this.collaborator;
    }

    public void setCollaborator(CollaboratorDto collaborator){
        this.collaborator = collaborator;
    }
    public InscriptionCollaboratorStateDto getInscriptionCollaboratorState(){
        return this.inscriptionCollaboratorState;
    }

    public void setInscriptionCollaboratorState(InscriptionCollaboratorStateDto inscriptionCollaboratorState){
        this.inscriptionCollaboratorState = inscriptionCollaboratorState;
    }






}
