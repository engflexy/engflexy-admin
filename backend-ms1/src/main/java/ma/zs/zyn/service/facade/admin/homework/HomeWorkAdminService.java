package ma.zs.zyn.service.facade.admin.homework;

import java.util.List;
import ma.zs.zyn.bean.core.homework.HomeWork;
import ma.zs.zyn.dao.criteria.core.homework.HomeWorkCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface HomeWorkAdminService extends  IService<HomeWork,HomeWorkCriteria>  {

    List<HomeWork> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);
    List<HomeWork> findByTypeHomeWorkId(Long id);
    int deleteByTypeHomeWorkId(Long id);
    long countByTypeHomeWorkCode(String code);




}
