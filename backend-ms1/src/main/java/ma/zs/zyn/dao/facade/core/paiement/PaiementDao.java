package ma.zs.zyn.dao.facade.core.paiement;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.paiement.Paiement;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface PaiementDao extends AbstractRepository<Paiement,Long>  {

    List<Paiement> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<Paiement> findByGroupeEtudiantId(Long id);
    int deleteByGroupeEtudiantId(Long id);
    long countByGroupeEtudiantId(Long id);


}
