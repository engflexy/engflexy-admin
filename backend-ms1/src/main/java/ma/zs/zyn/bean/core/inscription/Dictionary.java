package ma.zs.zyn.bean.core.inscription;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.zyn.zynerator.audit.AuditBusinessObject;

import java.util.Date;
import java.util.Objects;


@Entity
@Table(name = "dictionary")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Dictionary extends AuditBusinessObject {

    private Long id;

    @Column(length = 500)
    private String word;
    @Column(length = 500)
    private String definition;
    @Column(columnDefinition = "boolean default false")
    private Boolean learned = false;

    private Etudiant etudiant;


    public Dictionary() {
        super();
    }

    public Dictionary(Long id) {
        this.id = id;
    }

    public Dictionary(Long id, String word) {
        this.id = id;
        this.word = word;
    }

    public Dictionary(String word) {
        this.word = word;
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

    public String getWord() {
        return this.word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getDefinition() {
        return this.definition;
    }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "etudiant")
    public Etudiant getEtudiant() {
        return this.etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public Boolean getLearned() {
        return this.learned;
    }

    public void setLearned(Boolean learned) {
        this.learned = learned;
    }


    @Transient
    public String getLabel() {
        label = word;
        return label;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Dictionary dictionary = (Dictionary) o;
        return id != null && id.equals(dictionary.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

