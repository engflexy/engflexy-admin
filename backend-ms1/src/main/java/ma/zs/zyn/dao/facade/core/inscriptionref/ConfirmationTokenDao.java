package ma.zs.zyn.dao.facade.core.inscriptionref;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.ConfirmationToken;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface ConfirmationTokenDao extends AbstractRepository<ConfirmationToken,Long>  {

    List<ConfirmationToken> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);


}
