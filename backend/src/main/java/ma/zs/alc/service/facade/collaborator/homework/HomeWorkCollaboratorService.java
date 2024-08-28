package ma.zs.alc.service.facade.collaborator.homework;

import java.util.List;

import ma.zs.alc.bean.core.homework.HomeWork;
import ma.zs.alc.dao.criteria.core.homework.HomeWorkCriteria;
import ma.zs.alc.ws.dto.homework.HomeWorkDto;
import ma.zs.alc.zynerator.service.IService;



public interface HomeWorkCollaboratorService extends  IService<HomeWork,HomeWorkCriteria>  {

    List<HomeWork> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);
    List<HomeWork> findByTypeHomeWorkId(Long id);
    int deleteByTypeHomeWorkId(Long id);
    long countByTypeHomeWorkCode(String code);

    HomeWork updateField(HomeWork homeWork);
}
