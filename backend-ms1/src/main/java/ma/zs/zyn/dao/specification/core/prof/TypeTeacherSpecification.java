package  ma.zs.zyn.dao.specification.core.prof;

import ma.zs.zyn.dao.criteria.core.prof.TypeTeacherCriteria;
import ma.zs.zyn.bean.core.prof.TypeTeacher;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class TypeTeacherSpecification extends  AbstractSpecification<TypeTeacherCriteria, TypeTeacher>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
    }

    public TypeTeacherSpecification(TypeTeacherCriteria criteria) {
        super(criteria);
    }

    public TypeTeacherSpecification(TypeTeacherCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
