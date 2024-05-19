package  ma.zs.alc.ws.dto.common;

import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.math.BigDecimal;


import ma.zs.alc.ws.dto.vocab.CollaboratorDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class ClassAverageBonusDto  extends AuditBaseDto {

    private String code  ;
    private Integer nombreSession  = 0 ;
    private BigDecimal prix  ;

    private CollaboratorDto collaborator ;



    public ClassAverageBonusDto(){
        super();
    }



    @Log
    public String getCode(){
        return this.code;
    }
    public void setCode(String code){
        this.code = code;
    }

    @Log
    public Integer getNombreSession(){
        return this.nombreSession;
    }
    public void setNombreSession(Integer nombreSession){
        this.nombreSession = nombreSession;
    }

    @Log
    public BigDecimal getPrix(){
        return this.prix;
    }
    public void setPrix(BigDecimal prix){
        this.prix = prix;
    }


    public CollaboratorDto getCollaborator(){
        return this.collaborator;
    }

    public void setCollaborator(CollaboratorDto collaborator){
        this.collaborator = collaborator;
    }






}
