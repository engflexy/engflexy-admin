package  ma.zs.alc.dao.criteria.core.course;


import ma.zs.alc.dao.criteria.core.courseref.ContentTypeCriteria;

import ma.zs.alc.zynerator.criteria.BaseCriteria;
import java.util.List;

public class ExerciceCriteria extends  BaseCriteria  {

    private String content;
    private String contentLike;
    private String description;
    private String descriptionLike;
    private String libelle;
    private String libelleLike;
    private String numero;
    private String numeroMin;
    private String numeroMax;

    private ContentTypeCriteria contentType ;
    private List<ContentTypeCriteria> contentTypes ;
    private SectionCriteria section ;
    private List<SectionCriteria> sections ;


    public ExerciceCriteria(){}

    public String getContent(){
        return this.content;
    }
    public void setContent(String content){
        this.content = content;
    }
    public String getContentLike(){
        return this.contentLike;
    }
    public void setContentLike(String contentLike){
        this.contentLike = contentLike;
    }

    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
    }
    public String getDescriptionLike(){
        return this.descriptionLike;
    }
    public void setDescriptionLike(String descriptionLike){
        this.descriptionLike = descriptionLike;
    }

    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }
    public String getLibelleLike(){
        return this.libelleLike;
    }
    public void setLibelleLike(String libelleLike){
        this.libelleLike = libelleLike;
    }

    public String getNumero(){
        return this.numero;
    }
    public void setNumero(String numero){
        this.numero = numero;
    }   
    public String getNumeroMin(){
        return this.numeroMin;
    }
    public void setNumeroMin(String numeroMin){
        this.numeroMin = numeroMin;
    }
    public String getNumeroMax(){
        return this.numeroMax;
    }
    public void setNumeroMax(String numeroMax){
        this.numeroMax = numeroMax;
    }
      

    public ContentTypeCriteria getContentType(){
        return this.contentType;
    }

    public void setContentType(ContentTypeCriteria contentType){
        this.contentType = contentType;
    }
    public List<ContentTypeCriteria> getContentTypes(){
        return this.contentTypes;
    }

    public void setContentTypes(List<ContentTypeCriteria> contentTypes){
        this.contentTypes = contentTypes;
    }
    public SectionCriteria getSection(){
        return this.section;
    }

    public void setSection(SectionCriteria section){
        this.section = section;
    }
    public List<SectionCriteria> getSections(){
        return this.sections;
    }

    public void setSections(List<SectionCriteria> sections){
        this.sections = sections;
    }
}
