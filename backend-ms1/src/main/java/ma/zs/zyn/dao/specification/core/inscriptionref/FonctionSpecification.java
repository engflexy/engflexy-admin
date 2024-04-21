package  ma.zs.zyn.dao.specification.core.inscriptionref;

import ma.zs.zyn.dao.criteria.core.inscriptionref.FonctionCriteria;
import ma.zs.zyn.bean.core.inscriptionref.Fonction;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class FonctionSpecification extends  AbstractSpecification<FonctionCriteria, Fonction>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public FonctionSpecification(FonctionCriteria criteria) {
        super(criteria);
    }

    public FonctionSpecification(FonctionCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
