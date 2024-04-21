package ma.zs.zyn.service.facade.admin.inscriptionref;

import java.util.List;
import ma.zs.zyn.bean.core.inscriptionref.EtudiantReview;
import ma.zs.zyn.dao.criteria.core.inscriptionref.EtudiantReviewCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface EtudiantReviewAdminService extends  IService<EtudiantReview,EtudiantReviewCriteria>  {

    List<EtudiantReview> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);
    List<EtudiantReview> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<EtudiantReview> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);




}
