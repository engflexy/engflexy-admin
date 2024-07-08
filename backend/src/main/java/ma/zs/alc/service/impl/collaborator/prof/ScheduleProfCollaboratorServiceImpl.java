package ma.zs.alc.service.impl.collaborator.prof;


import ma.zs.alc.bean.core.prof.ScheduleProf;
import ma.zs.alc.dao.criteria.core.prof.ScheduleEvent;
import ma.zs.alc.dao.criteria.core.prof.ScheduleProfCriteria;
import ma.zs.alc.dao.facade.core.prof.ScheduleProfDao;
import ma.zs.alc.dao.specification.core.prof.ScheduleProfSpecification;
import ma.zs.alc.service.facade.collaborator.course.CoursCollaboratorService;
import ma.zs.alc.service.facade.collaborator.grpe.GroupeEtudiantCollaboratorService;
import ma.zs.alc.service.facade.collaborator.prof.ProfCollaboratorService;
import ma.zs.alc.service.facade.collaborator.prof.ScheduleProfCollaboratorService;
import ma.zs.alc.zynerator.dto.ScheduleDto;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ScheduleProfCollaboratorServiceImpl extends AbstractServiceImpl<ScheduleProf, ScheduleProfCriteria, ScheduleProfDao> implements ScheduleProfCollaboratorService {


    public void findOrSaveAssociatedObject(ScheduleProf t) {
        if (t != null) {
            t.setGroupeEtudiant(groupeEtudiantService.findOrSave(t.getGroupeEtudiant()));
            t.setProf(profService.findOrSave(t.getProf()));
            t.setCours(coursService.findOrSave(t.getCours()));
        }
    }


    @Override
    public Page<ScheduleProf> findByProfCollaboratorId(Long id, Pageable pageable) {
        return dao.findByProfCollaboratorId(id, pageable);
    }

    public List<ScheduleProf> findByGroupeEtudiantId(Long id) {
        return dao.findByGroupeEtudiantId(id);
    }

    public int deleteByGroupeEtudiantId(Long id) {
        return dao.deleteByGroupeEtudiantId(id);
    }

    public long countByGroupeEtudiantId(Long id) {
        return dao.countByGroupeEtudiantId(id);
    }

    public List<ScheduleProf> findByProfId(Long id) {
        return dao.findByProfId(id);
    }

    public int deleteByProfId(Long id) {
        return dao.deleteByProfId(id);
    }

    public long countByProfRef(String ref) {
        return dao.countByProfRef(ref);
    }

    public List<ScheduleProf> findByCoursId(Long id) {
        return dao.findByCoursId(id);
    }

    public int deleteByCoursId(Long id) {
        return dao.deleteByCoursId(id);
    }

    public long countByCoursCode(String code) {
        return dao.countByCoursCode(code);
    }

    @Override
    public List<ScheduleEvent> get_schedules_between(Long id, LocalDateTime start, LocalDateTime end, Long profId, Long groupId) {
        if (profId != 0 && groupId != 0)
            return dao.get_collaborator_schedules_between_by_prof_and_group(id, start, end, profId, groupId);
        else if (groupId != 0) return dao.get_collaborator_schedules_between_by_group(id, start, end, groupId);
        else if (profId != 0) return dao.get_collaborator_schedules_between_by_prof(id, start, end, profId);
        else return dao.get_collaborator_schedules_between(id, start, end);
    }

    @Override
    public List<ScheduleEvent> get_group_schedules_between(Long id, LocalDateTime start, LocalDateTime end) {
        return dao.get_group_schedules_between(id, start, end);
    }

    public List<ScheduleProf> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public List<ScheduleDto> findSchedule(LocalDateTime start, LocalDateTime end) {
        List<ScheduleDto> results = dao.findSchedule(start, end);
        return results;
    }

    @Override
    public Long getSessionId(Long course, Long group) {
        return dao.getSessionId(course, group);
    }

    public List<ScheduleProf> get_all_finished_lesson_by_group(Long group) {
        return dao.findByGroupeEtudiantIdAndCourseFinishedOrderByCoursNumeroOrder(group, true);
    }

    public ScheduleProf get_nearest_lesson(Long id) {
        //we minus 1h to show the lesson even after he passed be 1 hour
        LocalDateTime currentTime = LocalDateTime.now().minusHours(1);
        return dao.get_nearest_lesson(id, currentTime);
    }

    public ScheduleProf get_nearest_lesson_for_student(Long id) {
        //we minus 1h to show the lesson even after he passed be 1 hour
        LocalDateTime currentTime = LocalDateTime.now().minusHours(1);
        return dao.get_nearest_lesson_for_student(id, currentTime);
    }

    @Override
    public boolean updateScheduleTime(ScheduleProf dto) {
        ScheduleProf saved = findById(dto.getId());
        saved.setStartTime(dto.getStartTime());
        saved.setEndTime(dto.getEndTime());
        dao.save(saved);
        return true;
    }

    public void configure() {
        super.configure(ScheduleProf.class, ScheduleProfSpecification.class);
    }


    @Autowired
    private GroupeEtudiantCollaboratorService groupeEtudiantService;
    @Autowired
    private CoursCollaboratorService coursService;
    @Autowired
    private ProfCollaboratorService profService;

    public ScheduleProfCollaboratorServiceImpl(ScheduleProfDao dao) {
        super(dao);
    }

}
