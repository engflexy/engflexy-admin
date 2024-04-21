package ma.zs.zyn.dao.facade.core.common;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.common.ClassAverageBonus;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.common.ClassAverageBonus;
import java.util.List;


@Repository
public interface ClassAverageBonusDao extends AbstractRepository<ClassAverageBonus,Long>  {
    ClassAverageBonus findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW ClassAverageBonus(item.id,item.code) FROM ClassAverageBonus item")
    List<ClassAverageBonus> findAllOptimized();

}
