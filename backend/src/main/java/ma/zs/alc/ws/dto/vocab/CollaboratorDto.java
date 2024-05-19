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


@JsonInclude(JsonInclude.Include.NON_NULL)
public class CollaboratorDto  extends AuditBaseDto {

    private String libelle  ;
    private String description  ;
    private Boolean credentialsNonExpired  ;
    private Boolean enabled  ;
    private Boolean accountNonExpired  ;
    private Boolean accountNonLocked  ;
    private Boolean passwordChanged  ;
    private String username  ;
    private String password  ;

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

    @Log
    public Boolean getCredentialsNonExpired(){
        return this.credentialsNonExpired;
    }
    public void setCredentialsNonExpired(Boolean credentialsNonExpired){
        this.credentialsNonExpired = credentialsNonExpired;
    }

    @Log
    public Boolean getEnabled(){
        return this.enabled;
    }
    public void setEnabled(Boolean enabled){
        this.enabled = enabled;
    }

    @Log
    public Boolean getAccountNonExpired(){
        return this.accountNonExpired;
    }
    public void setAccountNonExpired(Boolean accountNonExpired){
        this.accountNonExpired = accountNonExpired;
    }

    @Log
    public Boolean getAccountNonLocked(){
        return this.accountNonLocked;
    }
    public void setAccountNonLocked(Boolean accountNonLocked){
        this.accountNonLocked = accountNonLocked;
    }

    @Log
    public Boolean getPasswordChanged(){
        return this.passwordChanged;
    }
    public void setPasswordChanged(Boolean passwordChanged){
        this.passwordChanged = passwordChanged;
    }

    @Log
    public String getUsername(){
        return this.username;
    }
    public void setUsername(String username){
        this.username = username;
    }

    @Log
    public String getPassword(){
        return this.password;
    }
    public void setPassword(String password){
        this.password = password;
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
