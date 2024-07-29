package ma.zs.alc.service.facade.manager.homework;

import ma.zs.alc.bean.core.homework.HomeWork;
import ma.zs.alc.dao.criteria.core.homework.HomeWorkCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;



public interface HomeWorkManagerService extends  IService<HomeWork,HomeWorkCriteria>  {

    List<HomeWork> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);
    List<HomeWork> findByTypeHomeWorkId(Long id);
    int deleteByTypeHomeWorkId(Long id);
    long countByTypeHomeWorkCode(String code);




}
