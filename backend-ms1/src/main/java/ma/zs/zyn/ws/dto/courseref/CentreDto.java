package  ma.zs.zyn.ws.dto.courseref;

import ma.zs.zyn.zynerator.audit.Log;
import ma.zs.zyn.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;


import ma.zs.zyn.ws.dto.course.ParcoursDto;
import ma.zs.zyn.ws.dto.inscription.EtudiantDto;
import ma.zs.zyn.ws.dto.course.CoursDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class CentreDto  extends AuditBaseDto {

    private String ref  ;
    private String libelle  ;
    private String description  ;
    private String log  ;
    private String password  ;


    private List<ParcoursDto> parcourss ;


    public CentreDto(){
        super();
    }



    @Log
    public String getRef(){
        return this.ref;
    }
    public void setRef(String ref){
        this.ref = ref;
    }

    @Log
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }

    @Log
    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
    }

    @Log
    public String getLog(){
        return this.log;
    }
    public void setLog(String log){
        this.log = log;
    }

    @Log
    public String getPassword(){
        return this.password;
    }
    public void setPassword(String password){
        this.password = password;
    }





    public List<ParcoursDto> getParcourss(){
        return this.parcourss;
    }

    public void setParcourss(List<ParcoursDto> parcourss){
        this.parcourss = parcourss;
    }



}
