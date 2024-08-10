package ma.zs.alc.dao.criteria.core.collab;


import ma.zs.alc.zynerator.criteria.BaseCriteria;
import ma.zs.alc.zynerator.security.dao.criteria.core.UserCriteria;

import java.util.List;

public class CollaboratorCriteria extends UserCriteria {

    private String libelle;
    private String libelleLike;
    private String description;
    private String descriptionLike;



    private TypeCollaboratorCriteria typeCollaborator ;
    private List<TypeCollaboratorCriteria> typeCollaborators ;


    public CollaboratorCriteria(){}

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


    public TypeCollaboratorCriteria getTypeCollaborator(){
        return this.typeCollaborator;
    }

    public void setTypeCollaborator(TypeCollaboratorCriteria typeCollaborator){
        this.typeCollaborator = typeCollaborator;
    }
    public List<TypeCollaboratorCriteria> getTypeCollaborators(){
        return this.typeCollaborators;
    }

    public void setTypeCollaborators(List<TypeCollaboratorCriteria> typeCollaborators){
        this.typeCollaborators = typeCollaborators;
    }
}
