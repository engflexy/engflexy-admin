package ma.zs.alc.bean.core.collab;


import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table(name = "inscription_collaborator")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class InscriptionCollaborator extends AuditBusinessObject {


    private BigDecimal price = BigDecimal.ZERO;

    private BigDecimal nbrStudent = BigDecimal.ZERO;

    @Column(columnDefinition = "boolean default false")
    private Boolean logo = false;

    @Column(columnDefinition = "boolean default false")
    private Boolean color = false;

    @Column(columnDefinition = "boolean default false")
    private Boolean bannerAd = false;

    private LocalDateTime startDate;

    private LocalDateTime endDate;

    private PackageCollaborator packageCollaborator;
    private Collaborator collaborator;
    private InscriptionCollaboratorState inscriptionCollaboratorState;


    public InscriptionCollaborator() {
        super();
    }

    public InscriptionCollaborator(Long id) {
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "package_collaborator")
    public PackageCollaborator getPackageCollaborator() {
        return this.packageCollaborator;
    }

    public void setPackageCollaborator(PackageCollaborator packageCollaborator) {
        this.packageCollaborator = packageCollaborator;
    }

    public BigDecimal getPrice() {
        return this.price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getNbrStudent() {
        return this.nbrStudent;
    }

    public void setNbrStudent(BigDecimal nbrStudent) {
        this.nbrStudent = nbrStudent;
    }

    public Boolean getLogo() {
        return this.logo;
    }

    public void setLogo(Boolean logo) {
        this.logo = logo;
    }

    public Boolean getColor() {
        return this.color;
    }

    public void setColor(Boolean color) {
        this.color = color;
    }

    public Boolean getBannerAd() {
        return this.bannerAd;
    }

    public void setBannerAd(Boolean bannerAd) {
        this.bannerAd = bannerAd;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "collaborator")
    public Collaborator getCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(Collaborator collaborator) {
        this.collaborator = collaborator;
    }

    public LocalDateTime getStartDate() {
        return this.startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return this.endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inscription_collaborator_state")
    public InscriptionCollaboratorState getInscriptionCollaboratorState() {
        return this.inscriptionCollaboratorState;
    }

    public void setInscriptionCollaboratorState(InscriptionCollaboratorState inscriptionCollaboratorState) {
        this.inscriptionCollaboratorState = inscriptionCollaboratorState;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        InscriptionCollaborator inscriptionCollaborator = (InscriptionCollaborator) o;
        return id != null && id.equals(inscriptionCollaborator.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

