package ma.zs.zyn.dao.facade.core.freetrial;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.freetrial.Services;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.freetrial.Services;
import java.util.List;


@Repository
public interface ServicesDao extends AbstractRepository<Services,Long>  {
    Services findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW Services(item.id,item.libelle) FROM Services item")
    List<Services> findAllOptimized();

}
