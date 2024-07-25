package ma.zs.alc.service.facade.manager.inscriptionref;

import java.util.List;
import ma.zs.alc.bean.core.inscriptionref.EtudiantReview;
import ma.zs.alc.dao.criteria.core.inscriptionref.EtudiantReviewCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface EtudiantReviewManagerService extends  IService<EtudiantReview,EtudiantReviewCriteria>  {

    List<EtudiantReview> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantId(Long id);
    List<EtudiantReview> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<EtudiantReview> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);




}
