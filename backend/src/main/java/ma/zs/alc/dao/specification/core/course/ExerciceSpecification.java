package  ma.zs.alc.dao.specification.core.course;

import ma.zs.alc.dao.criteria.core.course.ExerciceCriteria;
import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class ExerciceSpecification extends  AbstractSpecification<ExerciceCriteria, Exercice>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicateLong("numero", criteria.getNumero(), criteria.getNumeroMin(), criteria.getNumeroMax());
        addPredicateFk("contentType","id", criteria.getContentType()==null?null:criteria.getContentType().getId());
        addPredicateFk("contentType","id", criteria.getContentTypes());
        addPredicateFk("contentType","code", criteria.getContentType()==null?null:criteria.getContentType().getCode());
        addPredicateFk("section","id", criteria.getSection()==null?null:criteria.getSection().getId());
        addPredicateFk("section","id", criteria.getSections());
        addPredicateFk("section","code", criteria.getSection()==null?null:criteria.getSection().getCode());
    }

    public ExerciceSpecification(ExerciceCriteria criteria) {
        super(criteria);
    }

    public ExerciceSpecification(ExerciceCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
