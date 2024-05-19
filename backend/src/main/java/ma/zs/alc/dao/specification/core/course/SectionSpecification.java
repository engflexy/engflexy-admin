package  ma.zs.alc.dao.specification.core.course;

import ma.zs.alc.dao.criteria.core.course.SectionCriteria;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class SectionSpecification extends  AbstractSpecification<SectionCriteria, Section>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicateFk("cours","id", criteria.getCours()==null?null:criteria.getCours().getId());
        addPredicateFk("cours","id", criteria.getCourss());
        addPredicateFk("cours","code", criteria.getCours()==null?null:criteria.getCours().getCode());
    }

    public SectionSpecification(SectionCriteria criteria) {
        super(criteria);
    }

    public SectionSpecification(SectionCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
