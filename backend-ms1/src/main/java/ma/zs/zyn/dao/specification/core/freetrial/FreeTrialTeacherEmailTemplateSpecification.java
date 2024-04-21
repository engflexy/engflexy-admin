package  ma.zs.zyn.dao.specification.core.freetrial;

import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialTeacherEmailTemplateCriteria;
import ma.zs.zyn.bean.core.freetrial.FreeTrialTeacherEmailTemplate;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class FreeTrialTeacherEmailTemplateSpecification extends  AbstractSpecification<FreeTrialTeacherEmailTemplateCriteria, FreeTrialTeacherEmailTemplate>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("object", criteria.getObject(),criteria.getObjectLike());
        addPredicate("source", criteria.getSource(),criteria.getSourceLike());
    }

    public FreeTrialTeacherEmailTemplateSpecification(FreeTrialTeacherEmailTemplateCriteria criteria) {
        super(criteria);
    }

    public FreeTrialTeacherEmailTemplateSpecification(FreeTrialTeacherEmailTemplateCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
