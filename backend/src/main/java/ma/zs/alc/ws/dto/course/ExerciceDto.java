package  ma.zs.alc.ws.dto.course;

import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;



import ma.zs.alc.ws.dto.courseref.ContentTypeDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class ExerciceDto  extends AuditBaseDto {

    private String content  ;
    private String description  ;
    private String libelle  ;
    private Long numero  ;

    private ContentTypeDto contentType ;
    private SectionDto section ;



    public ExerciceDto(){
        super();
    }



    @Log
    public String getContent(){
        return this.content;
    }
    public void setContent(String content){
        this.content = content;
    }

    @Log
    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
    }

    @Log
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }

    @Log
    public Long getNumero(){
        return this.numero;
    }
    public void setNumero(Long numero){
        this.numero = numero;
    }


    public ContentTypeDto getContentType(){
        return this.contentType;
    }

    public void setContentType(ContentTypeDto contentType){
        this.contentType = contentType;
    }
    public SectionDto getSection(){
        return this.section;
    }

    public void setSection(SectionDto section){
        this.section = section;
    }






}
