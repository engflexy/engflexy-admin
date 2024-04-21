package ma.zs.zyn.service.facade.admin.quiz;

import java.util.List;
import ma.zs.zyn.bean.core.quiz.Reponse;
import ma.zs.zyn.dao.criteria.core.quiz.ReponseCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface ReponseAdminService extends  IService<Reponse,ReponseCriteria>  {

    List<Reponse> findByQuestionId(Long id);
    int deleteByQuestionId(Long id);
    long countByQuestionLibelle(String libelle);




}
