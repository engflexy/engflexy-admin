package ma.zs.zyn.service.facade.admin.prof;

import java.util.List;
import ma.zs.zyn.bean.core.prof.ScheduleProf;
import ma.zs.zyn.dao.criteria.core.prof.ScheduleProfCriteria;
import ma.zs.zyn.zynerator.service.IService;
import ma.zs.zyn.zynerator.dto.ScheduleDto;


import java.time.LocalDateTime;

public interface ScheduleProfAdminService extends  IService<ScheduleProf,ScheduleProfCriteria>  {

    List<ScheduleProf> findByGroupeEtudiantId(Long id);
    int deleteByGroupeEtudiantId(Long id);
    long countByGroupeEtudiantId(Long id);
    List<ScheduleProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<ScheduleProf> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);


    List<ScheduleDto> findSchedule(LocalDateTime start, LocalDateTime end);


}
