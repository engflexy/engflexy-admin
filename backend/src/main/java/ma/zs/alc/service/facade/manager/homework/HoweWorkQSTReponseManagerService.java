package ma.zs.alc.service.facade.manager.homework;

import ma.zs.alc.bean.core.homework.HoweWorkQSTReponse;
import ma.zs.alc.dao.criteria.core.homework.HoweWorkQSTReponseCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;



public interface HoweWorkQSTReponseManagerService extends  IService<HoweWorkQSTReponse,HoweWorkQSTReponseCriteria>  {

    List<HoweWorkQSTReponse> findByHomeWorkQuestionId(Long id);
    int deleteByHomeWorkQuestionId(Long id);
    long countByHomeWorkQuestionRef(String ref);




}
