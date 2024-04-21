package  ma.zs.zyn.dao.specification.core.inscriptionref;

import ma.zs.zyn.dao.criteria.core.inscriptionref.TeacherLocalityCriteria;
import ma.zs.zyn.bean.core.inscriptionref.TeacherLocality;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class TeacherLocalitySpecification extends  AbstractSpecification<TeacherLocalityCriteria, TeacherLocality>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public TeacherLocalitySpecification(TeacherLocalityCriteria criteria) {
        super(criteria);
    }

    public TeacherLocalitySpecification(TeacherLocalityCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
