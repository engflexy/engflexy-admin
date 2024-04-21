package  ma.zs.zyn.dao.specification.core.grpe;

import ma.zs.zyn.dao.criteria.core.grpe.GroupeTypeCriteria;
import ma.zs.zyn.bean.core.grpe.GroupeType;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class GroupeTypeSpecification extends  AbstractSpecification<GroupeTypeCriteria, GroupeType>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public GroupeTypeSpecification(GroupeTypeCriteria criteria) {
        super(criteria);
    }

    public GroupeTypeSpecification(GroupeTypeCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
