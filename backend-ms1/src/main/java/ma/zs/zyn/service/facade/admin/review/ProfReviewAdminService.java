package ma.zs.zyn.service.facade.admin.review;

import java.util.List;
import ma.zs.zyn.bean.core.review.ProfReview;
import ma.zs.zyn.dao.criteria.core.review.ProfReviewCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface ProfReviewAdminService extends  IService<ProfReview,ProfReviewCriteria>  {

    List<ProfReview> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);
    List<ProfReview> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<ProfReview> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);




}
