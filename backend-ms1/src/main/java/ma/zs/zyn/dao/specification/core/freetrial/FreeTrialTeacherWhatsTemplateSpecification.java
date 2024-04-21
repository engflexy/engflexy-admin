package  ma.zs.zyn.dao.specification.core.freetrial;

import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialTeacherWhatsTemplateCriteria;
import ma.zs.zyn.bean.core.freetrial.FreeTrialTeacherWhatsTemplate;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class FreeTrialTeacherWhatsTemplateSpecification extends  AbstractSpecification<FreeTrialTeacherWhatsTemplateCriteria, FreeTrialTeacherWhatsTemplate>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("object", criteria.getObject(),criteria.getObjectLike());
        addPredicate("source", criteria.getSource(),criteria.getSourceLike());
    }

    public FreeTrialTeacherWhatsTemplateSpecification(FreeTrialTeacherWhatsTemplateCriteria criteria) {
        super(criteria);
    }

    public FreeTrialTeacherWhatsTemplateSpecification(FreeTrialTeacherWhatsTemplateCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
