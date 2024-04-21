package ma.zs.zyn.dao.facade.core.inscriptionref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.NiveauEtude;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.inscriptionref.NiveauEtude;
import java.util.List;


@Repository
public interface NiveauEtudeDao extends AbstractRepository<NiveauEtude,Long>  {
    NiveauEtude findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW NiveauEtude(item.id,item.libelle) FROM NiveauEtude item")
    List<NiveauEtude> findAllOptimized();

}
