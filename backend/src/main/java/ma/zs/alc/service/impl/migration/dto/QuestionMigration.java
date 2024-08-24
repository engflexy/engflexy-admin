package ma.zs.alc.service.impl.migration.dto;

import java.util.List;


public class QuestionMigration {
    private Long id;
    private String ref;
    private String libelle;
    private String urlImg;
    private String urlVideo;
    private Long numero;
    private double pointReponseJuste = 1;
    private double pointReponsefausse = 0;

    private TypeDeQuestionMigration typeDeQuestion;

    private List<ReponseMigration> reponses;

    public QuestionMigration() {
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

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    public String getUrlVideo() {
        return urlVideo;
    }

    public void setUrlVideo(String urlVideo) {
        this.urlVideo = urlVideo;
    }

    public Long getNumero() {
        return numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    public double getPointReponseJuste() {
        return pointReponseJuste;
    }

    public void setPointReponseJuste(double pointReponseJuste) {
        this.pointReponseJuste = pointReponseJuste;
    }

    public double getPointReponsefausse() {
        return pointReponsefausse;
    }

    public void setPointReponsefausse(double pointReponsefausse) {
        this.pointReponsefausse = pointReponsefausse;
    }

    public TypeDeQuestionMigration getTypeDeQuestion() {
        return typeDeQuestion;
    }

    public void setTypeDeQuestion(TypeDeQuestionMigration typeDeQuestion) {
        this.typeDeQuestion = typeDeQuestion;
    }


    public List<ReponseMigration> getReponses() {
        return reponses;
    }

    public void setReponses(List<ReponseMigration> reponses) {
        this.reponses = reponses;
    }
}