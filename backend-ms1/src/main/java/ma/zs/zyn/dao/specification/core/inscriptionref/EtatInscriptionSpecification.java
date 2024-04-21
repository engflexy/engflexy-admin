package  ma.zs.zyn.dao.specification.core.inscriptionref;

import ma.zs.zyn.dao.criteria.core.inscriptionref.EtatInscriptionCriteria;
import ma.zs.zyn.bean.core.inscriptionref.EtatInscription;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class EtatInscriptionSpecification extends  AbstractSpecification<EtatInscriptionCriteria, EtatInscription>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("ref", criteria.getRef(),criteria.getRefLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public EtatInscriptionSpecification(EtatInscriptionCriteria criteria) {
        super(criteria);
    }

    public EtatInscriptionSpecification(EtatInscriptionCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
