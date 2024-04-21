package  ma.zs.zyn.dao.specification.core.freetrial;

import ma.zs.zyn.dao.criteria.core.freetrial.ServicesCriteria;
import ma.zs.zyn.bean.core.freetrial.Services;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class ServicesSpecification extends  AbstractSpecification<ServicesCriteria, Services>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public ServicesSpecification(ServicesCriteria criteria) {
        super(criteria);
    }

    public ServicesSpecification(ServicesCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
