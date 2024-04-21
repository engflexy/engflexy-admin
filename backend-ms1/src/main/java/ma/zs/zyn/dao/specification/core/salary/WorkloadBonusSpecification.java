package  ma.zs.zyn.dao.specification.core.salary;

import ma.zs.zyn.dao.criteria.core.salary.WorkloadBonusCriteria;
import ma.zs.zyn.bean.core.salary.WorkloadBonus;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class WorkloadBonusSpecification extends  AbstractSpecification<WorkloadBonusCriteria, WorkloadBonus>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicateInt("nombreSession", criteria.getNombreSession(), criteria.getNombreSessionMin(), criteria.getNombreSessionMax());
        addPredicateBigDecimal("prix", criteria.getPrix(), criteria.getPrixMin(), criteria.getPrixMax());
    }

    public WorkloadBonusSpecification(WorkloadBonusCriteria criteria) {
        super(criteria);
    }

    public WorkloadBonusSpecification(WorkloadBonusCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
