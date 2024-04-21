package ma.zs.zyn.service.facade.admin.homework;

import java.util.List;
import ma.zs.zyn.bean.core.homework.ReponseEtudiantHomeWork;
import ma.zs.zyn.dao.criteria.core.homework.ReponseEtudiantHomeWorkCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface ReponseEtudiantHomeWorkAdminService extends  IService<ReponseEtudiantHomeWork,ReponseEtudiantHomeWorkCriteria>  {

    List<ReponseEtudiantHomeWork> findByHoweWorkQSTReponseId(Long id);
    int deleteByHoweWorkQSTReponseId(Long id);
    long countByHoweWorkQSTReponseRef(String ref);
    List<ReponseEtudiantHomeWork> findByHomeWorkEtudiantId(Long id);
    int deleteByHomeWorkEtudiantId(Long id);
    long countByHomeWorkEtudiantId(Long id);
    List<ReponseEtudiantHomeWork> findByHomeWorkQuestionId(Long id);
    int deleteByHomeWorkQuestionId(Long id);
    long countByHomeWorkQuestionRef(String ref);




}
