package  ma.zs.zyn.ws.dto.salary;

import ma.zs.zyn.zynerator.audit.Log;
import ma.zs.zyn.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.math.BigDecimal;




@JsonInclude(JsonInclude.Include.NON_NULL)
public class WorkloadBonusDto  extends AuditBaseDto {

    private String code  ;
    private Integer nombreSession  = 0 ;
    private BigDecimal prix  ;




    public WorkloadBonusDto(){
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








}
