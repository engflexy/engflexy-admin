package ma.zs.alc.dao.criteria.core.collab;


import ma.zs.alc.dao.criteria.core.vocab.CollaboratorCriteria;
import ma.zs.alc.zynerator.criteria.BaseCriteria;

import java.time.LocalDateTime;
import java.util.List;

public class InscriptionCollaboratorCriteria extends BaseCriteria {

    private String price;
    private String priceMin;
    private String priceMax;
    private String nbrStudent;
    private String nbrStudentMin;
    private String nbrStudentMax;
    private Boolean logo;
    private Boolean color;
    private Boolean bannerAd;
    private LocalDateTime startDate;
    private LocalDateTime startDateFrom;
    private LocalDateTime startDateTo;
    private LocalDateTime endDate;
    private LocalDateTime endDateFrom;
    private LocalDateTime endDateTo;

    private PackageCollaboratorCriteria packageCollaborator;
    private List<PackageCollaboratorCriteria> packageCollaborators;
    private CollaboratorCriteria collaborator;
    private List<CollaboratorCriteria> collaborators;
    private InscriptionCollaboratorStateCriteria inscriptionCollaboratorState;
    private List<InscriptionCollaboratorStateCriteria> inscriptionCollaboratorStates;


    public InscriptionCollaboratorCriteria() {
    }

    public String getPrice() {
        return this.price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPriceMin() {
        return this.priceMin;
    }

    public void setPriceMin(String priceMin) {
        this.priceMin = priceMin;
    }

    public String getPriceMax() {
        return this.priceMax;
    }

    public void setPriceMax(String priceMax) {
        this.priceMax = priceMax;
    }

    public String getNbrStudent() {
        return this.nbrStudent;
    }

    public void setNbrStudent(String nbrStudent) {
        this.nbrStudent = nbrStudent;
    }

    public String getNbrStudentMin() {
        return this.nbrStudentMin;
    }

    public void setNbrStudentMin(String nbrStudentMin) {
        this.nbrStudentMin = nbrStudentMin;
    }

    public String getNbrStudentMax() {
        return this.nbrStudentMax;
    }

    public void setNbrStudentMax(String nbrStudentMax) {
        this.nbrStudentMax = nbrStudentMax;
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

    public LocalDateTime getStartDate() {
        return this.startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getStartDateFrom() {
        return this.startDateFrom;
    }

    public void setStartDateFrom(LocalDateTime startDateFrom) {
        this.startDateFrom = startDateFrom;
    }

    public LocalDateTime getStartDateTo() {
        return this.startDateTo;
    }

    public void setStartDateTo(LocalDateTime startDateTo) {
        this.startDateTo = startDateTo;
    }

    public LocalDateTime getEndDate() {
        return this.endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public LocalDateTime getEndDateFrom() {
        return this.endDateFrom;
    }

    public void setEndDateFrom(LocalDateTime endDateFrom) {
        this.endDateFrom = endDateFrom;
    }

    public LocalDateTime getEndDateTo() {
        return this.endDateTo;
    }

    public void setEndDateTo(LocalDateTime endDateTo) {
        this.endDateTo = endDateTo;
    }

    public PackageCollaboratorCriteria getPackageCollaborator() {
        return this.packageCollaborator;
    }

    public void setPackageCollaborator(PackageCollaboratorCriteria packageCollaborator) {
        this.packageCollaborator = packageCollaborator;
    }

    public List<PackageCollaboratorCriteria> getPackageCollaborators() {
        return this.packageCollaborators;
    }

    public void setPackageCollaborators(List<PackageCollaboratorCriteria> packageCollaborators) {
        this.packageCollaborators = packageCollaborators;
    }

    public CollaboratorCriteria getCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(CollaboratorCriteria collaborator) {
        this.collaborator = collaborator;
    }

    public List<CollaboratorCriteria> getCollaborators() {
        return this.collaborators;
    }

    public void setCollaborators(List<CollaboratorCriteria> collaborators) {
        this.collaborators = collaborators;
    }

    public InscriptionCollaboratorStateCriteria getInscriptionCollaboratorState() {
        return this.inscriptionCollaboratorState;
    }

    public void setInscriptionCollaboratorState(InscriptionCollaboratorStateCriteria inscriptionCollaboratorState) {
        this.inscriptionCollaboratorState = inscriptionCollaboratorState;
    }

    public List<InscriptionCollaboratorStateCriteria> getInscriptionCollaboratorStates() {
        return this.inscriptionCollaboratorStates;
    }

    public void setInscriptionCollaboratorStates(List<InscriptionCollaboratorStateCriteria> inscriptionCollaboratorStates) {
        this.inscriptionCollaboratorStates = inscriptionCollaboratorStates;
    }
}
