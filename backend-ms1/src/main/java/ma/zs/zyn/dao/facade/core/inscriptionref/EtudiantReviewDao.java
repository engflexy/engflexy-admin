package ma.zs.zyn.dao.facade.core.inscriptionref;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.EtudiantReview;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface EtudiantReviewDao extends AbstractRepository<EtudiantReview,Long>  {

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
