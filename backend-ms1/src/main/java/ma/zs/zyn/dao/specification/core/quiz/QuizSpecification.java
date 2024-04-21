package  ma.zs.zyn.dao.specification.core.quiz;

import ma.zs.zyn.dao.criteria.core.quiz.QuizCriteria;
import ma.zs.zyn.bean.core.quiz.Quiz;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class QuizSpecification extends  AbstractSpecification<QuizCriteria, Quiz>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("ref", criteria.getRef(),criteria.getRefLike());
        addPredicate("lib", criteria.getLib(),criteria.getLibLike());
        addPredicate("dateDebut", criteria.getDateDebut(), criteria.getDateDebutFrom(), criteria.getDateDebutTo());
        addPredicate("dateFin", criteria.getDateFin(), criteria.getDateFinFrom(), criteria.getDateFinTo());
        addPredicateLong("numero", criteria.getNumero(), criteria.getNumeroMin(), criteria.getNumeroMax());
        addPredicateLong("seuilReussite", criteria.getSeuilReussite(), criteria.getSeuilReussiteMin(), criteria.getSeuilReussiteMax());
        addPredicateFk("section","id", criteria.getSection()==null?null:criteria.getSection().getId());
        addPredicateFk("section","id", criteria.getSections());
        addPredicateFk("section","code", criteria.getSection()==null?null:criteria.getSection().getCode());
    }

    public QuizSpecification(QuizCriteria criteria) {
        super(criteria);
    }

    public QuizSpecification(QuizCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
