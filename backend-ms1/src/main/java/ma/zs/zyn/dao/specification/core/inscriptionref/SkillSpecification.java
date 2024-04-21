package  ma.zs.zyn.dao.specification.core.inscriptionref;

import ma.zs.zyn.dao.criteria.core.inscriptionref.SkillCriteria;
import ma.zs.zyn.bean.core.inscriptionref.Skill;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class SkillSpecification extends  AbstractSpecification<SkillCriteria, Skill>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public SkillSpecification(SkillCriteria criteria) {
        super(criteria);
    }

    public SkillSpecification(SkillCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
