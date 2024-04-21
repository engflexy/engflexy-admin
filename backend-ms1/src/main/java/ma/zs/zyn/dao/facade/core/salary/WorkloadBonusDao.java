package ma.zs.zyn.dao.facade.core.salary;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.salary.WorkloadBonus;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.salary.WorkloadBonus;
import java.util.List;


@Repository
public interface WorkloadBonusDao extends AbstractRepository<WorkloadBonus,Long>  {
    WorkloadBonus findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW WorkloadBonus(item.id,item.code) FROM WorkloadBonus item")
    List<WorkloadBonus> findAllOptimized();

}
