package  ma.zs.zyn.dao.specification.core.inscriptionref;

import ma.zs.zyn.dao.criteria.core.inscriptionref.LangueCriteria;
import ma.zs.zyn.bean.core.inscriptionref.Langue;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class LangueSpecification extends  AbstractSpecification<LangueCriteria, Langue>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("ref", criteria.getRef(),criteria.getRefLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public LangueSpecification(LangueCriteria criteria) {
        super(criteria);
    }

    public LangueSpecification(LangueCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
