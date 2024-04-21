package ma.zs.zyn.service.facade.admin.course;

import java.util.List;
import ma.zs.zyn.bean.core.course.SectionItem;
import ma.zs.zyn.dao.criteria.core.course.SectionItemCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface SectionItemAdminService extends  IService<SectionItem,SectionItemCriteria>  {

    List<SectionItem> findBySectionId(Long id);
    int deleteBySectionId(Long id);
    long countBySectionCode(String code);




}
