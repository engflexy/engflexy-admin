package ma.zs.alc.ws.dto.collab;

import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.math.BigDecimal;




@JsonInclude(JsonInclude.Include.NON_NULL)
public class PackageCollaboratorDto  extends AuditBaseDto {

    private String libelle  ;
    private BigDecimal nbrStudentBase  ;
    private BigDecimal priceBase  ;
    private BigDecimal priceBaseOld  ;
    private BigDecimal priceLogo  ;
    private BigDecimal priceLogoOld  ;
    private BigDecimal priceColor  ;
    private BigDecimal priceColorOld  ;
    private BigDecimal priceBannerAd  ;
    private BigDecimal priceBannerAdOld  ;
    private CollaboratorDto collaborator ;




    public PackageCollaboratorDto(){
        super();
    }



    @Log
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }

    @Log
    public BigDecimal getNbrStudentBase(){
        return this.nbrStudentBase;
    }
    public void setNbrStudentBase(BigDecimal nbrStudentBase){
        this.nbrStudentBase = nbrStudentBase;
    }

    @Log
    public BigDecimal getPriceBase(){
        return this.priceBase;
    }
    public void setPriceBase(BigDecimal priceBase){
        this.priceBase = priceBase;
    }

    @Log
    public BigDecimal getPriceBaseOld(){
        return this.priceBaseOld;
    }
    public void setPriceBaseOld(BigDecimal priceBaseOld){
        this.priceBaseOld = priceBaseOld;
    }

    @Log
    public BigDecimal getPriceLogo(){
        return this.priceLogo;
    }
    public void setPriceLogo(BigDecimal priceLogo){
        this.priceLogo = priceLogo;
    }

    @Log
    public BigDecimal getPriceLogoOld(){
        return this.priceLogoOld;
    }
    public void setPriceLogoOld(BigDecimal priceLogoOld){
        this.priceLogoOld = priceLogoOld;
    }

    @Log
    public BigDecimal getPriceColor(){
        return this.priceColor;
    }
    public void setPriceColor(BigDecimal priceColor){
        this.priceColor = priceColor;
    }

    @Log
    public BigDecimal getPriceColorOld(){
        return this.priceColorOld;
    }
    public void setPriceColorOld(BigDecimal priceColorOld){
        this.priceColorOld = priceColorOld;
    }

    @Log
    public BigDecimal getPriceBannerAd(){
        return this.priceBannerAd;
    }
    public void setPriceBannerAd(BigDecimal priceBannerAd){
        this.priceBannerAd = priceBannerAd;
    }

    @Log
    public BigDecimal getPriceBannerAdOld(){
        return this.priceBannerAdOld;
    }
    public void setPriceBannerAdOld(BigDecimal priceBannerAdOld){
        this.priceBannerAdOld = priceBannerAdOld;
    }

    public CollaboratorDto getCollaborator() {
        return collaborator;
    }

    public void setCollaborator(CollaboratorDto collaborator) {
        this.collaborator = collaborator;
    }






}
