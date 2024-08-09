package  ma.zs.alc.dao.criteria.core.prof;


import ma.zs.alc.dao.criteria.core.collab.CollaboratorCriteria;
import ma.zs.alc.dao.criteria.core.course.ParcoursCriteria;

import ma.zs.alc.zynerator.criteria.BaseCriteria;
import ma.zs.alc.zynerator.security.dao.criteria.core.UserCriteria;

import java.util.List;

public class ProfCriteria extends UserCriteria {

    private String ref;
    private String refLike;
    private String about;
    private String aboutLike;


    private ParcoursCriteria parcours ;
    private List<ParcoursCriteria> parcourss ;
    private CategorieProfCriteria categorieProf ;
    private List<CategorieProfCriteria> categorieProfs ;
    private TypeTeacherCriteria typeTeacher ;
    private List<TypeTeacherCriteria> typeTeachers ;
    private CollaboratorCriteria collaborator ;
    private List<CollaboratorCriteria> collaborators ;


    public ProfCriteria(){}

    public String getRef(){
        return this.ref;
    }
    public void setRef(String ref){
        this.ref = ref;
    }
    public String getRefLike(){
        return this.refLike;
    }
    public void setRefLike(String refLike){
        this.refLike = refLike;
    }

    public String getAbout(){
        return this.about;
    }
    public void setAbout(String about){
        this.about = about;
    }
    public String getAboutLike(){
        return this.aboutLike;
    }
    public void setAboutLike(String aboutLike){
        this.aboutLike = aboutLike;
    }



    public ParcoursCriteria getParcours(){
        return this.parcours;
    }

    public void setParcours(ParcoursCriteria parcours){
        this.parcours = parcours;
    }
    public List<ParcoursCriteria> getParcourss(){
        return this.parcourss;
    }

    public void setParcourss(List<ParcoursCriteria> parcourss){
        this.parcourss = parcourss;
    }
    public CategorieProfCriteria getCategorieProf(){
        return this.categorieProf;
    }

    public void setCategorieProf(CategorieProfCriteria categorieProf){
        this.categorieProf = categorieProf;
    }
    public List<CategorieProfCriteria> getCategorieProfs(){
        return this.categorieProfs;
    }

    public void setCategorieProfs(List<CategorieProfCriteria> categorieProfs){
        this.categorieProfs = categorieProfs;
    }
    public TypeTeacherCriteria getTypeTeacher(){
        return this.typeTeacher;
    }

    public void setTypeTeacher(TypeTeacherCriteria typeTeacher){
        this.typeTeacher = typeTeacher;
    }
    public List<TypeTeacherCriteria> getTypeTeachers(){
        return this.typeTeachers;
    }

    public void setTypeTeachers(List<TypeTeacherCriteria> typeTeachers){
        this.typeTeachers = typeTeachers;
    }
    public CollaboratorCriteria getCollaborator(){
        return this.collaborator;
    }

    public void setCollaborator(CollaboratorCriteria collaborator){
        this.collaborator = collaborator;
    }
    public List<CollaboratorCriteria> getCollaborators(){
        return this.collaborators;
    }

    public void setCollaborators(List<CollaboratorCriteria> collaborators){
        this.collaborators = collaborators;
    }
}
