package ma.zs.alc.bean.core.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.zynerator.security.bean.User;

import java.util.List;
import java.util.Objects;

@Entity
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Collaborator extends User {


    public Collaborator(String username) {
        super(username);
    }

    @Column(length = 500)
    private String libelle;
    @Column(length = 500)
    private String description;
    private TypeCollaborator typeCollaborator;

    private List<Parcours> parcourss;

    public Collaborator() {
        super();
    }

    public Collaborator(Long id) {
        this.id = id;
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

    public String getLibelle() {
        return this.libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "type_collaborator")
    public TypeCollaborator getTypeCollaborator() {
        return this.typeCollaborator;
    }

    public void setTypeCollaborator(TypeCollaborator typeCollaborator) {
        this.typeCollaborator = typeCollaborator;
    }

    @OneToMany(mappedBy = "collaborator")

    public List<Parcours> getParcourss() {
        return this.parcourss;
    }

    public void setParcourss(List<Parcours> parcourss) {
        this.parcourss = parcourss;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Collaborator collaborator = (Collaborator) o;
        return id != null && id.equals(collaborator.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

