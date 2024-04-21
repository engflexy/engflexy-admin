package ma.zs.zyn.service.facade.admin.quizetudiant;

import java.util.List;
import ma.zs.zyn.bean.core.quizetudiant.ReponseEtudiant;
import ma.zs.zyn.dao.criteria.core.quizetudiant.ReponseEtudiantCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface ReponseEtudiantAdminService extends  IService<ReponseEtudiant,ReponseEtudiantCriteria>  {

    List<ReponseEtudiant> findByReponseId(Long id);
    int deleteByReponseId(Long id);
    long countByReponseRef(String ref);
    List<ReponseEtudiant> findByQuizEtudiantId(Long id);
    int deleteByQuizEtudiantId(Long id);
    long countByQuizEtudiantRef(String ref);
    List<ReponseEtudiant> findByQuestionId(Long id);
    int deleteByQuestionId(Long id);
    long countByQuestionLibelle(String libelle);




}
