package  ma.zs.zyn.dao.specification.core.faq;

import ma.zs.zyn.dao.criteria.core.faq.FaqTypeCriteria;
import ma.zs.zyn.bean.core.faq.FaqType;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class FaqTypeSpecification extends  AbstractSpecification<FaqTypeCriteria, FaqType>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public FaqTypeSpecification(FaqTypeCriteria criteria) {
        super(criteria);
    }

    public FaqTypeSpecification(FaqTypeCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
