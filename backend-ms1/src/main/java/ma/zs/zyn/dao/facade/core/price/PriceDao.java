package ma.zs.zyn.dao.facade.core.price;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.price.Price;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface PriceDao extends AbstractRepository<Price,Long>  {


    @Query("SELECT NEW Price(item.id,item.lib) FROM Price item")
    List<Price> findAllOptimized();

}
