package ma.zs.alc.dao.facade.core.inscriptionref;

import ma.zs.alc.bean.core.inscriptionref.EtatInscription;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface EtatInscriptionDao extends AbstractRepository<EtatInscription, Long> {
    EtatInscription findByLibelle(String libelle);

    int deleteByLibelle(String libelle);


    @Query("SELECT NEW EtatInscription(item.id,item.libelle) FROM EtatInscription item")
    List<EtatInscription> findAllOptimized();

    EtatInscription findByRef(String ref);
}
