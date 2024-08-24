package ma.zs.alc.service.impl.migration.dto;

import java.util.List;


public class QuizMigration {

    private Long id;
    private String ref;
    private String lib;
    private String dateDebut;
    private String dateFin;

    private List<QuestionMigration> questions;


    private SectionMigration section;
    private Long numero;
    private Long seuilReussite;

    public QuizMigration() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public String getLib() {
        return lib;
    }

    public void setLib(String lib) {
        this.lib = lib;
    }

    public String getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(String dateDebut) {
        this.dateDebut = dateDebut;
    }

    public String getDateFin() {
        return dateFin;
    }

    public void setDateFin(String dateFin) {
        this.dateFin = dateFin;
    }

    public List<QuestionMigration> getQuestions() {
        return questions;
    }

    public void setQuestions(List<QuestionMigration> questions) {
        this.questions = questions;
    }

    public SectionMigration getSection() {
        return section;
    }

    public void setSection(SectionMigration section) {
        this.section = section;
    }

    public Long getNumero() {
        return numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    public Long getSeuilReussite() {
        return seuilReussite;
    }

    public void setSeuilReussite(Long seuilReussite) {
        this.seuilReussite = seuilReussite;
    }
}
