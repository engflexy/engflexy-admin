package ma.zs.zyn.service.facade.admin.course;

import java.util.List;
import ma.zs.zyn.bean.core.course.Cours;
import ma.zs.zyn.dao.criteria.core.course.CoursCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface CoursAdminService extends  IService<Cours,CoursCriteria>  {

    List<Cours> findByEtatCoursId(Long id);
    int deleteByEtatCoursId(Long id);
    long countByEtatCoursCode(String code);
    List<Cours> findByParcoursId(Long id);
    int deleteByParcoursId(Long id);
    long countByParcoursCode(String code);




}
