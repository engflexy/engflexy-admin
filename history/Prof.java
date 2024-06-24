package ma.zs.alc.bean.history;//package ma.zs.alc.bean.core .prof;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.security.bean.User;

import java.util.List;
import java.util.Objects;

@Entity
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Prof extends User {
    public Prof(String username) {
        super(username);
    }

    @Column(length = 500)
    private String ref;
    @Column(length = 500)
    private String about;
    private Parcours parcours;
    private TypeTeacher typeTeacher;
    private Collaborator collaborator;
    @OneToMany
    private List<EtudiantReview> etudiantReviews;
    @OneToMany
    private List<Paiement> paiements;
    private List<TrancheHoraireProf> trancheHoraireProfs;
    @OneToMany
    private List<GroupeEtudiant> groupeEtudiants;
    @OneToMany
    private List<Salary> salaries;
    @OneToMany
    private List<ScheduleProf> scheduleProfs ;
    @OneToMany
    private List<SessionCours> sessionCours ;
    public Prof() {
        super();
    }

    public Prof(Long id) {
        this.id = id;
    }

    public Prof(Long id, String ref) {
        this.id = id;
        this.ref = ref;
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

    public String getRef() {
        return this.ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public String getAbout() {
        return this.about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parcours")
    public Parcours getParcours() {
        return this.parcours;
    }

    public void setParcours(Parcours parcours) {
        this.parcours = parcours;
    }

    @OneToMany(mappedBy = "prof")

    public List<TrancheHoraireProf> getTrancheHoraireProfs() {
        return this.trancheHoraireProfs;
    }

    public void setTrancheHoraireProfs(List<TrancheHoraireProf> trancheHoraireProfs) {
        this.trancheHoraireProfs = trancheHoraireProfs;
    }


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "type_teacher")
    public TypeTeacher getTypeTeacher() {
        return this.typeTeacher;
    }

    public void setTypeTeacher(TypeTeacher typeTeacher) {
        this.typeTeacher = typeTeacher;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "collaborator")
    public Collaborator getCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(Collaborator collaborator) {
        this.collaborator = collaborator;
    }


    @Transient
    public String getLabel() {
        label = ref;
        return label;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Prof prof = (Prof) o;
        return id != null && id.equals(prof.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}
