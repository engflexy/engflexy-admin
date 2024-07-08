package ma.zs.alc.dao.facade.core.prof;

import ma.zs.alc.bean.core.prof.ScheduleProf;
import ma.zs.alc.dao.criteria.core.prof.ScheduleEvent;
import ma.zs.alc.zynerator.dto.ScheduleDto;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ScheduleProfDao extends AbstractRepository<ScheduleProf, Long> {

    List<ScheduleProf> findByGroupeEtudiantId(Long id);

    int deleteByGroupeEtudiantId(Long id);

    long countByGroupeEtudiantId(Long id);

    List<ScheduleProf> findByProfId(Long id);

    int deleteByProfId(Long id);

    long countByProfRef(String ref);

    List<ScheduleProf> findByCoursId(Long id);

    int deleteByCoursId(Long id);

    long countByCoursCode(String code);

    Page<ScheduleProf> findByGroupeEtudiantIdAndCourseFinishedOrderByStartTime(Long id, boolean finished, Pageable pageable);

    List<ScheduleProf> findByGroupeEtudiantIdAndCourseFinishedOrderByCoursNumeroOrder(Long id, boolean finished);

    Page<ScheduleProf> findByGroupeEtudiantProfIdOrderByStartTime(Long id, Pageable pageable);

    Page<ScheduleProf> findByGroupeEtudiantProfIdAndCourseFinishedOrderByStartTime(Long id, boolean finished, Pageable pageable);

    @Query("select e.id from ScheduleProf e where e.groupeEtudiant.id=:group and e.cours.id=:course")
    Long getSessionId(@Param("course") Long course, @Param("group") Long group);


    @Query("SELECT NEW ScheduleProf(item.id,item.subject) FROM ScheduleProf item")
    List<ScheduleProf> findAllOptimized();

    @Query("SELECT NEW ma.zs.alc.zynerator.dto.ScheduleDto(s.subject, s.startTime, s.endTime ,s.id) from ScheduleProf s where s.startTime >= :start and s.endTime <= :end")
    List<ScheduleDto> findSchedule(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);


    @Query(value = "SELECT * FROM schedule_prof WHERE prof=:id AND start_time > :currentTime ORDER BY start_time ASC LIMIT 1", nativeQuery = true)
    ScheduleProf get_nearest_lesson(@Param("id") Long id, @Param("currentTime") LocalDateTime currentTime);


    @Query(value = "SELECT * FROM schedule_prof WHERE groupe_etudiant=:id AND start_time > :currentTime ORDER BY start_time ASC LIMIT 1", nativeQuery = true)
    ScheduleProf get_nearest_lesson_for_student(@Param("id") Long id, @Param("currentTime") LocalDateTime currentTime);


    @Query("select new ma.zs.alc.dao.criteria.core.prof.ScheduleEvent(s)" +
            " from ScheduleProf s " +
            "where  s.startTime>=:start and s.endTime <=:end and s.prof.collaborator.id=:id")
    List<ScheduleEvent> get_schedules_between(@Param("id") Long id,
                                              @Param("start") LocalDateTime start,
                                              @Param("end") LocalDateTime end);
    Page<ScheduleProf> findByProfCollaboratorId(int id, Pageable pageable);

    @Query("select s" +
            " from ScheduleProf s " +
            "where  s.startTime>=:start and s.startTime <=:end")
    List<ScheduleProf> getAll_started_schedules_between(@Param("start") LocalDateTime start,
                                                        @Param("end") LocalDateTime end);

    @Query("select new ma.zs.alc.dao.criteria.core.prof.ScheduleEvent(s)" +
            " from ScheduleProf s " +
            "where  s.startTime>=:start and s.endTime <=:end and s.groupeEtudiant.id=:id")
    List<ScheduleEvent> get_group_schedules_between(@Param("id") Long id,
                                                    @Param("start") LocalDateTime start,
                                                    @Param("end") LocalDateTime end);
}
