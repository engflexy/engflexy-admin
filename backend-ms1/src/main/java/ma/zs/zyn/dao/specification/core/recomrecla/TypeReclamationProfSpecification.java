package  ma.zs.zyn.dao.specification.core.recomrecla;

import ma.zs.zyn.dao.criteria.core.recomrecla.TypeReclamationProfCriteria;
import ma.zs.zyn.bean.core.recomrecla.TypeReclamationProf;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class TypeReclamationProfSpecification extends  AbstractSpecification<TypeReclamationProfCriteria, TypeReclamationProf>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public TypeReclamationProfSpecification(TypeReclamationProfCriteria criteria) {
        super(criteria);
    }

    public TypeReclamationProfSpecification(TypeReclamationProfCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
