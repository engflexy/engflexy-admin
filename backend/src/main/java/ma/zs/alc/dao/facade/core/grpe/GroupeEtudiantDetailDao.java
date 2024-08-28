package ma.zs.alc.dao.facade.core.grpe;

import ma.zs.alc.bean.core.grpe.GroupeEtudiantDetail;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface GroupeEtudiantDetailDao extends AbstractRepository<GroupeEtudiantDetail, Long> {

    List<GroupeEtudiantDetail> findByGroupeEtudiantId(Long id);

    int deleteByGroupeEtudiantId(Long id);

    long countByGroupeEtudiantId(Long id);

    List<GroupeEtudiantDetail> findByEtudiantId(Long id);
    List<GroupeEtudiantDetail> findByGroupeEtudiantProfUsername(String email);

    int deleteByEtudiantId(Long id);

    long countByEtudiantId(Long id);


}
