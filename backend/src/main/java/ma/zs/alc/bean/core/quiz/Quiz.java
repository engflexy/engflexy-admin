package ma.zs.alc.bean.core.quiz;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;


@Entity
@Table(name = "quiz")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Quiz extends AuditBusinessObject {

    private Long id;

    @Column(length = 500)
    private String ref;
    @Column(length = 500)
    private String lib;
    private LocalDateTime dateDebut;
    private LocalDateTime dateFin;
    private Long numero;
    private Long seuilReussite;

    private Exercice exercice;

    private List<Question> questions;

    public Quiz() {
        super();
    }

    public Quiz(Long id) {
        this.id = id;
    }

    public Quiz(Long id, String lib) {
        this.id = id;
        this.lib = lib;
    }

    public Quiz(String lib) {
        this.lib = lib;
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

    public String getLib() {
        return this.lib;
    }

    public void setLib(String lib) {
        this.lib = lib;
    }

    public LocalDateTime getDateDebut() {
        return this.dateDebut;
    }

    public void setDateDebut(LocalDateTime dateDebut) {
        this.dateDebut = dateDebut;
    }

    public LocalDateTime getDateFin() {
        return this.dateFin;
    }

    public void setDateFin(LocalDateTime dateFin) {
        this.dateFin = dateFin;
    }

    @OneToMany(mappedBy = "quiz")

    public List<Question> getQuestions() {
        return this.questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    @OneToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    public Exercice getExercice() {
        return this.exercice;
    }

    public void setExercice(Exercice section) {
        this.exercice = section;
    }

    public Long getNumero() {
        return this.numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    public Long getSeuilReussite() {
        return this.seuilReussite;
    }

    public void setSeuilReussite(Long seuilReussite) {
        this.seuilReussite = seuilReussite;
    }

    @Transient
    public String getLabel() {
        label = lib;
        return label;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Quiz quiz = (Quiz) o;
        return id != null && id.equals(quiz.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

