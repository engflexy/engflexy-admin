package ma.zs.alc.dao.specification.core.collab;

import ma.zs.alc.dao.criteria.core.collab.TypeCollaboratorCriteria;
import ma.zs.alc.bean.core.collab.TypeCollaborator;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class TypeCollaboratorSpecification extends  AbstractSpecification<TypeCollaboratorCriteria, TypeCollaborator>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
    }

    public TypeCollaboratorSpecification(TypeCollaboratorCriteria criteria) {
        super(criteria);
    }

    public TypeCollaboratorSpecification(TypeCollaboratorCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
