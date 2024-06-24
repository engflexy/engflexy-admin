package ma.zs.alc.bean.history;//package ma.zs.alc.bean.core .homework;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.bean.history.*; //.homework.HomeWork;
import ma.zs.alc.bean.history.*; //.homework.ReponseEtudiantHomeWork;
import ma.zs.alc.bean.history.*; //.inscription.Etudiant;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;


@Entity
@Table(name = "home_work_etudiant")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class HomeWorkEtudiant   extends AuditBusinessObject     {

    private Long id;

    private BigDecimal note = BigDecimal.ZERO;
    @Column(length = 500)
    private String resultat;
    private LocalDateTime dateHomeWork ;

    private Etudiant etudiant ;
    private HomeWork homeWork ;

    private List<ReponseEtudiantHomeWork> reponseEtudiantHomeWorks ;

    public HomeWorkEtudiant(){
        super();
    }

    public HomeWorkEtudiant(Long id){
        this.id = id;
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
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "etudiant")
    public Etudiant getEtudiant(){
        return this.etudiant;
    }
    public void setEtudiant(Etudiant etudiant){
        this.etudiant = etudiant;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "home_work")
    public HomeWork getHomeWork(){
        return this.homeWork;
    }
    public void setHomeWork(HomeWork homeWork){
        this.homeWork = homeWork;
    }
    @OneToMany(mappedBy = "homeWorkEtudiant")

    public List<ReponseEtudiantHomeWork> getReponseEtudiantHomeWorks(){
        return this.reponseEtudiantHomeWorks;
    }
    public void setReponseEtudiantHomeWorks(List<ReponseEtudiantHomeWork> reponseEtudiantHomeWorks){
        this.reponseEtudiantHomeWorks = reponseEtudiantHomeWorks;
    }
    public BigDecimal getNote(){
        return this.note;
    }
    public void setNote(BigDecimal note){
        this.note = note;
    }
    public String getResultat(){
        return this.resultat;
    }
    public void setResultat(String resultat){
        this.resultat = resultat;
    }
    public LocalDateTime getDateHomeWork(){
        return this.dateHomeWork;
    }
    public void setDateHomeWork(LocalDateTime dateHomeWork){
        this.dateHomeWork = dateHomeWork;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HomeWorkEtudiant homeWorkEtudiant = (HomeWorkEtudiant) o;
        return id != null && id.equals(homeWorkEtudiant.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

