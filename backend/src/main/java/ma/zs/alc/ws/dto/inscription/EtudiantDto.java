package ma.zs.alc.ws.dto.inscription;

import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.ws.dto.course.ParcoursDto;
import ma.zs.alc.ws.dto.grpe.GroupeEtudeDto;
import ma.zs.alc.ws.dto.grpe.GroupeEtudiantDetailDto;
import ma.zs.alc.ws.dto.grpe.InscriptionDto;
import ma.zs.alc.ws.dto.inscriptionref.*;
import ma.zs.alc.ws.dto.pack.PackStudentDto;
import ma.zs.alc.ws.dto.quizetudiant.QuizEtudiantDto;
import ma.zs.alc.ws.dto.collab.CollaboratorDto;
import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.ws.dto.UserDto;

import java.util.Collection;
import java.util.List;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class EtudiantDto extends UserDto {

    private String groupOption;
    private Boolean subscribe;
    private TeacherLocalityDto teacherLocality;
    private ParcoursDto parcours;
    private GroupeEtudeDto groupeEtude;
    private PackStudentDto packStudent;
    private StatutSocialDto statutSocial;
    private InteretEtudiantDto interetEtudiant;
    private NiveauEtudeDto niveauEtude;
    private SkillDto skill;
    private FonctionDto fonction;
    private LangueDto langue;
    private CollaboratorDto collaborator;

    private List<QuizEtudiantDto> quizEtudiants;
    private List<GroupeEtudiantDetailDto> groupeEtudiantDetails;
    private List<InscriptionDto> inscriptions;


    private Collection<Role> roles;

    public EtudiantDto() {
        super();
    }


    @Log
    public String getGroupOption() {
        return this.groupOption;
    }

    public void setGroupOption(String groupOption) {
        this.groupOption = groupOption;
    }

    @Log
    public Boolean getSubscribe() {
        return this.subscribe;
    }

    public void setSubscribe(Boolean subscribe) {
        this.subscribe = subscribe;
    }


    public TeacherLocalityDto getTeacherLocality() {
        return this.teacherLocality;
    }

    public void setTeacherLocality(TeacherLocalityDto teacherLocality) {
        this.teacherLocality = teacherLocality;
    }

    public ParcoursDto getParcours() {
        return this.parcours;
    }

    public void setParcours(ParcoursDto parcours) {
        this.parcours = parcours;
    }

    public GroupeEtudeDto getGroupeEtude() {
        return this.groupeEtude;
    }

    public void setGroupeEtude(GroupeEtudeDto groupeEtude) {
        this.groupeEtude = groupeEtude;
    }

    public PackStudentDto getPackStudent() {
        return this.packStudent;
    }

    public void setPackStudent(PackStudentDto packStudent) {
        this.packStudent = packStudent;
    }

    public StatutSocialDto getStatutSocial() {
        return this.statutSocial;
    }

    public void setStatutSocial(StatutSocialDto statutSocial) {
        this.statutSocial = statutSocial;
    }

    public InteretEtudiantDto getInteretEtudiant() {
        return this.interetEtudiant;
    }

    public void setInteretEtudiant(InteretEtudiantDto interetEtudiant) {
        this.interetEtudiant = interetEtudiant;
    }

    public NiveauEtudeDto getNiveauEtude() {
        return this.niveauEtude;
    }

    public void setNiveauEtude(NiveauEtudeDto niveauEtude) {
        this.niveauEtude = niveauEtude;
    }

    public SkillDto getSkill() {
        return this.skill;
    }

    public void setSkill(SkillDto skill) {
        this.skill = skill;
    }

    public FonctionDto getFonction() {
        return this.fonction;
    }

    public void setFonction(FonctionDto fonction) {
        this.fonction = fonction;
    }

    public LangueDto getLangue() {
        return this.langue;
    }

    public void setLangue(LangueDto langue) {
        this.langue = langue;
    }

    public CollaboratorDto getCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(CollaboratorDto collaborator) {
        this.collaborator = collaborator;
    }


    public List<QuizEtudiantDto> getQuizEtudiants() {
        return this.quizEtudiants;
    }

    public void setQuizEtudiants(List<QuizEtudiantDto> quizEtudiants) {
        this.quizEtudiants = quizEtudiants;
    }

    public List<GroupeEtudiantDetailDto> getGroupeEtudiantDetails() {
        return this.groupeEtudiantDetails;
    }

    public void setGroupeEtudiantDetails(List<GroupeEtudiantDetailDto> groupeEtudiantDetails) {
        this.groupeEtudiantDetails = groupeEtudiantDetails;
    }

    public List<InscriptionDto> getInscriptions() {
        return inscriptions;
    }

    public void setInscriptions(List<InscriptionDto> inscriptions) {
        this.inscriptions = inscriptions;
    }

    public Collection<Role> getRoles() {
        return roles;
    }

    public void setRoles(Collection<Role> roles) {
        this.roles = roles;
    }
}
