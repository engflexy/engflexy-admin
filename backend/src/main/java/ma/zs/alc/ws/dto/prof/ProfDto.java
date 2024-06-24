package ma.zs.alc.ws.dto.prof;

import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.ws.dto.course.ParcoursDto;
import ma.zs.alc.ws.dto.recomrecla.RecommendTeacherDto;
import ma.zs.alc.ws.dto.vocab.CollaboratorDto;
import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.ws.dto.UserDto;

import java.util.Collection;
import java.util.List;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class ProfDto extends UserDto {

    private String ref;
    private ParcoursDto parcours;
    private CategorieProfDto categorieProf;
    private TypeTeacherDto typeTeacher;
    private CollaboratorDto collaborator;

    private List<TrancheHoraireProfDto> trancheHoraireProfs;
    private List<RecommendTeacherDto> recommendTeachers;


    private Collection<Role> roles;

    public ProfDto() {
        super();
    }


    @Log
    public String getRef() {
        return this.ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public ParcoursDto getParcours() {
        return this.parcours;
    }

    public void setParcours(ParcoursDto parcours) {
        this.parcours = parcours;
    }

    public CategorieProfDto getCategorieProf() {
        return this.categorieProf;
    }

    public void setCategorieProf(CategorieProfDto categorieProf) {
        this.categorieProf = categorieProf;
    }

    public TypeTeacherDto getTypeTeacher() {
        return this.typeTeacher;
    }

    public void setTypeTeacher(TypeTeacherDto typeTeacher) {
        this.typeTeacher = typeTeacher;
    }

    public CollaboratorDto getCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(CollaboratorDto collaborator) {
        this.collaborator = collaborator;
    }


    public List<TrancheHoraireProfDto> getTrancheHoraireProfs() {
        return this.trancheHoraireProfs;
    }

    public void setTrancheHoraireProfs(List<TrancheHoraireProfDto> trancheHoraireProfs) {
        this.trancheHoraireProfs = trancheHoraireProfs;
    }

    public List<RecommendTeacherDto> getRecommendTeachers() {
        return this.recommendTeachers;
    }

    public void setRecommendTeachers(List<RecommendTeacherDto> recommendTeachers) {
        this.recommendTeachers = recommendTeachers;
    }


    public Collection<Role> getRoles() {
        return roles;
    }

    public void setRoles(Collection<Role> roles) {
        this.roles = roles;
    }
}
