package  ma.zs.zyn.dao.specification.core.freetrial;

import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialConfigurationCriteria;
import ma.zs.zyn.bean.core.freetrial.FreeTrialConfiguration;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class FreeTrialConfigurationSpecification extends  AbstractSpecification<FreeTrialConfigurationCriteria, FreeTrialConfiguration>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("dateApplicationDebut", criteria.getDateApplicationDebut(), criteria.getDateApplicationDebutFrom(), criteria.getDateApplicationDebutTo());
        addPredicate("dateApplicationFin", criteria.getDateApplicationFin(), criteria.getDateApplicationFinFrom(), criteria.getDateApplicationFinTo());
        addPredicateInt("nombreStudentMax", criteria.getNombreStudentMax(), criteria.getNombreStudentMaxMin(), criteria.getNombreStudentMaxMax());
        addPredicateInt("nombreStudentMin", criteria.getNombreStudentMin(), criteria.getNombreStudentMinMin(), criteria.getNombreStudentMinMax());
    }

    public FreeTrialConfigurationSpecification(FreeTrialConfigurationCriteria criteria) {
        super(criteria);
    }

    public FreeTrialConfigurationSpecification(FreeTrialConfigurationCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
