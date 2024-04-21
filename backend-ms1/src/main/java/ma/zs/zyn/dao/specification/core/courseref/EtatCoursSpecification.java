package  ma.zs.zyn.dao.specification.core.courseref;

import ma.zs.zyn.dao.criteria.core.courseref.EtatCoursCriteria;
import ma.zs.zyn.bean.core.courseref.EtatCours;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class EtatCoursSpecification extends  AbstractSpecification<EtatCoursCriteria, EtatCours>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public EtatCoursSpecification(EtatCoursCriteria criteria) {
        super(criteria);
    }

    public EtatCoursSpecification(EtatCoursCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
