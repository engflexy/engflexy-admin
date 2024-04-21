package ma.zs.zyn.dao.facade.core.grpe;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.grpe.GroupeType;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.grpe.GroupeType;
import java.util.List;


@Repository
public interface GroupeTypeDao extends AbstractRepository<GroupeType,Long>  {
    GroupeType findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW GroupeType(item.id,item.libelle) FROM GroupeType item")
    List<GroupeType> findAllOptimized();

}
