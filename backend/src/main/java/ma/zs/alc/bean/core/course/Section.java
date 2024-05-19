package ma.zs.alc.bean.core.course;

import java.util.Objects;
import java.util.List;





import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.bean.core.quiz.Question;
import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.course.Cours;


import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;
import jakarta.persistence.*;
import java.util.Objects;




@Entity
@Table(name = "section")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Section   extends AuditBusinessObject     {

    private Long id;

    @Column(length = 500)
    private String code;
    @Column(length = 500)
    private String libelle;
    @Column(length = 500)
    private String description;

    private Cours cours ;

    private List<Quiz> quizs ;
    private List<Exercice> exercices ;

    public Section(){
        super();
    }

    public Section(Long id){
        this.id = id;
    }

    public Section(Long id,String libelle){
        this.id = id;
        this.libelle = libelle ;
    }
    public Section(String libelle){
        this.libelle = libelle ;
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
    public String getCode(){
        return this.code;
    }
    public void setCode(String code){
        this.code = code;
    }
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }
    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cours")
    public Cours getCours(){
        return this.cours;
    }
    public void setCours(Cours cours){
        this.cours = cours;
    }
    @OneToMany(mappedBy = "section")

    public List<Quiz> getQuizs(){
        return this.quizs;
    }
    public void setQuizs(List<Quiz> quizs){
        this.quizs = quizs;
    }
    @OneToMany(mappedBy = "section")

    public List<Exercice> getExercices(){
        return this.exercices;
    }
    public void setExercices(List<Exercice> exercices){
        this.exercices = exercices;
    }

    @Transient
    public String getLabel() {
        label = libelle;
        return label;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Section section = (Section) o;
        return id != null && id.equals(section.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

