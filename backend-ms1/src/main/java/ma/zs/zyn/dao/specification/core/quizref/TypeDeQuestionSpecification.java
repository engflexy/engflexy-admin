package  ma.zs.zyn.dao.specification.core.quizref;

import ma.zs.zyn.dao.criteria.core.quizref.TypeDeQuestionCriteria;
import ma.zs.zyn.bean.core.quizref.TypeDeQuestion;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class TypeDeQuestionSpecification extends  AbstractSpecification<TypeDeQuestionCriteria, TypeDeQuestion>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("ref", criteria.getRef(),criteria.getRefLike());
        addPredicate("lib", criteria.getLib(),criteria.getLibLike());
    }

    public TypeDeQuestionSpecification(TypeDeQuestionCriteria criteria) {
        super(criteria);
    }

    public TypeDeQuestionSpecification(TypeDeQuestionCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
