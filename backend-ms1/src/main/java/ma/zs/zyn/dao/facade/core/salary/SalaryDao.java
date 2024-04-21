package ma.zs.zyn.dao.facade.core.salary;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.salary.Salary;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.salary.Salary;
import java.util.List;


@Repository
public interface SalaryDao extends AbstractRepository<Salary,Long>  {
    Salary findByCode(String code);
    int deleteByCode(String code);

    List<Salary> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);

    @Query("SELECT NEW Salary(item.id,item.code) FROM Salary item")
    List<Salary> findAllOptimized();

}
