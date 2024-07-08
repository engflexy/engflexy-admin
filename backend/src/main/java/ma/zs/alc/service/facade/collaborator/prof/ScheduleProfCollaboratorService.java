package ma.zs.alc.service.facade.collaborator.prof;

import ma.zs.alc.bean.core.prof.ScheduleProf;
import ma.zs.alc.dao.criteria.core.prof.ScheduleEvent;
import ma.zs.alc.dao.criteria.core.prof.ScheduleProfCriteria;
import ma.zs.alc.zynerator.dto.ScheduleDto;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public interface ScheduleProfCollaboratorService extends IService<ScheduleProf, ScheduleProfCriteria> {

    Page<ScheduleProf> findByProfCollaboratorId(int id, Pageable pageable);
    List<ScheduleProf> findByGroupeEtudiantId(Long id);

    int deleteByGroupeEtudiantId(Long id);

    long countByGroupeEtudiantId(Long id);

    List<ScheduleProf> findByProfId(Long id);

    int deleteByProfId(Long id);

    long countByProfRef(String ref);

    List<ScheduleProf> findByCoursId(Long id);

    int deleteByCoursId(Long id);

    long countByCoursCode(String code);

    public List<ScheduleEvent> get_schedules_between(Long id, LocalDateTime start, LocalDateTime end);

    public List<ScheduleEvent> get_group_schedules_between(Long id, LocalDateTime start, LocalDateTime end);

    List<ScheduleDto> findSchedule(LocalDateTime start, LocalDateTime end);

    public Long getSessionId(Long course, Long group);

    public List<ScheduleProf> get_all_finished_lesson_by_group(Long group);

    public ScheduleProf get_nearest_lesson(Long id);

    public ScheduleProf get_nearest_lesson_for_student(Long id);
}
