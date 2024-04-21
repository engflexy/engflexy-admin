package ma.zs.zyn.service.facade.admin.quizetudiant;

import java.util.List;
import ma.zs.zyn.bean.core.quizetudiant.QuizEtudiant;
import ma.zs.zyn.dao.criteria.core.quizetudiant.QuizEtudiantCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface QuizEtudiantAdminService extends  IService<QuizEtudiant,QuizEtudiantCriteria>  {

    List<QuizEtudiant> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);
    List<QuizEtudiant> findByQuizId(Long id);
    int deleteByQuizId(Long id);
    long countByQuizRef(String ref);




}
