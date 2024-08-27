package ma.zs.alc.service.impl.migration.dto;


public class ReponseMigration {
    private Long id;
    private String ref;
    private String lib;
    private String etatReponse;
    private Long numero;
    private QuestionMigration question;

    public ReponseMigration() {
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

    public String getEtatReponse() {
        return etatReponse;
    }

    public void setEtatReponse(String etatReponse) {
        this.etatReponse = etatReponse;
    }

    public Long getNumero() {
        return numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    public QuestionMigration getQuestion() {
        return question;
    }

    public void setQuestion(QuestionMigration question) {
        this.question = question;
    }
}
