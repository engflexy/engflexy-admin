package ma.zs.alc.dao.specification.core.collab;

import ma.zs.alc.dao.criteria.core.collab.PackageCollaboratorCriteria;
import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class PackageCollaboratorSpecification extends  AbstractSpecification<PackageCollaboratorCriteria, PackageCollaborator>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicateBigDecimal("nbrStudentBase", criteria.getNbrStudentBase(), criteria.getNbrStudentBaseMin(), criteria.getNbrStudentBaseMax());
        addPredicateBigDecimal("priceBase", criteria.getPriceBase(), criteria.getPriceBaseMin(), criteria.getPriceBaseMax());
        addPredicateBigDecimal("priceBaseOld", criteria.getPriceBaseOld(), criteria.getPriceBaseOldMin(), criteria.getPriceBaseOldMax());
        addPredicateBigDecimal("priceLogo", criteria.getPriceLogo(), criteria.getPriceLogoMin(), criteria.getPriceLogoMax());
        addPredicateBigDecimal("priceLogoOld", criteria.getPriceLogoOld(), criteria.getPriceLogoOldMin(), criteria.getPriceLogoOldMax());
        addPredicateBigDecimal("priceColor", criteria.getPriceColor(), criteria.getPriceColorMin(), criteria.getPriceColorMax());
        addPredicateBigDecimal("priceColorOld", criteria.getPriceColorOld(), criteria.getPriceColorOldMin(), criteria.getPriceColorOldMax());
        addPredicateBigDecimal("priceBannerAd", criteria.getPriceBannerAd(), criteria.getPriceBannerAdMin(), criteria.getPriceBannerAdMax());
        addPredicateBigDecimal("priceBannerAdOld", criteria.getPriceBannerAdOld(), criteria.getPriceBannerAdOldMin(), criteria.getPriceBannerAdOldMax());
    }

    public PackageCollaboratorSpecification(PackageCollaboratorCriteria criteria) {
        super(criteria);
    }

    public PackageCollaboratorSpecification(PackageCollaboratorCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
