package ma.zs.zyn.dao.facade.core.faq;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.faq.FaqType;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface FaqTypeDao extends AbstractRepository<FaqType,Long>  {


    @Query("SELECT NEW FaqType(item.id,item.libelle) FROM FaqType item")
    List<FaqType> findAllOptimized();

}
