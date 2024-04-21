package  ma.zs.zyn.dao.specification.core.freetrial;

import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialStudentWhatsTemplateCriteria;
import ma.zs.zyn.bean.core.freetrial.FreeTrialStudentWhatsTemplate;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class FreeTrialStudentWhatsTemplateSpecification extends  AbstractSpecification<FreeTrialStudentWhatsTemplateCriteria, FreeTrialStudentWhatsTemplate>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("object", criteria.getObject(),criteria.getObjectLike());
        addPredicate("source", criteria.getSource(),criteria.getSourceLike());
    }

    public FreeTrialStudentWhatsTemplateSpecification(FreeTrialStudentWhatsTemplateCriteria criteria) {
        super(criteria);
    }

    public FreeTrialStudentWhatsTemplateSpecification(FreeTrialStudentWhatsTemplateCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
