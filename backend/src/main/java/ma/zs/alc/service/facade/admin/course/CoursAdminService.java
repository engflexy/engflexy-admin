package ma.zs.alc.service.facade.admin.course;

import java.util.List;
import ma.zs.alc.bean.core.course.Cours;
import ma.zs.alc.dao.criteria.core.course.CoursCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface CoursAdminService extends  IService<Cours,CoursCriteria>  {

    List<Cours> findByParcoursId(Long id);
    int deleteByParcoursId(Long id);
    long countByParcoursCode(String code);


    Cours findByCode(String code);
}
