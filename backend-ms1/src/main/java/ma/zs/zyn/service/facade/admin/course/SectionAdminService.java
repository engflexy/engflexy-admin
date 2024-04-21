package ma.zs.zyn.service.facade.admin.course;

import java.util.List;
import ma.zs.zyn.bean.core.course.Section;
import ma.zs.zyn.dao.criteria.core.course.SectionCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface SectionAdminService extends  IService<Section,SectionCriteria>  {

    List<Section> findByCategorieSectionId(Long id);
    int deleteByCategorieSectionId(Long id);
    long countByCategorieSectionCode(String code);
    List<Section> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);




}
