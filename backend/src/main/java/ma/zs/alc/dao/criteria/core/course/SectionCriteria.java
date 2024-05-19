package  ma.zs.alc.dao.criteria.core.course;



import ma.zs.alc.zynerator.criteria.BaseCriteria;
import java.util.List;

public class SectionCriteria extends  BaseCriteria  {

    private String code;
    private String codeLike;
    private String libelle;
    private String libelleLike;
    private String description;
    private String descriptionLike;

    private CoursCriteria cours ;
    private List<CoursCriteria> courss ;


    public SectionCriteria(){}

    public String getCode(){
        return this.code;
    }
    public void setCode(String code){
        this.code = code;
    }
    public String getCodeLike(){
        return this.codeLike;
    }
    public void setCodeLike(String codeLike){
        this.codeLike = codeLike;
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


    public CoursCriteria getCours(){
        return this.cours;
    }

    public void setCours(CoursCriteria cours){
        this.cours = cours;
    }
    public List<CoursCriteria> getCourss(){
        return this.courss;
    }

    public void setCourss(List<CoursCriteria> courss){
        this.courss = courss;
    }
}
