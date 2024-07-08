package ma.zs.alc.bean.core.faq;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.util.Objects;


@Entity
@Table(name = "faq")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Faq extends AuditBusinessObject {

    private Long id;

    @Column(length = 500)
    private String question;
    @Column(columnDefinition = "TEXT")
    private String answer;

    private FaqType faqType;


    public Faq() {
        super();
    }

    public Faq(Long id) {
        this.id = id;
    }

    public Faq(Long id, String answer) {
        this.id = id;
        this.answer = answer;
    }

    public Faq(String answer) {
        this.answer = answer;
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

    public String getQuestion() {
        return this.question;
    }

    public void setQuestion(String description) {
        this.question = description;
    }

    public String getAnswer() {
        return this.answer;
    }

    public void setAnswer(String libelle) {
        this.answer = libelle;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "faq_type")
    public FaqType getFaqType() {
        return this.faqType;
    }

    public void setFaqType(FaqType faqType) {
        this.faqType = faqType;
    }

    @Transient
    public String getLabel() {
        label = answer;
        return label;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Faq faq = (Faq) o;
        return id != null && id.equals(faq.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

