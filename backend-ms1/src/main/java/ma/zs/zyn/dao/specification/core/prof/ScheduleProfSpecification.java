package  ma.zs.zyn.dao.specification.core.prof;

import ma.zs.zyn.dao.criteria.core.prof.ScheduleProfCriteria;
import ma.zs.zyn.bean.core.prof.ScheduleProf;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class ScheduleProfSpecification extends  AbstractSpecification<ScheduleProfCriteria, ScheduleProf>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("subject", criteria.getSubject(),criteria.getSubjectLike());
        addPredicate("startTime", criteria.getStartTime(), criteria.getStartTimeFrom(), criteria.getStartTimeTo());
        addPredicate("endTime", criteria.getEndTime(), criteria.getEndTimeFrom(), criteria.getEndTimeTo());
        addPredicate("ref", criteria.getRef(),criteria.getRefLike());
        addPredicate("grpName", criteria.getGrpName(),criteria.getGrpNameLike());
        addPredicate("profName", criteria.getProfName(),criteria.getProfNameLike());
        addPredicateLong("profsId", criteria.getProfsId(), criteria.getProfsIdMin(), criteria.getProfsIdMax());
        addPredicateBool("courseFinished", criteria.getCourseFinished());
        addPredicateFk("groupeEtudiant","id", criteria.getGroupeEtudiant()==null?null:criteria.getGroupeEtudiant().getId());
        addPredicateFk("groupeEtudiant","id", criteria.getGroupeEtudiants());
        addPredicateFk("prof","id", criteria.getProf()==null?null:criteria.getProf().getId());
        addPredicateFk("prof","id", criteria.getProfs());
        addPredicateFk("prof","ref", criteria.getProf()==null?null:criteria.getProf().getRef());
        addPredicateFk("cours","id", criteria.getCours()==null?null:criteria.getCours().getId());
        addPredicateFk("cours","id", criteria.getCourss());
        addPredicateFk("cours","code", criteria.getCours()==null?null:criteria.getCours().getCode());
    }

    public ScheduleProfSpecification(ScheduleProfCriteria criteria) {
        super(criteria);
    }

    public ScheduleProfSpecification(ScheduleProfCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
