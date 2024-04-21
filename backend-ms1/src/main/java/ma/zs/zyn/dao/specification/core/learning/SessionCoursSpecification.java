package  ma.zs.zyn.dao.specification.core.learning;

import ma.zs.zyn.dao.criteria.core.learning.SessionCoursCriteria;
import ma.zs.zyn.bean.core.learning.SessionCours;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class SessionCoursSpecification extends  AbstractSpecification<SessionCoursCriteria, SessionCours>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("reference", criteria.getReference(),criteria.getReferenceLike());
        addPredicateBigDecimal("duree", criteria.getDuree(), criteria.getDureeMin(), criteria.getDureeMax());
        addPredicateBigDecimal("totalheure", criteria.getTotalheure(), criteria.getTotalheureMin(), criteria.getTotalheureMax());
        addPredicateBigDecimal("mois", criteria.getMois(), criteria.getMoisMin(), criteria.getMoisMax());
        addPredicateBigDecimal("annee", criteria.getAnnee(), criteria.getAnneeMin(), criteria.getAnneeMax());
        addPredicate("dateFin", criteria.getDateFin(), criteria.getDateFinFrom(), criteria.getDateFinTo());
        addPredicate("dateDebut", criteria.getDateDebut(), criteria.getDateDebutFrom(), criteria.getDateDebutTo());
        addPredicateBool("payer", criteria.getPayer());
        addPredicateLong("nreKeySectionFinished", criteria.getNreKeySectionFinished(), criteria.getNreKeySectionFinishedMin(), criteria.getNreKeySectionFinishedMax());
        addPredicateLong("nreAddSectionFinished", criteria.getNreAddSectionFinished(), criteria.getNreAddSectionFinishedMin(), criteria.getNreAddSectionFinishedMax());
        addPredicateLong("totalKeySection", criteria.getTotalKeySection(), criteria.getTotalKeySectionMin(), criteria.getTotalKeySectionMax());
        addPredicateLong("totalAddSection", criteria.getTotalAddSection(), criteria.getTotalAddSectionMin(), criteria.getTotalAddSectionMax());
        addPredicateLong("nreWords", criteria.getNreWords(), criteria.getNreWordsMin(), criteria.getNreWordsMax());
        addPredicateBool("homeworkFinished", criteria.getHomeworkFinished());
        addPredicateBool("courseFinished", criteria.getCourseFinished());
        addPredicateFk("prof","id", criteria.getProf()==null?null:criteria.getProf().getId());
        addPredicateFk("prof","id", criteria.getProfs());
        addPredicateFk("prof","ref", criteria.getProf()==null?null:criteria.getProf().getRef());
        addPredicateFk("cours","id", criteria.getCours()==null?null:criteria.getCours().getId());
        addPredicateFk("cours","id", criteria.getCourss());
        addPredicateFk("cours","code", criteria.getCours()==null?null:criteria.getCours().getCode());
        addPredicateFk("groupeEtudiant","id", criteria.getGroupeEtudiant()==null?null:criteria.getGroupeEtudiant().getId());
        addPredicateFk("groupeEtudiant","id", criteria.getGroupeEtudiants());
        addPredicateFk("salary","id", criteria.getSalary()==null?null:criteria.getSalary().getId());
        addPredicateFk("salary","id", criteria.getSalarys());
        addPredicateFk("salary","code", criteria.getSalary()==null?null:criteria.getSalary().getCode());
    }

    public SessionCoursSpecification(SessionCoursCriteria criteria) {
        super(criteria);
    }

    public SessionCoursSpecification(SessionCoursCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
