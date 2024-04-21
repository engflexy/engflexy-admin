package  ma.zs.zyn.ws.dto.courseref;

import ma.zs.zyn.zynerator.audit.Log;
import ma.zs.zyn.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;


import ma.zs.zyn.ws.dto.course.SectionDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class SuperCategorieSectionDto  extends AuditBaseDto {

    private String code  ;
    private String libelle  ;


    private List<CategorieSectionDto> categorieSections ;


    public SuperCategorieSectionDto(){
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
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }





    public List<CategorieSectionDto> getCategorieSections(){
        return this.categorieSections;
    }

    public void setCategorieSections(List<CategorieSectionDto> categorieSections){
        this.categorieSections = categorieSections;
    }



}
