package ma.zs.alc.bean.core.course;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;


@Entity
@Table(name = "parcours")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Parcours extends AuditBusinessObject {

    private Long id;

    private LocalDateTime datePublication;
    private LocalDateTime dateCreation;
    @Column(length = 500)
    private String description;
    @Column(length = 500)
    private String code;
    @Column(length = 500)
    private String url;
    @Column(length = 500)
    private String color;
    @Column(length = 500)
    private String libelle;
    private Integer numeroOrder = 0;
    private Integer nombreCours = 0;

    private Collaborator collaborator;

    private List<Cours> courss;

    public Parcours() {
        super();
    }

    public Parcours(Long id) {
        this.id = id;
    }

    public Parcours(Long id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public Parcours(String libelle) {
        this.libelle = libelle;
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

    public LocalDateTime getDatePublication() {
        return this.datePublication;
    }

    public void setDatePublication(LocalDateTime datePublication) {
        this.datePublication = datePublication;
    }

    public LocalDateTime getDateCreation() {
        return this.dateCreation;
    }

    public void setDateCreation(LocalDateTime dateCreation) {
        this.dateCreation = dateCreation;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getLibelle() {
        return this.libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Integer getNumeroOrder() {
        return this.numeroOrder;
    }

    public void setNumeroOrder(Integer numeroOrder) {
        this.numeroOrder = numeroOrder;
    }

    public Integer getNombreCours() {
        return this.nombreCours;
    }

    public void setNombreCours(Integer nombreCours) {
        this.nombreCours = nombreCours;
    }

    @OneToMany(mappedBy = "parcours")

    public List<Cours> getCourss() {
        return this.courss;
    }

    public void setCourss(List<Cours> courss) {
        this.courss = courss;
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
        label = libelle;
        return label;
    }

    public void increaseNreCourse() {
        this.nombreCours++;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Parcours parcours = (Parcours) o;
        return id != null && id.equals(parcours.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

