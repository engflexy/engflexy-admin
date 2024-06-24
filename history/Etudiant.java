package ma.zs.alc.bean.history;//package ma.zs.alc.bean.core .inscription;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.security.bean.User;

import java.util.List;
import java.util.Objects;

@Entity
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Etudiant extends User {


    public Etudiant(String username) {
        super(username);
    }

    @Column(length = 500)
    private String groupOption;
    @Column(columnDefinition = "boolean default false")
    private Boolean subscribe = false;
    @Column(columnDefinition = "boolean default false")
    private TeacherLocality teacherLocality;
    private Parcours parcours;
    private GroupeEtude groupeEtude;
    private PackStudent packStudent;
    private StatutSocial statutSocial;
    private NiveauEtude niveauEtude;
    private Skill skill;
    private Langue langue;
    private Collaborator collaborator;
    private List<QuizEtudiant> quizEtudiants;
    @OneToMany
    private List<Dictionary> dictionaries;
    @OneToMany
    private List<EtudiantReview> etudiantReviews;
    @OneToMany
    private List<HomeWorkEtudiant> homeWorkEtudiants;
    private List<Inscription> inscriptions;
    private List<GroupeEtudiantDetail> groupeEtudiantDetails;

    public Etudiant() {
        super();
    }

    public Etudiant(Long id) {
        this.id = id;
    }


    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "teacher_locality")
    public TeacherLocality getTeacherLocality() {
        return this.teacherLocality;
    }

    public void setTeacherLocality(TeacherLocality teacherLocality) {
        this.teacherLocality = teacherLocality;
    }

    public String getGroupOption() {
        return this.groupOption;
    }

    public void setGroupOption(String groupOption) {
        this.groupOption = groupOption;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parcours")
    public Parcours getParcours() {
        return this.parcours;
    }

    public void setParcours(Parcours parcours) {
        this.parcours = parcours;
    }

    @OneToMany(mappedBy = "etudiant")
    public List<QuizEtudiant> getQuizEtudiants() {
        return this.quizEtudiants;
    }

    public void setQuizEtudiants(List<QuizEtudiant> quizEtudiants) {
        this.quizEtudiants = quizEtudiants;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "groupe_etude")
    public GroupeEtude getGroupeEtude() {
        return this.groupeEtude;
    }

    public void setGroupeEtude(GroupeEtude groupeEtude) {
        this.groupeEtude = groupeEtude;
    }

    @OneToMany(mappedBy = "etudiant")
    public List<GroupeEtudiantDetail> getGroupeEtudiantDetails() {
        return this.groupeEtudiantDetails;
    }

    public void setGroupeEtudiantDetails(List<GroupeEtudiantDetail> groupeEtudiantDetails) {
        this.groupeEtudiantDetails = groupeEtudiantDetails;
    }

    @OneToMany(mappedBy = "etudiant")
    public List<Inscription> getInscriptions() {
        return inscriptions;
    }

    public void setInscriptions(List<Inscription> inscriptions) {
        this.inscriptions = inscriptions;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pack_student")
    public PackStudent getPackStudent() {
        return this.packStudent;
    }

    public void setPackStudent(PackStudent packStudent) {
        this.packStudent = packStudent;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "statut_social")
    public StatutSocial getStatutSocial() {
        return this.statutSocial;
    }

    public void setStatutSocial(StatutSocial statutSocial) {
        this.statutSocial = statutSocial;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "niveau_etude")
    public NiveauEtude getNiveauEtude() {
        return this.niveauEtude;
    }

    public void setNiveauEtude(NiveauEtude niveauEtude) {
        this.niveauEtude = niveauEtude;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "skill")
    public Skill getSkill() {
        return this.skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "langue")
    public Langue getLangue() {
        return this.langue;
    }

    public void setLangue(Langue langue) {
        this.langue = langue;
    }

    public Boolean getSubscribe() {
        return this.subscribe;
    }

    public void setSubscribe(Boolean subscribe) {
        this.subscribe = subscribe;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "collaborator")
    public Collaborator getCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(Collaborator collaborator) {
        this.collaborator = collaborator;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Etudiant etudiant = (Etudiant) o;
        return id != null && id.equals(etudiant.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

