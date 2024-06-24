package ma.zs.alc.bean.history;//package ma.zs.alc.bean.core .learning;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.bean.history.*; //.course.Cours;
import ma.zs.alc.bean.history.*; //.grpe.GroupeEtudiant;
import ma.zs.alc.bean.history.*; //.learning.SessionCoursSection;
import ma.zs.alc.bean.history.*; //.prof.Prof;
import ma.zs.alc.bean.history.*; //.salary.Salary;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;


@Entity
@Table(name = "session_cours")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class SessionCours   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String reference;
    private BigDecimal duree = BigDecimal.ZERO;
    private BigDecimal totalheure = BigDecimal.ZERO;
    private BigDecimal mois = BigDecimal.ZERO;
    private BigDecimal annee = BigDecimal.ZERO;
    private LocalDateTime dateFin ;
    private LocalDateTime dateDebut ;
    @Column(columnDefinition = "boolean default false")
    private Boolean payer = false;
    private Long nreKeySectionFinished ;
    private Long nreAddSectionFinished ;
    private Long totalKeySection ;
    private Long totalAddSection ;
    private Long nreWords ;
    @Column(columnDefinition = "boolean default false")
    private Boolean homeworkFinished = false;
    @Column(columnDefinition = "boolean default false")
    private Boolean courseFinished = false;

    private Prof prof ;
    private Cours cours ;
    private GroupeEtudiant groupeEtudiant ;
    private Salary salary ;

    private List<SessionCoursSection> sessionCoursSections ;

    public SessionCours(){
        super();
    }

    public SessionCours(Long id){
        this.id = id;
    }

    public SessionCours(Long id,String reference){
        this.id = id;
        this.reference = reference ;
    }
    public SessionCours(String reference){
        this.reference = reference ;
    }




    @Id
    @Column(name = "id")
    @GeneratedValue(strategy =  GenerationType.AUTO)
    public Long getId(){
        return this.id;
    }
    public void setId(Long id){
        this.id = id;
    }
    public String getReference(){
        return this.reference;
    }
    public void setReference(String reference){
        this.reference = reference;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "prof")
    public Prof getProf(){
        return this.prof;
    }
    public void setProf(Prof prof){
        this.prof = prof;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cours")
    public Cours getCours(){
        return this.cours;
    }
    public void setCours(Cours cours){
        this.cours = cours;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "groupe_etudiant")
    public GroupeEtudiant getGroupeEtudiant(){
        return this.groupeEtudiant;
    }
    public void setGroupeEtudiant(GroupeEtudiant groupeEtudiant){
        this.groupeEtudiant = groupeEtudiant;
    }
    public BigDecimal getDuree(){
        return this.duree;
    }
    public void setDuree(BigDecimal duree){
        this.duree = duree;
    }
    public BigDecimal getTotalheure(){
        return this.totalheure;
    }
    public void setTotalheure(BigDecimal totalheure){
        this.totalheure = totalheure;
    }
    public BigDecimal getMois(){
        return this.mois;
    }
    public void setMois(BigDecimal mois){
        this.mois = mois;
    }
    public BigDecimal getAnnee(){
        return this.annee;
    }
    public void setAnnee(BigDecimal annee){
        this.annee = annee;
    }
    public LocalDateTime getDateFin(){
        return this.dateFin;
    }
    public void setDateFin(LocalDateTime dateFin){
        this.dateFin = dateFin;
    }
    public LocalDateTime getDateDebut(){
        return this.dateDebut;
    }
    public void setDateDebut(LocalDateTime dateDebut){
        this.dateDebut = dateDebut;
    }
    public Boolean  getPayer(){
        return this.payer;
    }
    public void setPayer(Boolean payer){
        this.payer = payer;
    }
    public Long getNreKeySectionFinished(){
        return this.nreKeySectionFinished;
    }
    public void setNreKeySectionFinished(Long nreKeySectionFinished){
        this.nreKeySectionFinished = nreKeySectionFinished;
    }
    public Long getNreAddSectionFinished(){
        return this.nreAddSectionFinished;
    }
    public void setNreAddSectionFinished(Long nreAddSectionFinished){
        this.nreAddSectionFinished = nreAddSectionFinished;
    }
    public Long getTotalKeySection(){
        return this.totalKeySection;
    }
    public void setTotalKeySection(Long totalKeySection){
        this.totalKeySection = totalKeySection;
    }
    public Long getTotalAddSection(){
        return this.totalAddSection;
    }
    public void setTotalAddSection(Long totalAddSection){
        this.totalAddSection = totalAddSection;
    }
    public Long getNreWords(){
        return this.nreWords;
    }
    public void setNreWords(Long nreWords){
        this.nreWords = nreWords;
    }
    public Boolean  getHomeworkFinished(){
        return this.homeworkFinished;
    }
    public void setHomeworkFinished(Boolean homeworkFinished){
        this.homeworkFinished = homeworkFinished;
    }
    public Boolean  getCourseFinished(){
        return this.courseFinished;
    }
    public void setCourseFinished(Boolean courseFinished){
        this.courseFinished = courseFinished;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "salary")
    public Salary getSalary(){
        return this.salary;
    }
    public void setSalary(Salary salary){
        this.salary = salary;
    }
    @OneToMany(mappedBy = "sessionCours")

    public List<SessionCoursSection> getSessionCoursSections(){
        return this.sessionCoursSections;
    }
    public void setSessionCoursSections(List<SessionCoursSection> sessionCoursSections){
        this.sessionCoursSections = sessionCoursSections;
    }

    @Transient
    public String getLabel() {
        label = reference;
        return label;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SessionCours sessionCours = (SessionCours) o;
        return id != null && id.equals(sessionCours.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

