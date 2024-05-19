package ma.zs.alc.service.facade.collaborator.review;

import java.util.List;
import ma.zs.alc.bean.core.review.ProfReview;
import ma.zs.alc.dao.criteria.core.review.ProfReviewCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface ProfReviewCollaboratorService extends  IService<ProfReview,ProfReviewCriteria>  {

    List<ProfReview> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantId(Long id);
    List<ProfReview> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<ProfReview> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);




}
