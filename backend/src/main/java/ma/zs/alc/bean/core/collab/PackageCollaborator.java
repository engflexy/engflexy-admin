package ma.zs.alc.bean.core.collab;


import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import ma.zs.alc.zynerator.audit.AuditBusinessObject;

import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "package_collaborator")
@JsonInclude(JsonInclude.Include.NON_NULL)

public class PackageCollaborator extends AuditBusinessObject {


    @Column(length = 500)
    private String libelle;

    private BigDecimal nbrStudentBase = BigDecimal.ZERO;

    private BigDecimal priceBase = BigDecimal.ZERO;

    private BigDecimal priceBaseOld = BigDecimal.ZERO;

    private BigDecimal priceLogo = BigDecimal.ZERO;

    private BigDecimal priceLogoOld = BigDecimal.ZERO;

    private BigDecimal priceColor = BigDecimal.ZERO;

    private BigDecimal priceColorOld = BigDecimal.ZERO;

    private BigDecimal priceBannerAd = BigDecimal.ZERO;

    private BigDecimal priceBannerAdOld = BigDecimal.ZERO;


    public PackageCollaborator() {
        super();
    }

    public PackageCollaborator(Long id) {
        this.id = id;
    }

    public PackageCollaborator(Long id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public PackageCollaborator(String libelle) {
        this.libelle = libelle;
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

    public String getLibelle() {
        return this.libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public BigDecimal getNbrStudentBase() {
        return this.nbrStudentBase;
    }

    public void setNbrStudentBase(BigDecimal nbrStudentBase) {
        this.nbrStudentBase = nbrStudentBase;
    }

    public BigDecimal getPriceBase() {
        return this.priceBase;
    }

    public void setPriceBase(BigDecimal priceBase) {
        this.priceBase = priceBase;
    }

    public BigDecimal getPriceBaseOld() {
        return this.priceBaseOld;
    }

    public void setPriceBaseOld(BigDecimal priceBaseOld) {
        this.priceBaseOld = priceBaseOld;
    }

    public BigDecimal getPriceLogo() {
        return this.priceLogo;
    }

    public void setPriceLogo(BigDecimal priceLogo) {
        this.priceLogo = priceLogo;
    }

    public BigDecimal getPriceLogoOld() {
        return this.priceLogoOld;
    }

    public void setPriceLogoOld(BigDecimal priceLogoOld) {
        this.priceLogoOld = priceLogoOld;
    }

    public BigDecimal getPriceColor() {
        return this.priceColor;
    }

    public void setPriceColor(BigDecimal priceColor) {
        this.priceColor = priceColor;
    }

    public BigDecimal getPriceColorOld() {
        return this.priceColorOld;
    }

    public void setPriceColorOld(BigDecimal priceColorOld) {
        this.priceColorOld = priceColorOld;
    }

    public BigDecimal getPriceBannerAd() {
        return this.priceBannerAd;
    }

    public void setPriceBannerAd(BigDecimal priceBannerAd) {
        this.priceBannerAd = priceBannerAd;
    }

    public BigDecimal getPriceBannerAdOld() {
        return this.priceBannerAdOld;
    }

    public void setPriceBannerAdOld(BigDecimal priceBannerAdOld) {
        this.priceBannerAdOld = priceBannerAdOld;
    }

    @Transient
    public String getLabel() {
        label = libelle;
        return label;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PackageCollaborator packageCollaborator = (PackageCollaborator) o;
        return id != null && id.equals(packageCollaborator.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

