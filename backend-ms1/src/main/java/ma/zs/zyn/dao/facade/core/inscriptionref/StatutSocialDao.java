package ma.zs.zyn.dao.facade.core.inscriptionref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.StatutSocial;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.inscriptionref.StatutSocial;
import java.util.List;


@Repository
public interface StatutSocialDao extends AbstractRepository<StatutSocial,Long>  {
    StatutSocial findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW StatutSocial(item.id,item.libelle) FROM StatutSocial item")
    List<StatutSocial> findAllOptimized();

}
