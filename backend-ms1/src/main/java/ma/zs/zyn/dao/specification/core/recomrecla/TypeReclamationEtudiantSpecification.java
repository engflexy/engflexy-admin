package  ma.zs.zyn.dao.specification.core.recomrecla;

import ma.zs.zyn.dao.criteria.core.recomrecla.TypeReclamationEtudiantCriteria;
import ma.zs.zyn.bean.core.recomrecla.TypeReclamationEtudiant;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class TypeReclamationEtudiantSpecification extends  AbstractSpecification<TypeReclamationEtudiantCriteria, TypeReclamationEtudiant>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public TypeReclamationEtudiantSpecification(TypeReclamationEtudiantCriteria criteria) {
        super(criteria);
    }

    public TypeReclamationEtudiantSpecification(TypeReclamationEtudiantCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
