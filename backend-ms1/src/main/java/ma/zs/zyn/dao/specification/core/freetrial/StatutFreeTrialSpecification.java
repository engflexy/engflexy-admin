package  ma.zs.zyn.dao.specification.core.freetrial;

import ma.zs.zyn.dao.criteria.core.freetrial.StatutFreeTrialCriteria;
import ma.zs.zyn.bean.core.freetrial.StatutFreeTrial;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class StatutFreeTrialSpecification extends  AbstractSpecification<StatutFreeTrialCriteria, StatutFreeTrial>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("style", criteria.getStyle(),criteria.getStyleLike());
    }

    public StatutFreeTrialSpecification(StatutFreeTrialCriteria criteria) {
        super(criteria);
    }

    public StatutFreeTrialSpecification(StatutFreeTrialCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
