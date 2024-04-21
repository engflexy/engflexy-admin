package  ma.zs.zyn.dao.specification.core.courseref;

import ma.zs.zyn.dao.criteria.core.courseref.CentreCriteria;
import ma.zs.zyn.bean.core.courseref.Centre;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class CentreSpecification extends  AbstractSpecification<CentreCriteria, Centre>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("ref", criteria.getRef(),criteria.getRefLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicate("description", criteria.getDescription(),criteria.getDescriptionLike());
        addPredicate("log", criteria.getLog(),criteria.getLogLike());
        addPredicate("password", criteria.getPassword(),criteria.getPasswordLike());
    }

    public CentreSpecification(CentreCriteria criteria) {
        super(criteria);
    }

    public CentreSpecification(CentreCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
