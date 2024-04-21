package  ma.zs.zyn.dao.specification.core.common;

import ma.zs.zyn.dao.criteria.core.common.ClassAverageBonusCriteria;
import ma.zs.zyn.bean.core.common.ClassAverageBonus;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class ClassAverageBonusSpecification extends  AbstractSpecification<ClassAverageBonusCriteria, ClassAverageBonus>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicateInt("nombreSession", criteria.getNombreSession(), criteria.getNombreSessionMin(), criteria.getNombreSessionMax());
        addPredicateBigDecimal("prix", criteria.getPrix(), criteria.getPrixMin(), criteria.getPrixMax());
    }

    public ClassAverageBonusSpecification(ClassAverageBonusCriteria criteria) {
        super(criteria);
    }

    public ClassAverageBonusSpecification(ClassAverageBonusCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
