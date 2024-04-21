package  ma.zs.zyn.dao.specification.core.prof;

import ma.zs.zyn.dao.criteria.core.prof.CategorieProfCriteria;
import ma.zs.zyn.bean.core.prof.CategorieProf;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class CategorieProfSpecification extends  AbstractSpecification<CategorieProfCriteria, CategorieProf>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("level", criteria.getLevel(),criteria.getLevelLike());
        addPredicateBigDecimal("lessonRate", criteria.getLessonRate(), criteria.getLessonRateMin(), criteria.getLessonRateMax());
    }

    public CategorieProfSpecification(CategorieProfCriteria criteria) {
        super(criteria);
    }

    public CategorieProfSpecification(CategorieProfCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
