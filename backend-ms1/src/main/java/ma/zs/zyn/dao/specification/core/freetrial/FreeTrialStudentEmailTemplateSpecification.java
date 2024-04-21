package  ma.zs.zyn.dao.specification.core.freetrial;

import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialStudentEmailTemplateCriteria;
import ma.zs.zyn.bean.core.freetrial.FreeTrialStudentEmailTemplate;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class FreeTrialStudentEmailTemplateSpecification extends  AbstractSpecification<FreeTrialStudentEmailTemplateCriteria, FreeTrialStudentEmailTemplate>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("object", criteria.getObject(),criteria.getObjectLike());
        addPredicate("source", criteria.getSource(),criteria.getSourceLike());
    }

    public FreeTrialStudentEmailTemplateSpecification(FreeTrialStudentEmailTemplateCriteria criteria) {
        super(criteria);
    }

    public FreeTrialStudentEmailTemplateSpecification(FreeTrialStudentEmailTemplateCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
