package  ma.zs.alc.ws.dto.vocab;

import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import ma.zs.alc.zynerator.security.bean.Role;
import java.util.Collection;
import java.util.List;


import ma.zs.alc.ws.dto.course.ParcoursDto;
import ma.zs.alc.ws.dto.course.CoursDto;
import ma.zs.alc.ws.dto.prof.TypeCollaboratorDto;
import ma.zs.alc.zynerator.security.ws.dto.UserDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class CollaboratorDto  extends UserDto {

    private String libelle  ;
    private String description  ;

    private TypeCollaboratorDto typeCollaborator ;

    private List<ParcoursDto> parcourss ;


    private Collection<Role> roles;
    public CollaboratorDto(){
        super();
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


    public TypeCollaboratorDto getTypeCollaborator(){
        return this.typeCollaborator;
    }

    public void setTypeCollaborator(TypeCollaboratorDto typeCollaborator){
        this.typeCollaborator = typeCollaborator;
    }



    public List<ParcoursDto> getParcourss(){
        return this.parcourss;
    }

    public void setParcourss(List<ParcoursDto> parcourss){
        this.parcourss = parcourss;
    }




    public Collection<Role> getRoles() {
        return roles;
    }

    public void setRoles(Collection<Role> roles) {
        this.roles = roles;
    }
}
