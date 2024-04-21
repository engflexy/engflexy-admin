package ma.zs.zyn.service.facade.admin.homework;

import java.util.List;
import ma.zs.zyn.bean.core.homework.HoweWorkQSTReponse;
import ma.zs.zyn.dao.criteria.core.homework.HoweWorkQSTReponseCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface HoweWorkQSTReponseAdminService extends  IService<HoweWorkQSTReponse,HoweWorkQSTReponseCriteria>  {

    List<HoweWorkQSTReponse> findByHomeWorkQuestionId(Long id);
    int deleteByHomeWorkQuestionId(Long id);
    long countByHomeWorkQuestionRef(String ref);




}
