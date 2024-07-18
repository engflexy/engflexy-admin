package ma.zs.alc.service.facade.admin.learning;

import java.util.List;

import com.linecorp.armeria.server.annotation.Param;
import ma.zs.alc.bean.core.learning.SessionCours;
import ma.zs.alc.dao.criteria.core.learning.SessionCoursCriteria;
import ma.zs.alc.dao.criteria.core.salary.SessionSalary;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


public interface SessionCoursAdminService extends  IService<SessionCours,SessionCoursCriteria>  {

    List<SessionCours> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<SessionCours> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);
    List<SessionCours> findByGroupeEtudiantId(Long id);
    int deleteByGroupeEtudiantId(Long id);
    long countByGroupeEtudiantId(Long id);
    List<SessionCours> findBySalaryId(Long id);
    int deleteBySalaryId(Long id);
    long countBySalaryCode(String code);
    Page<SessionSalary> findBySalaryId(Long id, Pageable pageable);




}
