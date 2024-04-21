package  ma.zs.zyn.dao.specification.core.inscriptionref;

import ma.zs.zyn.dao.criteria.core.inscriptionref.InteretEtudiantCriteria;
import ma.zs.zyn.bean.core.inscriptionref.InteretEtudiant;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class InteretEtudiantSpecification extends  AbstractSpecification<InteretEtudiantCriteria, InteretEtudiant>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public InteretEtudiantSpecification(InteretEtudiantCriteria criteria) {
        super(criteria);
    }

    public InteretEtudiantSpecification(InteretEtudiantCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
