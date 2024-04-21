package  ma.zs.zyn.dao.specification.core.faq;

import ma.zs.zyn.dao.criteria.core.faq.FaqCriteria;
import ma.zs.zyn.bean.core.faq.Faq;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class FaqSpecification extends  AbstractSpecification<FaqCriteria, Faq>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicateFk("faqType","id", criteria.getFaqType()==null?null:criteria.getFaqType().getId());
        addPredicateFk("faqType","id", criteria.getFaqTypes());
    }

    public FaqSpecification(FaqCriteria criteria) {
        super(criteria);
    }

    public FaqSpecification(FaqCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
