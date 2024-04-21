package  ma.zs.zyn.dao.specification.core.grpe;

import ma.zs.zyn.dao.criteria.core.grpe.GroupeEtatCriteria;
import ma.zs.zyn.bean.core.grpe.GroupeEtat;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class GroupeEtatSpecification extends  AbstractSpecification<GroupeEtatCriteria, GroupeEtat>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public GroupeEtatSpecification(GroupeEtatCriteria criteria) {
        super(criteria);
    }

    public GroupeEtatSpecification(GroupeEtatCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
