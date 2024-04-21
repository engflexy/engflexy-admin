package  ma.zs.zyn.dao.specification.core.homework;

import ma.zs.zyn.dao.criteria.core.homework.TypeHomeWorkCriteria;
import ma.zs.zyn.bean.core.homework.TypeHomeWork;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class TypeHomeWorkSpecification extends  AbstractSpecification<TypeHomeWorkCriteria, TypeHomeWork>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("lib", criteria.getLib(),criteria.getLibLike());
    }

    public TypeHomeWorkSpecification(TypeHomeWorkCriteria criteria) {
        super(criteria);
    }

    public TypeHomeWorkSpecification(TypeHomeWorkCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
