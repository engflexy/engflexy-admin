package  ma.zs.zyn.dao.specification.core.inscriptionref;

import ma.zs.zyn.dao.criteria.core.inscriptionref.EtatEtudiantScheduleCriteria;
import ma.zs.zyn.bean.core.inscriptionref.EtatEtudiantSchedule;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class EtatEtudiantScheduleSpecification extends  AbstractSpecification<EtatEtudiantScheduleCriteria, EtatEtudiantSchedule>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public EtatEtudiantScheduleSpecification(EtatEtudiantScheduleCriteria criteria) {
        super(criteria);
    }

    public EtatEtudiantScheduleSpecification(EtatEtudiantScheduleCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
