package  ma.zs.zyn.dao.specification.core.courseref;

import ma.zs.zyn.dao.criteria.core.courseref.LevelTestConfigurationCriteria;
import ma.zs.zyn.bean.core.courseref.LevelTestConfiguration;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class LevelTestConfigurationSpecification extends  AbstractSpecification<LevelTestConfigurationCriteria, LevelTestConfiguration>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicateBigDecimal("noteMin", criteria.getNoteMin(), criteria.getNoteMinMin(), criteria.getNoteMinMax());
        addPredicateBigDecimal("noteMax", criteria.getNoteMax(), criteria.getNoteMaxMin(), criteria.getNoteMaxMax());
        addPredicateFk("parcours","id", criteria.getParcours()==null?null:criteria.getParcours().getId());
        addPredicateFk("parcours","id", criteria.getParcourss());
        addPredicateFk("parcours","code", criteria.getParcours()==null?null:criteria.getParcours().getCode());
    }

    public LevelTestConfigurationSpecification(LevelTestConfigurationCriteria criteria) {
        super(criteria);
    }

    public LevelTestConfigurationSpecification(LevelTestConfigurationCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
