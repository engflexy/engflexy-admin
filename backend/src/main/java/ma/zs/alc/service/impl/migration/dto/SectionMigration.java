package ma.zs.alc.service.impl.migration.dto;

import java.util.List;
import java.util.Objects;


public class SectionMigration {

    private Long id;
    private String code;

    private String libelle;
    private String urlImage;
    private String urlImage2;
    private String urlImage3;
    private String urlVideo;
    private String contenu;
    private String questions;
    private String indicationProf;
    private Integer numeroOrder;
    private CategorieSectionMigration categorieSection;
    private CoursMigration cours;
    private int url;
    private int content;
    private List<SectionItemMigration> sectionItems;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getUrlImage2() {
        return urlImage2;
    }

    public void setUrlImage2(String urlImage2) {
        this.urlImage2 = urlImage2;
    }

    public String getUrlImage3() {
        return urlImage3;
    }

    public void setUrlImage3(String urlImage3) {
        this.urlImage3 = urlImage3;
    }

    public String getUrlVideo() {
        return urlVideo;
    }

    public void setUrlVideo(String urlVideo) {
        this.urlVideo = urlVideo;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public String getQuestions() {
        return questions;
    }

    public void setQuestions(String questions) {
        this.questions = questions;
    }

    public String getIndicationProf() {
        return indicationProf;
    }

    public void setIndicationProf(String indicationProf) {
        this.indicationProf = indicationProf;
    }

    public Integer getNumeroOrder() {
        return numeroOrder;
    }

    public void setNumeroOrder(Integer numeroOrder) {
        this.numeroOrder = numeroOrder;
    }

    public CategorieSectionMigration getCategorieSection() {
        return categorieSection;
    }

    public void setCategorieSection(CategorieSectionMigration categorieSectionMigration) {
        this.categorieSection = categorieSectionMigration;
    }

    public CoursMigration getCours() {
        return cours;
    }

    public void setCours(CoursMigration coursMigration) {
        this.cours = coursMigration;
    }

    public int getUrl() {
        return url;
    }

    public void setUrl(int url) {
        this.url = url;
    }

    public int getContent() {
        return content;
    }

    public void setContent(int content) {
        this.content = content;
    }

    public List<SectionItemMigration> getSectionItems() {
        return sectionItems;
    }

    public void setSectionItems(List<SectionItemMigration> sectionItemMigrations) {
        this.sectionItems = sectionItemMigrations;
    }

    @Override
    public String toString() {
        return "Section{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", libelle='" + libelle + '\'' +
                ", urlImage='" + urlImage + '\'' +
                ", urlImage2='" + urlImage2 + '\'' +
                ", urlImage3='" + urlImage3 + '\'' +
                ", urlVideo='" + urlVideo + '\'' +
                ", contenu='" + contenu + '\'' +
                ", questions='" + questions + '\'' +
                ", indicationProf='" + indicationProf + '\'' +
                ", numeroOrder=" + numeroOrder +
                ", categorieSection=" + categorieSection +
                ", cours=" + cours +
                ", url=" + url +
                ", content=" + content +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SectionMigration sectionMigration = (SectionMigration) o;
        return url == sectionMigration.url && content == sectionMigration.content && Objects.equals(id, sectionMigration.id) && Objects.equals(code, sectionMigration.code) && Objects.equals(libelle, sectionMigration.libelle) && Objects.equals(urlImage, sectionMigration.urlImage) && Objects.equals(urlImage2, sectionMigration.urlImage2) && Objects.equals(urlImage3, sectionMigration.urlImage3) && Objects.equals(urlVideo, sectionMigration.urlVideo) && Objects.equals(contenu, sectionMigration.contenu) && Objects.equals(questions, sectionMigration.questions) && Objects.equals(indicationProf, sectionMigration.indicationProf) && Objects.equals(numeroOrder, sectionMigration.numeroOrder) && Objects.equals(categorieSection, sectionMigration.categorieSection) && Objects.equals(cours, sectionMigration.cours) && Objects.equals(sectionItems, sectionMigration.sectionItems);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, code, libelle, urlImage, urlImage2, urlImage3, urlVideo, contenu, questions, indicationProf, numeroOrder, categorieSection, cours, url, content, sectionItems);
    }
}
