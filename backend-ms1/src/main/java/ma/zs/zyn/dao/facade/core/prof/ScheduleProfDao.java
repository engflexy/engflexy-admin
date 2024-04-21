package ma.zs.zyn.dao.facade.core.prof;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.prof.ScheduleProf;
import org.springframework.stereotype.Repository;
import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.Query;
import java.time.LocalDateTime;
import ma.zs.zyn.zynerator.dto.ScheduleDto;

@Repository
public interface ScheduleProfDao extends AbstractRepository<ScheduleProf,Long>  {

    List<ScheduleProf> findByGroupeEtudiantId(Long id);
    int deleteByGroupeEtudiantId(Long id);
    long countByGroupeEtudiantId(Long id);
    List<ScheduleProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<ScheduleProf> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);

    @Query("SELECT NEW ScheduleProf(item.id,item.subject) FROM ScheduleProf item")
    List<ScheduleProf> findAllOptimized();

    @Query("SELECT NEW ma.zs.zyn.zynerator.dto.ScheduleDto(s.subject, s.startTime, s.endTime ,s.id) from ScheduleProf s where s.startTime >= :start and s.endTime <= :end")
    List<ScheduleDto> findSchedule(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);
}
