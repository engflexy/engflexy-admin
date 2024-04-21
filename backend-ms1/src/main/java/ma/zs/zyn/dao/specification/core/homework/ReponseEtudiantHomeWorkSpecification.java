package  ma.zs.zyn.dao.specification.core.homework;

import ma.zs.zyn.dao.criteria.core.homework.ReponseEtudiantHomeWorkCriteria;
import ma.zs.zyn.bean.core.homework.ReponseEtudiantHomeWork;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class ReponseEtudiantHomeWorkSpecification extends  AbstractSpecification<ReponseEtudiantHomeWorkCriteria, ReponseEtudiantHomeWork>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("answer", criteria.getAnswer(),criteria.getAnswerLike());
        addPredicate("profNote", criteria.getProfNote(),criteria.getProfNoteLike());
        addPredicateBigDecimal("note", criteria.getNote(), criteria.getNoteMin(), criteria.getNoteMax());
        addPredicateFk("howeWorkQSTReponse","id", criteria.getHoweWorkQSTReponse()==null?null:criteria.getHoweWorkQSTReponse().getId());
        addPredicateFk("howeWorkQSTReponse","id", criteria.getHoweWorkQSTReponses());
        addPredicateFk("howeWorkQSTReponse","ref", criteria.getHoweWorkQSTReponse()==null?null:criteria.getHoweWorkQSTReponse().getRef());
        addPredicateFk("homeWorkEtudiant","id", criteria.getHomeWorkEtudiant()==null?null:criteria.getHomeWorkEtudiant().getId());
        addPredicateFk("homeWorkEtudiant","id", criteria.getHomeWorkEtudiants());
        addPredicateFk("homeWorkQuestion","id", criteria.getHomeWorkQuestion()==null?null:criteria.getHomeWorkQuestion().getId());
        addPredicateFk("homeWorkQuestion","id", criteria.getHomeWorkQuestions());
        addPredicateFk("homeWorkQuestion","ref", criteria.getHomeWorkQuestion()==null?null:criteria.getHomeWorkQuestion().getRef());
    }

    public ReponseEtudiantHomeWorkSpecification(ReponseEtudiantHomeWorkCriteria criteria) {
        super(criteria);
    }

    public ReponseEtudiantHomeWorkSpecification(ReponseEtudiantHomeWorkCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
