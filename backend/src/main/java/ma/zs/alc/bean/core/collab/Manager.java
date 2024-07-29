package ma.zs.alc.bean.core.collab;


import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.security.bean.User;

import java.util.Objects;

@Entity
@Table(name = "manager")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Manager extends User {


    public Manager(String username) {
        super(username);
    }


    @Column(length = 500)
    private String description;
    private Collaborator collaborator;


    public Manager() {
        super();
    }

    public Manager(Long id) {
        this.id = id;
    }


    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Override
    public Long getId() {
        return this.id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "collaborator")
    public Collaborator getCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(Collaborator collaborator) {
        this.collaborator = collaborator;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Manager manager = (Manager) o;
        return id != null && id.equals(manager.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

