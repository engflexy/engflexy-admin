package ma.zs.alc.dao.facade.core.learning;

import ma.zs.alc.bean.core.learning.SessionCours;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface SessionCoursDao extends AbstractRepository<SessionCours, Long> {
    SessionCours findByReference(String reference);

    int deleteByReference(String reference);

    List<SessionCours> findByProfId(Long id);

    int deleteByProfId(Long id);

    long countByProfRef(String ref);

    List<SessionCours> findByCoursId(Long id);

    int deleteByCoursId(Long id);

    long countByCoursCode(String code);

    List<SessionCours> findByGroupeEtudiantId(Long id);

    int deleteByGroupeEtudiantId(Long id);

    long countByGroupeEtudiantId(Long id);

    List<SessionCours> findBySalaryId(Long id);

    int deleteBySalaryId(Long id);

    long countBySalaryCode(String code);
    long countBySalaryId(Long id);

    @Query("SELECT NEW SessionCours(item.id,item.reference) FROM SessionCours item")
    List<SessionCours> findAllOptimized();

}
